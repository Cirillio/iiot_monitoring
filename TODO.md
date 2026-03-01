
# Архитектура и план рефакторинга — IIoT Monitoring (Flutter)

## Текущее состояние (точка старта)

### Что есть и работает

```
lib/src/
├── core/
│   ├── network/
│   │   ├── api_client.dart           ← Dio + baseUrlProvider
│   │   └── signalr_service.dart      ← SignalRService, metricsStream, keepAlive
│   ├── storage/prefs_provider.dart
│   └── theme/
├── features/
│   ├── dashboard/
│   │   ├── data/
│   │   │   └── device_repository.dart    ← getDevices([limit]), возвращает List<Device>
│   │   └── presentation/
│   │       ├── controllers/
│   │       │   └── dashboard_controller.dart  ← AsyncNotifier<List<Device>>, getDevices(6)
│   │       └── widgets/
│   │           ├── device_card.dart      ← StatelessWidget, принимает Device
│   │           │                            навигация к DeviceDetailScreen
│   │           └── sensor_card.dart      ← StatefulWidget, принимает Sensor
│   │                                        + SensorStatusX extension (ЗДЕСЬ БАГ, 3 статуса)
│   └── device_detail/
│       ├── data/
│       │   └── mock_device_data.dart     ← моковые данные, не нужен в проде
│       ├── domain/
│       │   ├── sensor_status_ext.dart    ← SensorStatusExt on Sensor (5 статусов: normal,
│       │   │                                warning, critical, unknown, offline)
│       │   │                                БИЗНЕС-ЛОГИКА В DOMAIN — хорошо, но дублирует
│       │   └── device_summary_ext.dart   ← DeviceSummaryExt on Device (счётчики по статусу)
│       └── presentation/
│           ├── controllers/
│           │   └── device_detail_controller.dart  ← AsyncNotifier<Device>(deviceId),
│           │                                          читает dashboardControllerProvider
│           ├── device_detail_screen.dart  ← фильтры, список ExpandedSensorCard
│           └── widgets/
│               ├── device_detail_header.dart  ← принимает Device, показывает totalSensors
│               ├── device_summary_panel.dart  ← принимает okCount/alertCount
│               ├── expanded_sensor_card.dart  ← принимает Sensor, вычисляет статус inline
│               └── threshold_bar.dart         ← визуальная шкала уставок
└── shared/models/
    ├── device.dart          ← Freezed+JSON, содержит List<Sensor> sensors, int totalSensors
    ├── sensor.dart          ← Freezed+JSON, currentValue и lastSensorUpdated — runtime поля
    │                           (@JsonKey includeFromJson: false, включаются через copyWith)
    ├── sensor_ui_config.dart ← Freezed+JSON, пороги: minCritical/minWarning/maxWarning/maxCritical
    └── metric.dart          ← Freezed+JSON, sensorId/value/time/rawValue
```

### Как работает сейчас

`DashboardController.build()` загружает `List<Device>` — `getDevices(6)`. Запускает SignalR. При получении `Metric` — обновляет `Sensor.copyWith(currentValue, lastSensorUpdated)` и пересобирает `state = AsyncData(updatedDevices)`.

`DeviceDetailController(deviceId)` читает `dashboardControllerProvider` — реактивно получает обновления из SignalR без дополнительных запросов. Возвращает `Device`.

`SensorCard` вычисляет статус через `SensorStatusX extension on Sensor` (3 статуса: normal/critical/offline) — бизнес-логика в presentation.

`SensorStatusExt on Sensor` в `device_detail/domain/` — более полная версия (5 статусов: normal/warning/critical/unknown/offline), но дублирует логику. Называет `noConfig` как `unknown`.

`ExpandedSensorCard` вычисляет статус ещё раз inline, но только 3 варианта — дублирование и рассинхрон с `SensorStatusExt`.

### Проблемы

1. **Бизнес-логика в presentation** — `SensorStatusX` в `sensor_card.dart`, статус inline в `ExpandedSensorCard`
2. **Дублирование** — три разных места вычисляют статус: `SensorStatusX` (3 статуса), `SensorStatusExt` (5 статусов), `ExpandedSensorCard` inline (3 статуса). Все рассинхронизированы
3. **`unknown` vs `noConfig`** — в `sensor_status_ext.dart` это называется `unknown`, в нашей новой архитектуре `noConfig`. Нужна одна каноническая версия
4. **Нет гистерезиса** — датчик на граничном значении мерцает между статусами
5. **Нет `idle` статуса** — нет разницы между "данных ещё не было" и "датчик офлайн"
6. **Нет `alarmStartedAt`** — нигде не хранится время начала аларма
7. **Лимит в 6 устройств** — `getDevices(6)` в `DashboardController.build()`

