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
        border: Border.all(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
        ),
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
                device.name,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                device.ipAddress,
                style: TextStyle(color: theme.colorScheme.onSurface.withValues(alpha: 0.5)),
              ),
            ].column(crossAxisAlignment: CrossAxisAlignment.start),
          ),
          Text(
            'ID: ${device.id}',
            style: TextStyle(color: theme.colorScheme.onSurface.withValues(alpha: 0.4)),
          ),
        ].row(),

        const SizedBox(height: 16),

        // Sensors Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.9,
          ),
          itemCount: device.sensors.length,
          itemBuilder: (context, index) {
            return SensorCard(sensor: device.sensors[index]);
          },
        ),

        const SizedBox(height: 16),

        // Action Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.onSurface.withValues(alpha: 0.05),
              foregroundColor: theme.colorScheme.onSurface,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Перейти к устройству'),
          ),
        ),
      ].column(),
    );
  }
}
