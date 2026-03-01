# Архитектура загрузки и обработки данных — IIoT Monitoring (Flutter)

## Обзор

Приложение использует модель **single source of truth** : все данные загружаются один раз при старте и живут в памяти. Экраны не делают собственных запросов к API — они читают из единого state-слоя.

---

## Слои архитектуры

```
┌─────────────────────────────────────────┐
│             Presentation Layer          │
│   DashboardScreen / DeviceScreen /      │
│   SensorScreen                          │
│   DeviceCard / SensorCard               │
├─────────────────────────────────────────┤
│              State Layer                │
│   CalculatedDeviceNotifier              │
│   SensorProcessingNotifier              │
├─────────────────────────────────────────┤
│              Domain Layer               │
│   SensorEvaluator                       │
│   CalculatedDevice / CalculatedSensor   │
│   SensorEvaluation / SensorStatus       │
│   DeviceSummary                         │
├─────────────────────────────────────────┤
│               Data Layer                │
│   DeviceRepository (Dio)                │
│   SignalRService                        │
│   DeviceDto / SensorDto                 │
│   Mapper                                │
└─────────────────────────────────────────┘
```

---

## Модели данных

### Data Layer

**`DeviceDto`** — сырой ответ от API. Содержит `List<SensorDto>`. Используется только для десериализации, в UI не попадает.

### Domain Layer

**`Device`** — доменная сущность устройства. Без списка сенсоров — они живут отдельно в `CalculatedSensor`.

**`Sensor`** — доменная сущность датчика. Содержит конфиг порогов (`SensorUiConfig`), но не содержит текущего значения или статуса.

**`SensorStatus`** — enum состояния датчика:

```
idle      — начальное состояние, данных ещё не было
normal    — значение в пределах нормы
warning   — значение пересекло предупредительный порог
critical  — значение пересекло критический порог
offline   — данные не поступали дольше N секунд (heartbeat)
noConfig  — у датчика нет настроенных порогов
```

**`SensorEvaluation`** — результат оценки одного датчика:

```dart
SensorEvaluation {
  SensorStatus status
  double? value           // текущее значение
  DateTime? alarmStartedAt // время начала аларма, null если normal
  String? message         // человекочитаемое описание
}
```

**`CalculatedSensor`** — обёртка: датчик + его оценка:

```dart
CalculatedSensor {
  Sensor sensor
  SensorEvaluation evaluation
}
```

**`DeviceSummary`** — агрегированная статистика устройства:

```dart
DeviceSummary {
  int normalCount
  int warningCount
  int criticalCount
  int offlineCount
  int noConfigCount
}
```

**`CalculatedDevice`** — обёртка: устройство + список оценённых датчиков + сводка:

```dart
CalculatedDevice {
  Device device
  List<CalculatedSensor> sensors
  DeviceSummary summary
}
```

---

## Поток данных

### Фаза 1 — Инициализация

```
App Start
    │
    ▼
DeviceRepository.getDevices()   ← HTTP GET /api/devices (все устройства, без лимита)
    │
    ▼
List<DeviceDto>                 ← сырой JSON от API
    │
    ▼
Mapper.toCalculatedDevices()
    ├── DeviceDto → Device
    ├── SensorDto → Sensor
    └── каждый Sensor → CalculatedSensor(sensor, SensorEvaluation(status: idle))
    │
    ▼
CalculatedDeviceNotifier.init(devices)
    └── state = List<CalculatedDevice>   ← все устройства в памяти

SignalRService.start()          ← запуск подключения к хабу (параллельно с загрузкой)
```

После этой фазы все экраны уже имеют данные для рендера — устройства, датчики, начальный статус `idle`.

---

### Фаза 2 — Реалтайм обновления

```
SignalR Hub → ReceiveMetrics
    │
    ▼
Metric { sensorId, value, time, rawValue }
    │
    ▼
CalculatedDeviceNotifier.processMetric(metric)
    │
    ├── находит нужный CalculatedDevice по sensorId
    ├── находит нужный CalculatedSensor внутри него
    │
    ▼
SensorEvaluator.evaluate(sensor, previousEvaluation)
    ├── нет value?           → status: offline
    ├── нет порогов в config? → status: noConfig
    ├── value > maxCritical? → status: critical  (вход — мгновенно)
    ├── value < maxCritical - noise? → выход из critical (гистерезис)
    ├── value > maxWarning?  → status: warning
    └── иначе               → status: normal
    │
    ▼
новый SensorEvaluation
    │
    ├── alarmStartedAt:
    │     если статус не изменился → сохраняем предыдущий alarmStartedAt
    │     если новый аларм         → DateTime.now()
    │     если вернулись в normal  → null
    │
    ▼
CalculatedDeviceNotifier обновляет state:
    ├── заменяет CalculatedSensor в списке
    └── пересобирает DeviceSummary (один проход по списку сенсоров)
    │
    ▼
Riverpod уведомляет подписчиков → виджеты перестраиваются
```

