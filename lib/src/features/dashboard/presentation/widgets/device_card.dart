import 'package:flutter/material.dart';
import 'package:exui/exui.dart';
import 'package:iiot_monitoring/src/shared/widgets/iiot_card.dart';
import '../../../../shared/models/device.dart';
import 'sensor_card.dart';

class DeviceCard extends StatelessWidget {
  final Device device;

  const DeviceCard({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IiotCard(
      child: [
        // Header
        [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: device.isActive ? Colors.greenAccent : Colors.redAccent,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: [
              Text(
                device.name ?? "Unknown device",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                device.ipAddress ?? "undefined",
                style: TextStyle(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ].column(crossAxisAlignment: CrossAxisAlignment.start),
          ),
          Text(
            'ID: ${device.id}',
            style: TextStyle(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
            ),
          ),
        ].row().padding(EdgeInsets.symmetric(horizontal: 12, vertical: 6)),

        // Sensors Grid
        List.generate((device.sensors.length / 2).ceil(), (index) {
          final first = device.sensors[index * 2];
          final second = (index * 2 + 1 < device.sensors.length)
              ? device.sensors[index * 2 + 1]
              : null;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: SensorCard(sensor: first)),
              const SizedBox(width: 6),
              Expanded(
                child: second != null
                    ? SensorCard(sensor: second)
                    : const SizedBox(),
              ),
            ],
          );
        }).column(spacing: 6),

        Text(
          "Всего датчиков: ${device.totalSensors}",
          style: TextStyle(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),

        // Action Button
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.5),
              foregroundColor: theme.colorScheme.onSurface,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36),
              ),
              padding: EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text(
              'Перейти к устройству',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ].column(spacing: 16),
    );
  }
}
