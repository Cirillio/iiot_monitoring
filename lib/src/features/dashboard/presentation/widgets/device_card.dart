import 'package:flutter/material.dart';
import 'package:exui/exui.dart';
import 'package:iiot_monitoring/src/shared/widgets/iiot_card.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/calculated_device.dart';
import 'package:iiot_monitoring/src/features/dashboard/presentation/widgets/tag_card.dart';
import 'package:iiot_monitoring/src/features/device_detail/presentation/device_detail_screen.dart';

class DeviceCard extends StatelessWidget {
  final CalculatedDevice device;

  const DeviceCard({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final domainDevice = device.device;

    return IiotCard(
      child: [
        // Header
        [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: domainDevice.isOnline
                  ? Colors.greenAccent
                  : Colors.redAccent,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: [
              Text(
                domainDevice.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                domainDevice.ipAddress,
                style: TextStyle(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ].column(crossAxisAlignment: CrossAxisAlignment.start),
          ),
          Text(
            'ID: ${domainDevice.id}',
            style: TextStyle(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
            ),
          ),
        ].row().padding(
          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        ),

        // Summary Statistics
        [
              _SummaryItem(
                label: 'OK',
                count: device.summary.normalCount,
                color: Colors.greenAccent,
              ),
              _SummaryItem(
                label: 'WARN',
                count: device.summary.warningCount,
                color: Colors.orangeAccent,
              ),
              _SummaryItem(
                label: 'CRIT',
                count: device.summary.criticalCount,
                color: Colors.redAccent,
              ),
              _SummaryItem(
                label: 'OFF',
                count: device.summary.offlineCount,
                color: Colors.grey,
              ),
            ]
            .row(mainAxisAlignment: MainAxisAlignment.spaceAround)
            .padding(const EdgeInsets.symmetric(vertical: 8)),

        // Tags Grid (Show only first 4 tags in the card)
        if (device.tags.isNotEmpty)
          List.generate((device.tags.take(4).length / 2).ceil(), (index) {
            final first = device.tags[index * 2];
            final second = (index * 2 + 1 < device.tags.take(4).length)
                ? device.tags[index * 2 + 1]
                : null;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: TagCard(tag: first)),
                const SizedBox(width: 16),
                Expanded(
                  child: second != null
                      ? TagCard(tag: second)
                      : const SizedBox(),
                ),
              ],
            );
          }).column(spacing: 16),

        // Action Button
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      DeviceDetailScreen(deviceId: domainDevice.id),
                ),
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1),
              foregroundColor: theme.colorScheme.onSurface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
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

class _SummaryItem extends StatelessWidget {
  final String label;
  final int count;
  final Color color;

  const _SummaryItem({
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}
