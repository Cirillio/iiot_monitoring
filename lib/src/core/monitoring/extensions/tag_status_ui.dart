import 'package:flutter/material.dart';
import '../models/tag_status.dart';

extension TagStatusUI on TagStatus {
  Color get color {
    switch (this) {
      case TagStatus.critical:
        return Colors.redAccent;
      case TagStatus.warning:
        return Colors.orangeAccent;
      case TagStatus.normal:
        return Colors.greenAccent;
      case TagStatus.offline:
        return Colors.grey;
      case TagStatus.noConfig:
        return Colors.blueGrey;
      case TagStatus.idle:
        return Colors.grey.withValues(alpha: 0.5);
    }
  }

  IconData get icon {
    switch (this) {
      case TagStatus.critical:
        return Icons.error_outline;
      case TagStatus.warning:
        return Icons.warning_amber_rounded;
      case TagStatus.normal:
        return Icons.check_circle_outline;
      case TagStatus.offline:
        return Icons.signal_wifi_off;
      case TagStatus.noConfig:
        return Icons.settings_outlined;
      case TagStatus.idle:
        return Icons.hourglass_empty;
    }
  }

  String get label {
    switch (this) {
      case TagStatus.critical:
        return 'CRITICAL';
      case TagStatus.warning:
        return 'WARNING';
      case TagStatus.normal:
        return 'NORMAL';
      case TagStatus.offline:
        return 'OFFLINE';
      case TagStatus.noConfig:
        return 'NO CONFIG';
      case TagStatus.idle:
        return 'IDLE';
    }
  }
}
