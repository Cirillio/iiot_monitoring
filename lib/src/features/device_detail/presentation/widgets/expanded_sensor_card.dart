import 'package:flutter/material.dart';
import 'package:exui/exui.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/sensor_status.dart';
import 'package:iiot_monitoring/src/core/monitoring/extensions/sensor_status_ui.dart';
import 'package:iiot_monitoring/src/shared/models/sensor.dart';
import 'package:material_symbols_icons/get.dart';
import 'threshold_bar.dart';

class ExpandedSensorCard extends StatelessWidget {
  final Sensor sensor;
  final VoidCallback? onTap;

  const ExpandedSensorCard({super.key, required this.sensor, this.onTap});

  // Временный маппинг для совместимости, пока экран деталей не переведен на CalculatedSensor полностью
  SensorStatus get status {
    if (sensor.currentValue == null) return SensorStatus.offline;
    final config = sensor.uiConfigJson;
    if (config == null) return SensorStatus.noConfig;

    if (sensor.currentValue! >= (config.maxCritical ?? double.infinity))
      return SensorStatus.critical;
    if (sensor.currentValue! >= (config.maxWarning ?? double.infinity))
      return SensorStatus.warning;
    return SensorStatus.normal;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = status.color;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: statusColor.withOpacity(0.2), width: 1),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  SymbolsGet.get(
                    sensor.uiConfigJson?.icon ?? 'sensors',
                    SymbolStyle.rounded,
                  ),
                  color: statusColor,
                  size: 32,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sensor.name ?? 'Unknown Sensor',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        status.label,
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${sensor.currentValue?.toStringAsFixed(1) ?? '--'} ${sensor.unit ?? ''}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (sensor.uiConfigJson != null)
              ThresholdBar(
                currentValue: sensor.currentValue ?? 0,
                min: sensor.uiConfigJson!.minCritical ?? 0,
                max: sensor.uiConfigJson!.maxCritical ?? 100,
                minCritical: sensor.uiConfigJson!.minCritical ?? 0,
                maxCritical: sensor.uiConfigJson!.maxCritical ?? 100,
                maxWarning: sensor.uiConfigJson!.maxWarning ?? 80,
              ),
          ],
        ),
      ),
    );
  }
}