---

## Целевая архитектура

### Слои

```
┌─────────────────────────────────────────────┐
│              Presentation Layer             │
│   DashboardScreen                           │
│   DeviceCard (ConsumerWidget)               │
│   SensorCard (принимает CalculatedSensor)   │
├─────────────────────────────────────────────┤
│               State Layer                   │
│   CalculatedDeviceNotifier (keepAlive)      │
│   заменяет: DashboardController             │
├─────────────────────────────────────────────┤
│               Domain Layer                  │
│   SensorEvaluator (чистый Dart)             │
│   SensorStatus enum                         │
│   SensorEvaluation, CalculatedSensor        │
│   DeviceSummary, CalculatedDevice           │
├─────────────────────────────────────────────┤
│               Data Layer                    │
│   DeviceRepository (без изменений)          │
│   DeviceMapper (новый)                      │
│   SignalRService (без изменений)            │
└─────────────────────────────────────────────┘
```

> `Device`, `Sensor`, `SensorUiConfig`, `Metric` —  **не меняются** . Они остаются как есть.

### Новые модели (Domain Layer — чистый Dart, без Flutter)

**`SensorStatus`** — enum:

```dart
enum SensorStatus { idle, normal, warning, critical, offline, noConfig }
// idle     — начальное состояние, данных ещё не поступало
// normal   — в норме
// warning  — пересёк предупредительный порог
// critical — пересёк критический порог
// offline  — метрики не поступают (нет value в метрике)
// noConfig — у датчика нет настроенных порогов в uiConfigJson
```

**`SensorEvaluation`** — Freezed, результат оценки одного датчика:

```dart
SensorEvaluation {
  SensorStatus status
  double? value            // текущее значение из последней метрики
  DateTime? alarmStartedAt // время начала аларма, null если normal/idle
  String? message          // человекочитаемое описание состояния
}
```

**`CalculatedSensor`** — Freezed, датчик + его оценка:

```dart
CalculatedSensor {
  Sensor sensor
  SensorEvaluation evaluation
}
```

**`DeviceSummary`** — Freezed, агрегированные счётчики по устройству:

```dart
DeviceSummary {
  int normalCount
  int warningCount
  int criticalCount
  int offlineCount
  int noConfigCount
}
```

**`CalculatedDevice`** — Freezed, устройство + оценённые датчики + сводка:

```dart
CalculatedDevice {
  Device device
  List<CalculatedSensor> sensors
  DeviceSummary summary
}
```

> Все 4 Freezed-модели —  **без `json_serializable`** . Только `.freezed.dart`, без `.g.dart`. Они никогда не сериализуются.

---

## Логика оценки: SensorEvaluator

Чистый Dart-класс, нет зависимостей, нет Flutter.

```
SensorEvaluator.evaluate(Sensor sensor, SensorEvaluation? previous) → SensorEvaluation

Алгоритм (порядок важен):
1. нет value в метрике            → status: offline
2. нет порогов в uiConfigJson     → status: noConfig
3. value >= maxCritical           → status: critical  (ВХОД — мгновенно)
4. были critical,
   value < maxCritical - noise    → выход из critical  (ГИСТЕРЕЗИС)
5. value >= maxWarning            → status: warning
6. были warning,
   value < maxWarning - noise     → выход из warning   (ГИСТЕРЕЗИС)
7. иначе                          → status: normal

noiseLevel = (maxCritical - minCritical) * 0.02   // 2% от диапазона

alarmStartedAt:
  - вошли в warning/critical, предыдущий был normal/idle → DateTime.now()
  - остаёмся в том же alarm-статусе                      → previous.alarmStartedAt
  - вернулись в normal                                   → null
```

**Зачем гистерезис:** датчик на значении 9.48 при пороге 9.5 без гистерезиса мерцает между `normal` и `critical` при каждой метрике — UI нестабилен. С гистерезисом выход из аларма требует уйти дальше порога на 2% — UI стабилен.

---

## Поток данных

### Инициализация

