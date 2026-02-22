import 'package:flutter/material.dart';
import 'package:exui/exui.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../shared/models/sensor.dart';
import 'package:material_symbols_icons/get.dart'; // ВАЖНО: именно /get.dart

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

    if (max != null && currentValue! > max) return LucideIcons.chevronsUp;
    if (min != null && currentValue! < min) return LucideIcons.chevronsDown;

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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
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
          Icon(
            SymbolsGet.get(
              sensor.uiConfigJson?.icon ?? 'horizontal_rule',
              SymbolStyle.rounded,
            ),
            color: iconColor,
            size: 24,
          ),
          Expanded(
            child: [
              Text(
                sensor.name ?? "Unknown sensor",
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
        ].row(spacing: 6),

        // Trend Icon
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Icon(sensor.trendIcon, color: statusColor, size: 48).center(),
        ).marginSymmetric(vertical: 6),

        // Bottom Value
        [
          Text(
            '${sensor.currentValue?.toStringAsFixed(1) ?? '--'} ${sensor.unit ?? ''}',
            style: TextStyle(
              shadows: [
                Shadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  offset: const Offset(.5, .5),
                  blurRadius: 2,
                ),
              ],
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: statusColor,
            ),
          ).center(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Обновлено: только что',
                style: TextStyle(
                  fontSize: 8,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                ),
              ),
              Text(
                'Port: ${sensor.portNumber}',
                style: TextStyle(
                  fontSize: 8,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                ),
              ),
            ],
          ),
        ].column(crossAxisAlignment: CrossAxisAlignment.start, spacing: 6),
      ].column(crossAxisAlignment: CrossAxisAlignment.start),
    );
  }
}
