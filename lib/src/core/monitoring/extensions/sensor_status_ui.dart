import 'package:flutter/material.dart';
import '../models/sensor_status.dart';

extension SensorStatusUI on SensorStatus {
  Color get color {
    switch (this) {
      case SensorStatus.critical:
        return Colors.redAccent;
      case SensorStatus.warning:
        return Colors.orangeAccent;
      case SensorStatus.normal:
        return Colors.greenAccent;
      case SensorStatus.offline:
        return Colors.grey;
      case SensorStatus.noConfig:
        return Colors.blueGrey;
      case SensorStatus.idle:
        return Colors.grey.withOpacity(0.5);
    }
  }

  IconData get icon {
    switch (this) {
      case SensorStatus.critical:
        return Icons.error_outline;
      case SensorStatus.warning:
        return Icons.warning_amber_rounded;
      case SensorStatus.normal:
        return Icons.check_circle_outline;
      case SensorStatus.offline:
        return Icons.signal_wifi_off;
      case SensorStatus.noConfig:
        return Icons.settings_outlined;
      case SensorStatus.idle:
        return Icons.hourglass_empty;
    }
  }

  String get label {
    switch (this) {
      case SensorStatus.critical:
        return 'CRITICAL';
      case SensorStatus.warning:
        return 'WARNING';
      case SensorStatus.normal:
        return 'NORMAL';
      case SensorStatus.offline:
        return 'OFFLINE';
      case SensorStatus.noConfig:
        return 'NO CONFIG';
      case SensorStatus.idle:
        return 'IDLE';
    }
  }
}