```
App Start
    │
    ▼
CalculatedDeviceNotifier.build()
    │
    ├── deviceRepositoryProvider.getDevices()   ← HTTP GET /api/devices, без лимита
    │       ↓
    │   List<Device>   (Device уже содержит List<Sensor> из JSON)
    │       ↓
    ├── DeviceMapper.toCalculatedDevices(devices)
    │       ├── каждый Device → CalculatedDevice
    │       ├── каждый Sensor → CalculatedSensor(sensor, SensorEvaluation(status: idle))
    │       └── DeviceSummary(все нули)
    │       ↓
    │   List<CalculatedDevice>
    │       ↓
    ├── state = AsyncData(List<CalculatedDevice>)   ← экраны уже имеют данные
    │
    ├── signalRServiceProvider.start()              ← параллельно
    └── _listenToMetrics()                          ← подписка на metricsStream
```

### Реалтайм обновления

```
SignalR → ReceiveMetrics
    │
    ▼
Metric { sensorId, value, time, rawValue }
    │
    ▼
CalculatedDeviceNotifier._processMetric(metric)
    │
    ├── найти CalculatedDevice где sensors содержит sensorId
    ├── найти CalculatedSensor по sensorId
    ├── previousEvaluation = calculatedSensor.evaluation
    │
    ▼
SensorEvaluator.evaluate(sensor, previousEvaluation)
    │
    ▼
новый SensorEvaluation
    │
    ├── заменить CalculatedSensor в списке
    ├── пересобрать DeviceSummary (один проход по sensors)
    └── state = AsyncData([...обновлённый список...])
            │
            ▼
        Riverpod уведомляет подписчиков → виджеты перестраиваются
```

---

## Навигация между экранами

Все экраны читают из `calculatedDeviceNotifierProvider`. Никаких дополнительных запросов при переходе.

```
DashboardScreen
└── ref.watch(calculatedDeviceNotifierProvider)
    └── List<CalculatedDevice>
        └── DeviceCard(calculatedDevice)
            └── SensorCard(calculatedSensor)

DeviceScreen(deviceId)          [будущий экран]
└── ref.watch(calculatedDeviceNotifierProvider)
    └── найти CalculatedDevice по deviceId
        ├── характеристики устройства
        ├── DeviceSummary (счётчики)
        └── полный список SensorCard

SensorScreen(sensorId)          [будущий экран]
└── ref.watch(calculatedDeviceNotifierProvider)
    └── найти CalculatedSensor по sensorId
        ├── значение, статус, alarmStartedAt
        └── график (отдельный запрос к API)
```

---

## Структура файлов после рефакторинга

```
lib/src/
├── core/
│   ├── monitoring/
│   │   ├── models/
│   │   │   ├── sensor_status.dart          ← NEW: enum (idle/normal/warning/critical/offline/noConfig)
│   │   │   ├── sensor_evaluation.dart      ← NEW: Freezed (только .freezed.dart)
│   │   │   ├── calculated_sensor.dart      ← NEW: Freezed (только .freezed.dart)
│   │   │   ├── device_summary.dart         ← NEW: Freezed (только .freezed.dart)
│   │   │   └── calculated_device.dart      ← NEW: Freezed (только .freezed.dart)
│   │   ├── extensions/
│   │   │   └── sensor_status_ui.dart       ← NEW: Color/IconData маппинг
│   │   └── sensor_evaluator.dart           ← NEW: чистый Dart, логика + гистерезис
│   ├── network/   (без изменений)
│   ├── storage/   (без изменений)
│   └── theme/     (без изменений)
├── features/
│   ├── dashboard/
│   │   ├── data/
│   │   │   ├── device_repository.dart      ← ИЗМЕНИТЬ: убрать лимит из вызова в build()
│   │   │   └── device_mapper.dart          ← NEW: Device → CalculatedDevice
│   │   └── presentation/
│   │       ├── controllers/
│   │       │   ├── dashboard_controller.dart          ← УДАЛИТЬ (шаг 8)
│   │       │   └── calculated_device_notifier.dart    ← NEW: keepAlive AsyncNotifier
│   │       ├── dashboard_screen.dart       ← ИЗМЕНИТЬ: читать calculatedDeviceNotifierProvider
│   │       └── widgets/
│   │           ├── device_card.dart        ← ИЗМЕНИТЬ: принимает CalculatedDevice
│   │           └── sensor_card.dart        ← ИЗМЕНИТЬ: принимает CalculatedSensor,
│   │                                          удалить SensorStatusX extension
│   └── device_detail/
│       ├── data/
│       │   └── mock_device_data.dart       ← УДАЛИТЬ (шаг 8)
│       ├── domain/
│       │   ├── sensor_status_ext.dart      ← УДАЛИТЬ (шаг 8)
│       │   └── device_summary_ext.dart     ← УДАЛИТЬ (шаг 8)
│       └── presentation/
│           ├── controllers/
│           │   └── device_detail_controller.dart  ← ИЗМЕНИТЬ: возвращает CalculatedDevice,
│           │                                          читает calculatedDeviceNotifierProvider
│           ├── device_detail_screen.dart   ← ИЗМЕНИТЬ: принимает CalculatedDevice,
│           │                                  фильтры используют evaluation.status
│           └── widgets/
│               ├── device_detail_header.dart  ← ИЗМЕНИТЬ: принимает CalculatedDevice
│               ├── device_summary_panel.dart  ← без изменений (принимает int okCount/alertCount)
│               ├── expanded_sensor_card.dart  ← ИЗМЕНИТЬ: принимает CalculatedSensor
│               └── threshold_bar.dart         ← без изменений
└── shared/
    └── models/   (без изменений — Device, Sensor, SensorUiConfig, Metric)
```

