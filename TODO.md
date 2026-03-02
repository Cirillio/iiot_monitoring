Ниже приведены четкие инструкции по каждому слою приложения, начиная с правильной генерации моделей.

---

### 1. Правильная работа с Freezed (Генерация моделей)

Так как в проекте принято использовать `abstract class` для моделей Freezed (это классический и надежный подход, который отлично работает с кастомными методами и геттерами), каждый файл модели должен строго следовать этому шаблону.

**Шаблон правильного исходника (`.dart`):**

**Dart**

```
 import 'package:freezed_annotation/freezed_annotation.dart';

// Обязательно указываем part-файлы
part 'my_model.freezed.dart';
part 'my_model.g.dart'; // Если нужна (де)сериализация JSON

@freezed
abstract class MyModel with _$MyModel {
  // Приватный конструктор нужен, если внутри класса будут кастомные геттеры или методы
  const MyModel._();

  const factory MyModel({
    required int id,
    required String name,
    // ... остальные поля
  }) = _MyModel;

  factory MyModel.fromJson(Map<String, dynamic> json) => _$MyModelFromJson(json);

  // Пример кастомного геттера (поэтому нужен const MyModel._(); выше)
  bool get isReady => id > 0;
}
```

**Инструкция по генерации:**
После любого изменения или создания нового файла с аннотацией `@freezed`, обязательно запускай скрипт кодогенерации с флагом удаления конфликтующих файлов (иначе build_runner может зависнуть на старых кэшах):

В терминале в корне проекта:

**Bash**

```
dart run build_runner build --delete-conflicting-outputs
```

_(Или `flutter pub run build_runner build -d`, если используешь старую версию Flutter cli)_ .

---

### 2. Доработка доменного слоя (Слой мониторинга)

В ветке `monitoring-refactor` у нас появились DTO (Data Transfer Objects) и модели вычисляемых устройств (`CalculatedDevice`, `SensorEvaluation`). Это правильный шаг к разделению API-ответов и бизнес-логики UI.

**Что нужно сделать:**

1. **Обновить `SensorUiConfig`** :
   Добавить поля для цифровых датчиков, чтобы логика `SensorEvaluator` могла с ними работать.
   **Dart**

```
   @freezed
   abstract class SensorUiConfig with _$SensorUiConfig {
     const SensorUiConfig._();

     const factory SensorUiConfig({
       String? color,
       String? icon,
       // ... старые поля
       double? minCritical,
       double? minWarning,
       double? maxWarning,
       double? maxCritical,
       // Новые поля для DIGITAL:
       double? digitalWarning,
       double? digitalCritical,
       String? labelZero,
       String? labelOne,
     }) = _SensorUiConfig;

     factory SensorUiConfig.fromJson(Map<String, dynamic> json) => _$SensorUiConfigFromJson(json);
   }
```

1. **Доработать `SensorEvaluator` (или `CalculatedSensor`)** :
   В классе, который вычисляет статус (выдает `SensorStatus.normal`, `warning`, `critical`), нужно прописать логику, которая сначала смотрит на `dataType` (ANALOG или DIGITAL), и в зависимости от этого применяет либо `min/max` лимиты, либо точные совпадения с `digitalCritical/Warning`.

---

### 3. Стейт-менеджмент и Контроллеры (Riverpod)

Текущая архитектура подразумевает, что сырые данные приходят из сети, а затем пропускаются через `SensorProcessingNotifier` или аналог.

**Инструкции по рефакторингу состояний:**

1. **Разделение потоков** :

- `DeviceRepository` должен возвращать строго `List<DeviceDto>`. Он не должен ничего знать про цвета, статусы и алерты.
- `SignalRService` должен возвращать поток `Metric`.
- Контроллер дашборда (`CalculatedDeviceNotifier`) должен объединять (combine) эти два источника: брать базовую конфигурацию, накладывать сверху живую метрику, пропускать через `SensorEvaluator` и выдавать в UI готовый `CalculatedDevice`.

1. **Обработка ошибок при загрузке** :
   В `CalculatedDeviceNotifier` нужно убедиться, что если API недоступно, но есть кэш в `SharedPreferences`, система покажет старые устройства, а крутилка `loading` будет только для обновления статусов сети (Silent loading).

---

### 4. Доработка UI (Макетирование и Сшивание)

1. **Интеграция UI и вычисленных моделей** :

- Виджеты (`DeviceCard`, `SensorCard`, `ExpandedSensorCard`) больше не должны сами вычислять, красные они или зеленые.
- Они должны принимать модель `CalculatedSensor` или `SensorEvaluation`, в которой **уже есть** поле `SensorStatus status`.
- UI должен быть абсолютно «тупым»:
  **Dart**

  ```
  // Пример внутри SensorCard
  final color = sensor.evaluation.status == SensorStatus.critical
      ? Colors.red
      : Colors.green;
  ```

1. **Безопасные Null-проверки в UI** :
   Везде, где используется `uiConfig?.icon` или `uiConfig?.color`, прописать fallback-значения, если бэкенд прислал `null` (например, иконка по умолчанию `Icons.sensors` и цвет `Colors.grey`).
