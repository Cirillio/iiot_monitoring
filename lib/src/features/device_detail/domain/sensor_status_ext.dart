import 'package:flutter/material.dart';
import 'package:iiot_monitoring/src/shared/models/sensor.dart';

/// Расширение для определения статуса датчика на основе текущего значения и уставок.
extension SensorStatusExt on Sensor {
  /// Возвращает статус датчика: нормальный, предупреждение, критический, офлайн или неизвестный.
  SensorStatus get status {
    final currentValue = this.currentValue;
    if (currentValue == null) return SensorStatus.offline;

    final uiConfig = uiConfigJson;
    if (uiConfig == null) return SensorStatus.unknown;

    // Проверяем критические значения
    final minCritical = uiConfig.minCritical;
    final maxCritical = uiConfig.maxCritical;

    if ((minCritical != null && currentValue < minCritical) ||
        (maxCritical != null && currentValue > maxCritical)) {
      return SensorStatus.critical;
    }

    // Проверяем предупреждения
    final minWarning = uiConfig.minWarning;
    final maxWarning = uiConfig.maxWarning;

    if ((minWarning != null && currentValue < minWarning) ||
        (maxWarning != null && currentValue > maxWarning)) {
      return SensorStatus.warning;
    }

    return SensorStatus.normal;
  }

  /// Возвращает цвет для текущего статуса датчика.
  Color getStatusColor(BuildContext context) {
    switch (status) {
      case SensorStatus.normal:
        return Colors.greenAccent;
      case SensorStatus.warning:
        return Colors.orange;
      case SensorStatus.critical:
        return Colors.redAccent;
      case SensorStatus.unknown:
      case SensorStatus.offline:
        return Colors.grey;
    }
  }

  /// Возвращает иконку тренда в зависимости от статуса и значения.
  IconData get trendIcon {
    if (status == SensorStatus.offline || status == SensorStatus.unknown) {
      return Icons.sensor_occupied_outlined;
    }

    final minCritical = uiConfigJson?.minCritical;
    final maxCritical = uiConfigJson?.maxCritical;
    final currentValue = this.currentValue;

    if (currentValue == null) return Icons.sensor_occupied_outlined;

    if (maxCritical != null && currentValue > maxCritical) {
      return Icons.arrow_upward;
    }
    if (minCritical != null && currentValue < minCritical) {
      return Icons.arrow_downward;
    }

    return Icons.check;
  }
}

/// Статус датчика для отображения в UI.
enum SensorStatus { normal, warning, critical, unknown, offline }