---

## Ответственность компонентов

| Компонент           | Отвечает за                                                                                                |
| ---------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `DeviceRepository`         | HTTP GET /api/devices, десериализация в `List<Device>`                                              |
| `DeviceMapper`             | `List<Device>`→`List<CalculatedDevice>`с idle-статусами                                               |
| `SignalRService`           | подключение к хабу,`Stream<Metric>`                                                                |
| `SensorEvaluator`          | чистая логика оценки, гистерезис,`alarmStartedAt`                                      |
| `CalculatedDeviceNotifier` | загрузка данных, подписка на SignalR, единственный источник истины |
| `DeviceDetailController`   | находит `CalculatedDevice`по deviceId в `calculatedDeviceNotifierProvider`                             |
| `DeviceCard`               | `ConsumerWidget`, принимает `CalculatedDevice`, рендер                                            |
| `SensorCard`               | тупой виджет, принимает `CalculatedSensor`, только рендер                          |
| `ExpandedSensorCard`       | тупой виджет, принимает `CalculatedSensor`, без статус-логики                   |
| `SensorStatusUI`extension  | маппинг `SensorStatus`→`Color`,`IconData`(presentation only)                                           |

**Что виджеты не делают никогда:**

* Не вычисляют статус датчика
* Не читают пороги из `uiConfigJson` напрямую
* Не делают запросы к API
* Не хранят локальные копии данных

---

## План реализации (пошагово)

Каждый шаг — атомарный: создали/изменили файлы → `build_runner` если нужно → `dart analyze` → убедились что компилируется → следующий шаг.

Шаги 1–4 создают только новые файлы. Ни один существующий файл не трогается. Шаги 5–6 — миграция UI. Шаг 7 — удаление старого.

---

### Шаг 1 — Новые domain модели

**Создать** 5 файлов в `lib/src/core/monitoring/models/`:

`sensor_status.dart` — простой enum, без Freezed, без codegen:

```dart
enum SensorStatus { idle, normal, warning, critical, offline, noConfig }
```

`sensor_evaluation.dart`, `calculated_sensor.dart`, `device_summary.dart`, `calculated_device.dart` — Freezed-модели. У каждого:

* `part 'имя.freezed.dart';` — есть
* `part 'имя.g.dart';` — **нет** (нет json_serializable)
* Аннотация `@freezed`

**Запустить:** `dart run build_runner build --delete-conflicting-outputs`

**Ожидаемый результат:** 4 новых `.freezed.dart` файла. Старый код не затронут, приложение компилируется.

---

### Шаг 2 — SensorEvaluator и UI extension

**Создать** `lib/src/core/monitoring/sensor_evaluator.dart`:

* Чистый Dart-класс
* Единственный публичный метод: `SensorEvaluation evaluate(Sensor sensor, SensorEvaluation? previous)`
* Импортирует только `Sensor`, `SensorUiConfig`, `SensorEvaluation`, `SensorStatus`
* Никаких Flutter-импортов

**Создать** `lib/src/core/monitoring/extensions/sensor_status_ui.dart`:

