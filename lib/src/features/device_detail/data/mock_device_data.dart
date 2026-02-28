import 'package:iiot_monitoring/src/shared/models/device.dart';
import 'package:iiot_monitoring/src/shared/models/sensor.dart';
import 'package:iiot_monitoring/src/shared/models/sensor_ui_config.dart';

/// Моковые данные для этапа макетирования страницы устройства.
/// Данные реалистичные: есть сенсоры с нормальными значениями и один критический.
class MockDeviceData {
  MockDeviceData._();

  /// Конфигурация для датчика температуры (нормальный режим)
  static const _tempNormalConfig = SensorUiConfig(
    color: '#00FF00',
    icon: 'thermometer',
    mainPagePosition: 1,
    graphPosition: 1,
    tablePosition: 1,
    alarmPosition: 1,
    historyPosition: 1,
    minCritical: 10.0,
    minWarning: 15.0,
    maxWarning: 35.0,
    maxCritical: 40.0,
  );

  /// Конфигурация для датчика давления (нормальный режим)
  static const _pressureNormalConfig = SensorUiConfig(
    color: '#0000FF',
    icon: 'gauge',
    mainPagePosition: 2,
    graphPosition: 2,
    tablePosition: 2,
    alarmPosition: 2,
    historyPosition: 2,
    minCritical: 0.5,
    minWarning: 1.0,
    maxWarning: 8.0,
    maxCritical: 10.0,
  );

  /// Конфигурация для датчика влажности (нормальный режим)
  static const _humidityNormalConfig = SensorUiConfig(
    color: '#00FFFF',
    icon: 'droplet',
    mainPagePosition: 3,
    graphPosition: 3,
    tablePosition: 3,
    alarmPosition: 3,
    historyPosition: 3,
    minCritical: 30.0,
    minWarning: 40.0,
    maxWarning: 70.0,
    maxCritical: 80.0,
  );

  /// Конфигурация для датчика напряжения (КРИТИЧЕСКИЙ - превышает maxCritical)
  static const _voltageCriticalConfig = SensorUiConfig(
    color: '#FFFF00',
    icon: 'zap',
    mainPagePosition: 4,
    graphPosition: 4,
    tablePosition: 4,
    alarmPosition: 4,
    historyPosition: 4,
    minCritical: 200.0,
    minWarning: 210.0,
    maxWarning: 230.0,
    maxCritical: 240.0,
  );

  /// Датчик температуры - норма
  static final temperatureSensor = Sensor(
    sensorId: 1,
    deviceId: 1,
    portNumber: 1,
    name: 'Температура двигателя',
    slug: 'engine_temp',
    sensorDataType: 0, // Аналоговый
    unit: '°C',
    uiConfigJson: _tempNormalConfig,
    currentValue: 28.5,
    lastSensorUpdated: DateTime(2026, 2, 28, 10, 30, 0),
  );

  /// Датчик давления - норма
  static final pressureSensor = Sensor(
    sensorId: 2,
    deviceId: 1,
    portNumber: 2,
    name: 'Давление в системе',
    slug: 'system_pressure',
    sensorDataType: 0, // Аналоговый
    unit: 'бар',
    uiConfigJson: _pressureNormalConfig,
    currentValue: 4.2,
    lastSensorUpdated: DateTime(2026, 2, 28, 10, 30, 5),
  );

  /// Датчик влажности - норма
  static final humiditySensor = Sensor(
    sensorId: 3,
    deviceId: 1,
    portNumber: 3,
    name: 'Влажность воздуха',
    slug: 'air_humidity',
    sensorDataType: 0, // Аналоговый
    unit: '%',
    uiConfigJson: _humidityNormalConfig,
    currentValue: 55.0,
    lastSensorUpdated: DateTime(2026, 2, 28, 10, 30, 10),
  );

  /// Датчик напряжения - КРИТИЧЕСКИЙ (превышает maxCritical 240В)
  static final voltageCriticalSensor = Sensor(
    sensorId: 4,
    deviceId: 1,
    portNumber: 4,
    name: 'Напряжение сети',
    slug: 'mains_voltage',
    sensorDataType: 0, // Аналоговый
    unit: 'В',
    uiConfigJson: _voltageCriticalConfig,
    currentValue: 255.0, // Критическое превышение!
    lastSensorUpdated: DateTime(2026, 2, 28, 10, 30, 15),
  );

  /// Основное моковое устройство со всеми сенсорами
  static final mockDevice = Device(
    id: 1,
    name: 'ПЛК-1: Главный контроллер',
    ipAddress: '192.168.1.10',
    port: 502,
    slaveId: 1,
    isActive: true,
    createdAt: DateTime(2026, 1, 1),
    sensors: [
      temperatureSensor,
      pressureSensor,
      humiditySensor,
      voltageCriticalSensor,
    ],
    totalSensors: 4,
  );

  /// Второе моковое устройство (все сенсоры в норме)
  static final mockDeviceOk = Device(
    id: 2,
    name: 'ПЛК-2: Резервный контроллер',
    ipAddress: '192.168.1.11',
    port: 502,
    slaveId: 2,
    isActive: true,
    createdAt: DateTime(2026, 1, 15),
    sensors: [
      Sensor(
        sensorId: 5,
        deviceId: 2,
        portNumber: 1,
        name: 'Температура шкафа',
        slug: 'cabinet_temp',
        sensorDataType: 0,
        unit: '°C',
        uiConfigJson: SensorUiConfig(
          color: '#00FF00',
          icon: 'thermometer',
          minCritical: 10.0,
          maxCritical: 40.0,
        ),
        currentValue: 22.0,
        lastSensorUpdated: DateTime(2026, 2, 28, 10, 25, 0),
      ),
      Sensor(
        sensorId: 6,
        deviceId: 2,
        portNumber: 2,
        name: 'Ток фазы A',
        slug: 'phase_a_current',
        sensorDataType: 0,
        unit: 'А',
        uiConfigJson: SensorUiConfig(
          color: '#FFA500',
          icon: 'zap',
          minCritical: 0.0,
          maxCritical: 100.0,
        ),
        currentValue: 45.5,
        lastSensorUpdated: DateTime(2026, 2, 28, 10, 25, 5),
      ),
    ],
    totalSensors: 2,
  );
}
