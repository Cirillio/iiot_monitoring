import 'package:flutter/material.dart';
import 'package:exui/exui.dart';
import '../../../../shared/models/device.dart';
import 'sensor_card.dart';

class DeviceCard extends StatelessWidget {
  final Device device;

  const DeviceCard({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
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
          const SizedBox(width: 12),
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

        const SizedBox(height: 12),

        // Sensors Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: device.sensors?.length ?? 0,
          itemBuilder: (context, index) {
            final sensor = device.sensors?[index];
            if (sensor != null) {
              return SensorCard(sensor: sensor);
            }
            return sizedBox();
          },
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
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text(
              'Перейти к устройству',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ].column(),
    );
  }
}