* `extension SensorStatusUI on SensorStatus`
* Методы: `Color color(BuildContext context)`, `IconData get icon`, `String get label`
* Здесь Flutter-импорты допустимы — это UI-маппинг

**Запустить:** `dart analyze` — no errors. `build_runner` не нужен.

---

### Шаг 3 — DeviceMapper

**Создать** `lib/src/features/dashboard/data/device_mapper.dart`:

* Статический класс `DeviceMapper`
* `static List<CalculatedDevice> toCalculatedDevices(List<Device> devices)`
* Каждый `Sensor` → `CalculatedSensor(sensor: sensor, evaluation: SensorEvaluation(status: SensorStatus.idle))`
* `DeviceSummary` — все поля `0`

**Запустить:** `dart analyze` — no errors.

---

### Шаг 4 — CalculatedDeviceNotifier

**Создать** `lib/src/features/dashboard/presentation/controllers/calculated_device_notifier.dart`:

```dart
@Riverpod(keepAlive: true)
class CalculatedDeviceNotifier extends _$CalculatedDeviceNotifier {
  StreamSubscription<Metric>? _metricsSubscription;

  @override
  Future<List<CalculatedDevice>> build() async {
    // 1. ref.read(deviceRepositoryProvider).getDevices() — без лимита
    // 2. DeviceMapper.toCalculatedDevices(devices)
    // 3. ref.read(signalRServiceProvider).start()
    // 4. _listenToMetrics()
    // 5. ref.onDispose(() => _metricsSubscription?.cancel())
    // 6. return calculatedDevices
  }

  void _listenToMetrics() {
    _metricsSubscription?.cancel();
    _metricsSubscription = ref
        .read(signalRServiceProvider)
        .metricsStream
        .listen(_processMetric);
  }

  void _processMetric(Metric metric) {
    final current = state.value;
    if (current == null) return;

    // 1. найти deviceIndex где есть sensors с metric.sensorId
    // 2. найти sensorIndex внутри device
    // 3. SensorEvaluator.evaluate(sensor, prevEvaluation) → newEvaluation
    // 4. новый CalculatedSensor
    // 5. новый список sensors с заменённым элементом
    // 6. пересобрать DeviceSummary (fold по sensors)
    // 7. state = AsyncData([...с обновлённым device...])
  }
}
```

**Запустить:** `dart run build_runner build --delete-conflicting-outputs`

**Проверить:** нотифайер компилируется. `DashboardController` продолжает работать параллельно — это нормально.

---

### Шаг 5 — Миграция SensorCard и DeviceCard

**Изменить `SensorCard`:**

* Сигнатура: `final CalculatedSensor calculatedSensor` вместо `final Sensor sensor`
* Удалить `SensorStatusX extension on Sensor` и `enum SensorStatus` полностью
* Статус: `calculatedSensor.evaluation.status`
* Значение: `calculatedSensor.evaluation.value`
* Время обновления: поле `alarmStartedAt` или оставить заглушку до появления `lastMetricTime`
* Цвет/иконку: через `SensorStatusUI` extension
* Сенсорные данные (имя, тип, порт, иконка, unit): `calculatedSensor.sensor.*`

**Изменить `DeviceCard`:**

* Сигнатура: `final CalculatedDevice calculatedDevice` вместо `final Device device`
* Список датчиков: `calculatedDevice.sensors` (уже `List<CalculatedSensor>`)
* Имя, IP, isActive: `calculatedDevice.device.*`
* Счётчик датчиков: `calculatedDevice.sensors.length`
* Навигация: `DeviceDetailScreen(deviceId: calculatedDevice.device.id)` — без изменений

**Запустить:** `dart analyze` — будут ошибки только в `dashboard_screen.dart`. Это нормально.

---

### Шаг 6 — Миграция DashboardScreen

**Изменить `DashboardScreen`:**

* `ref.watch(dashboardControllerProvider)` → `ref.watch(calculatedDeviceNotifierProvider)`
* Тип `devices`: `List<Device>` → `List<CalculatedDevice>`
* `DeviceCard(device: device)` → `DeviceCard(calculatedDevice: calculatedDevice)`
* `ref.invalidate(dashboardControllerProvider)` → `ref.invalidate(calculatedDeviceNotifierProvider)`
* `_StatusCard`, `_ErrorView`, `_calculateItemCount` — без изменений

