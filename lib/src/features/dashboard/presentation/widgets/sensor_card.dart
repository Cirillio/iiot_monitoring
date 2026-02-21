import 'package:flutter/material.dart';
import 'package:exui/exui.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../shared/models/sensor.dart';

enum SensorStatus { normal, critical, offline }

extension SensorStatusX on Sensor {
  SensorStatus get status {
    if (currentValue == null) return SensorStatus.offline;

    final min = uiConfigJson?.minCritical;
    final max = uiConfigJson?.maxCritical;

    if ((min != null && currentValue! < min) ||
        (max != null && currentValue! > max)) {
      return SensorStatus.critical;
    }

    return SensorStatus.normal;
  }

  Color getStatusColor(BuildContext context) {
    switch (status) {
      case SensorStatus.normal:
        return Colors.greenAccent;
      case SensorStatus.critical:
        return Colors.redAccent;
      case SensorStatus.offline:
        return Colors.grey;
    }
  }

  IconData get trendIcon {
    if (status == SensorStatus.offline) return LucideIcons.wifiOff;
    if (status == SensorStatus.normal) return LucideIcons.check;

    final min = uiConfigJson?.minCritical;
    final max = uiConfigJson?.maxCritical;

    if (max != null && currentValue! > max) return LucideIcons.arrowUp;
    if (min != null && currentValue! < min) return LucideIcons.arrowDown;

    return LucideIcons.check;
  }
}

class SensorCard extends StatelessWidget {
  final Sensor sensor;

  const SensorCard({super.key, required this.sensor});

  Color _parseHexColor(String? hex) {
    if (hex == null) return Colors.white;
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xff')));
    } catch (_) {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = sensor.getStatusColor(context);
    final iconColor = _parseHexColor(sensor.uiConfigJson?.color);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            theme.colorScheme.surface,
            statusColor.withValues(alpha: 0.15),
          ],
        ),
      ),
      child: [
        // Top Row
        [
          Icon(LucideIcons.activity, color: iconColor, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: [
              Text(
                sensor.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                sensor.sensorDataType == 0 ? 'Аналоговый' : 'Цифровой',
                style: TextStyle(
                  fontSize: 10,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ].column(crossAxisAlignment: CrossAxisAlignment.start),
          ),
          Text(
            '#${sensor.sensorId}',
            style: TextStyle(
              fontSize: 10,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
            ),
          ),
        ].row(),

        // Trend Icon
        Expanded(
          child: Icon(sensor.trendIcon, color: statusColor, size: 32).center(),
        ),

        // Bottom Value
        [
          Text(
            '${sensor.currentValue?.toStringAsFixed(1) ?? '--'} ${sensor.unit ?? ''}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: statusColor,
            ),
          ),
          Text(
            'Обновлено: только что',
            style: TextStyle(
              fontSize: 8,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
            ),
          ),
        ].column(crossAxisAlignment: CrossAxisAlignment.start),
      ].column(crossAxisAlignment: CrossAxisAlignment.start),
    );
  }
}
