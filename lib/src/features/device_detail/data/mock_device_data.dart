import 'package:iiot_monitoring/src/shared/models/device.dart';
import 'package:iiot_monitoring/src/shared/models/tag.dart';
import 'package:iiot_monitoring/src/shared/models/tag_ui_config.dart';
import 'package:iiot_monitoring/src/shared/models/enums.dart';

/// Моковые данные для этапа макетирования страницы устройства.
/// Данные реалистичные: есть сенсоры с нормальными значениями и один критический.
class MockDeviceData {
  MockDeviceData._();

  /// Конфигурация для датчика температуры (нормальный режим)
  static const _tempNormalConfig = TagUiConfig(
    color: '#00FF00',
    icon: 'thermometer',
    minCritical: 10.0,
    minWarning: 15.0,
    maxWarning: 35.0,
    maxCritical: 40.0,
  );

  /// Конфигурация для датчика давления (нормальный режим)
  static const _pressureNormalConfig = TagUiConfig(
    color: '#0000FF',
    icon: 'gauge',
    minCritical: 0.5,
    minWarning: 1.0,
    maxWarning: 8.0,
    maxCritical: 10.0,
  );

  /// Конфигурация для датчика влажности (нормальный режим)
  static const _humidityNormalConfig = TagUiConfig(
    color: '#00FFFF',
    icon: 'droplet',
    minCritical: 30.0,
    minWarning: 40.0,
    maxWarning: 70.0,
    maxCritical: 80.0,
  );

  /// Конфигурация для датчика напряжения (КРИТИЧЕСКИЙ - превышает maxCritical)
  static const _voltageCriticalConfig = TagUiConfig(
    color: '#FFFF00',
    icon: 'zap',
    minCritical: 200.0,
    minWarning: 210.0,
    maxWarning: 230.0,
    maxCritical: 240.0,
  );

  /// Датчик температуры - норма
  static final temperatureTag = Tag(
    tagId: 1,
    deviceId: 1,
    portNumber: 1,
    name: 'Температура двигателя',
    slug: 'engine_temp',
    dataType: TagDataType.analogRaw, // Аналоговый
    unit: '°C',
    uiConfigJson: _tempNormalConfig,
    currentValue: 28.5,
    lastTagUpdated: DateTime(2026, 2, 28, 10, 30, 0),
  );

  /// Датчик давления - норма
  static final pressureTag = Tag(
    tagId: 2,
    deviceId: 1,
    portNumber: 2,
    name: 'Давление в системе',
    slug: 'system_pressure',
    dataType: TagDataType.analogRaw, // Аналоговый
    unit: 'бар',
    uiConfigJson: _pressureNormalConfig,
    currentValue: 4.2,
    lastTagUpdated: DateTime(2026, 2, 28, 10, 30, 5),
  );

  /// Датчик влажности - норма
  static final humidityTag = Tag(
    tagId: 3,
    deviceId: 1,
    portNumber: 3,
    name: 'Влажность воздуха',
    slug: 'air_humidity',
    dataType: TagDataType.analogRaw, // Аналоговый
    unit: '%',
    uiConfigJson: _humidityNormalConfig,
    currentValue: 55.0,
    lastTagUpdated: DateTime(2026, 2, 28, 10, 30, 10),
  );

  /// Датчик напряжения - КРИТИЧЕСКИЙ (превышает maxCritical 240В)
  static final voltageCriticalTag = Tag(
    tagId: 4,
    deviceId: 1,
    portNumber: 4,
    name: 'Напряжение сети',
    slug: 'mains_voltage',
    dataType: TagDataType.analogRaw, // Аналоговый
    unit: 'В',
    uiConfigJson: _voltageCriticalConfig,
    currentValue: 255.0, // Критическое превышение!
    lastTagUpdated: DateTime(2026, 2, 28, 10, 30, 15),
  );

  /// Основное моковое устройство со всеми сенсорами
  static final mockDevice = Device(
    id: 1,
    name: 'ПЛК-1: Главный контроллер',
    ipAddress: '192.168.1.10',
    port: 502,
    slaveId: 1,
    isActive: true,
      connectionId: 1,
      isOnline: true,
    createdAt: DateTime(2026, 1, 1),
    tags: [
      temperatureTag,
      pressureTag,
      humidityTag,
      voltageCriticalTag,
    ],
    totalTags: 4,
  );

  /// Второе моковое устройство (все сенсоры в норме)
  static final mockDeviceOk = Device(
    id: 2,
    name: 'ПЛК-2: Резервный контроллер',
    ipAddress: '192.168.1.11',
    port: 502,
    slaveId: 2,
    isActive: true,
      connectionId: 1,
      isOnline: true,
    createdAt: DateTime(2026, 1, 15),
    tags: [
      Tag(
        tagId: 5,
        deviceId: 2,
        portNumber: 1,
        name: 'Температура шкафа',
        slug: 'cabinet_temp',
        dataType: TagDataType.analogRaw,
        unit: '°C',
        uiConfigJson: TagUiConfig(
          color: '#00FF00',
          icon: 'thermometer',
          minCritical: 10.0,
          maxCritical: 40.0,
        ),
        currentValue: 22.0,
        lastTagUpdated: DateTime(2026, 2, 28, 10, 25, 0),
      ),
      Tag(
        tagId: 6,
        deviceId: 2,
        portNumber: 2,
        name: 'Ток фазы A',
        slug: 'phase_a_current',
        dataType: TagDataType.analogRaw,
        unit: 'А',
        uiConfigJson: TagUiConfig(
          color: '#FFA500',
          icon: 'zap',
          minCritical: 0.0,
          maxCritical: 100.0,
        ),
        currentValue: 45.5,
        lastTagUpdated: DateTime(2026, 2, 28, 10, 25, 5),
      ),
    ],
    totalTags: 2,
  );
}