**Запустить приложение.** Dashboard должен работать. DeviceDetailScreen пока не трогали — он ещё читает `dashboardControllerProvider`, это нормально на данном этапе.

---

### Шаг 7 — Миграция device_detail

Это самый объёмный шаг. Все файлы в `device_detail/` переводятся на `CalculatedDevice`/`CalculatedSensor`.

**Изменить `DeviceDetailController`:**

* Сигнатура `build(int deviceId)` → возвращает `Future<CalculatedDevice>` вместо `Future<Device>`
* `ref.watch(dashboardControllerProvider)` → `ref.watch(calculatedDeviceNotifierProvider)`
* Поиск по `d.device.id == deviceId` вместо `d.id == deviceId`

**Изменить `ExpandedSensorCard`:**

* Сигнатура: `final CalculatedSensor calculatedSensor` вместо `final Sensor sensor`
* Удалить `_getStatus()`, `_getStatusColor()` методы — заменить на `calculatedSensor.evaluation.status` и `SensorStatusUI` extension
* Значение: `calculatedSensor.evaluation.value`
* Сенсорные данные: `calculatedSensor.sensor.*`
* `ThresholdBar` — передаёт те же данные из `calculatedSensor.sensor.uiConfigJson`, без изменений

**Изменить `DeviceDetailHeader`:**

* Сигнатура: `final CalculatedDevice calculatedDevice` вместо `final Device device`
* Метаданные: `calculatedDevice.device.*`
* `totalSensors`: `calculatedDevice.sensors.length` вместо `calculatedDevice.device.totalSensors`

**Изменить `DeviceDetailScreen`:**

* `ref.watch(deviceDetailControllerProvider(widget.deviceId))` возвращает `AsyncValue<CalculatedDevice>`
* `device.normalSensorsCount` → `calculatedDevice.summary.normalCount`
* `device.alertSensorsCount` → `calculatedDevice.summary.warningCount + calculatedDevice.summary.criticalCount`
* `device.sensors` → `calculatedDevice.sensors`
* `DeviceDetailHeader(device: device)` → `DeviceDetailHeader(calculatedDevice: calculatedDevice)`
* `_getFilteredSensors` переписать: принимает `CalculatedDevice`, возвращает `List<CalculatedSensor>`, фильтр по `cs.evaluation.status`
* `ExpandedSensorCard(sensor: sensor)` → `ExpandedSensorCard(calculatedSensor: cs)`
* `SensorFilter.normal`: `cs.evaluation.status == SensorStatus.normal`
* `SensorFilter.alert`: `cs.evaluation.status == SensorStatus.warning || cs.evaluation.status == SensorStatus.critical`

> **Важно про `SensorStatus.unknown` vs `SensorStatus.noConfig`:** в старом `sensor_status_ext.dart` нет-конфиг-статус называется `unknown`. В новом `SensorStatus` enum это `noConfig`. При миграции фильтра `SensorFilter.alert` убедиться что `noConfig` не попадает в тревоги (он там и не должен).

**Запустить приложение.** Проверить оба экрана: Dashboard и DeviceDetail.

---

### Шаг 8 — Финальная очистка

Только после того как шаги 5–7 полностью работают и проверены на устройстве.

* Удалить `dashboard_controller.dart` и `dashboard_controller.g.dart`
* Удалить `device_detail/domain/sensor_status_ext.dart`
* Удалить `device_detail/domain/device_summary_ext.dart`
* Удалить `device_detail/data/mock_device_data.dart`
* Убедиться что нигде нет `import` этих файлов
* `dart run build_runner build --delete-conflicting-outputs`
* `dart analyze` — zero errors, zero warnings

---

## Контрольные точки

| Шаг | Что должно работать после                                               |
| ------ | --------------------------------------------------------------------------------------------- |
| 1      | `build_runner`генерирует 4 `.freezed.dart`, старое работает       |
| 2      | `dart analyze`чист,`SensorEvaluator`существует                              |
| 3      | `dart analyze`чист,`DeviceMapper`существует                                 |
| 4      | `build_runner`генерирует notifier `.g.dart`, компилируется         |
| 5      | `dart analyze`— ошибки только в `dashboard_screen.dart`                     |
| 6      | Dashboard работает, данные отображаются, SignalR работает   |
| 7      | DeviceDetail работает, фильтры работают, ThresholdBar работает |
| 8      | `dart analyze`— zero issues, старые файлы удалены                        |