---

## Гистерезис

Проблема без гистерезиса: датчик на значении 9.48 при пороге 9.5 будет мерцать между `normal` и `critical` при каждом новом значении. UI нестабилен.

Решение: выход из аларма требует чтобы значение ушло дальше порога на `noiseLevel`.

```
noiseLevel = (maxCritical - minCritical) * 0.02   // 2% от диапазона

Вход в critical:  value >= maxCritical
Выход из critical: value < maxCritical - noiseLevel
```

Таким образом у порога образуется "мёртвая зона" — датчик не переключается туда-обратно при незначительных колебаниях.

---

## Навигация между экранами

Все экраны читают данные из `CalculatedDeviceNotifier`. Никаких дополнительных запросов при переходе.

```
DashboardScreen
└── ref.watch(calculatedDeviceNotifierProvider)
    └── показывает List<CalculatedDevice>
        └── DeviceCard(calculatedDevice)
            └── SensorCard(calculatedSensor)   ← первые 2, остальные по кнопке

DeviceScreen(deviceId)
└── ref.watch(calculatedDeviceNotifierProvider)
    └── находит нужный CalculatedDevice по deviceId
        ├── характеристики устройства
        ├── DeviceSummary (счётчики норм/тревога/критикал)
        └── полный список SensorCard

SensorScreen(sensorId)
└── ref.watch(calculatedDeviceNotifierProvider)
    └── находит нужный CalculatedSensor по sensorId
        ├── текущее значение и статус
        ├── время начала аларма
        └── график истории (отдельный запрос к API)
```

---

## Ответственность слоёв

| Компонент                    | Отвечает за                                                                    |
| ---------------------------- | ------------------------------------------------------------------------------ |
| `DeviceRepository`           | HTTP-запрос, десериализация `DeviceDto`                                        |
| `Mapper`                     | `DeviceDto`→`Device`+`List<CalculatedSensor>`с `idle`статусом                  |
| `SignalRService`             | подключение к хабу, эмит `Stream<Metric>`                                      |
| `SensorEvaluator`            | чистая логика оценки, гистерезис,`alarmStartedAt`                              |
| `SensorProcessingNotifier`   | хранит историю `Map<int, SensorEvaluation>`для гистерезиса                     |
| `CalculatedDeviceNotifier`   | единственный источник истины, обновляет state при метриках                     |
| `DeviceCard`                 | `ConsumerWidget`, читает `CalculatedDevice`, собирает `CalculatedSensor`список |
| `SensorCard`                 | тупой виджет, только рендер, принимает `CalculatedSensor`                      |
| `SensorStatus`extension (UI) | маппинг `SensorStatus`→`Color`,`IconData`                                      |

---

## Что не делают виджеты

- Не вычисляют статус датчика
- Не читают пороги из `uiConfigJson` напрямую
- Не делают запросы к API при открытии экрана
- Не хранят локальные копии данных

---

## Структура файлов

```
lib/src/
├── core/
│   └── monitoring/
│       ├── models/
│       │   ├── sensor_status.dart
│       │   ├── sensor_evaluation.dart
│       │   ├── calculated_sensor.dart
│       │   ├── device_summary.dart
│       │   └── calculated_device.dart
│       ├── extensions/
│       │   └── sensor_status_ui.dart       ← Color, IconData маппинг
│       ├── sensor_evaluator.dart
│       └── sensor_processing_notifier.dart
├── features/
│   └── dashboard/
│       ├── data/
│       │   ├── device_repository.dart
│       │   └── mapper.dart                 ← DeviceDto → CalculatedDevice
│       └── presentation/
│           ├── controllers/
│           │   └── calculated_device_notifier.dart
│           └── widgets/
│               ├── device_card.dart        ← ConsumerWidget
│               └── sensor_card.dart        ← принимает CalculatedSensor
└── shared/
    └── models/
        ├── device.dart                     ← без List<Sensor>
        ├── sensor.dart
        ├── sensor_ui_config.dart
        └── metric.dart
```
