import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../shared/models/device.dart';
import '../../../../shared/widgets/iiot_card.dart';

/// Заголовок страницы устройства: иконка, название, бейдж онлайн и
/// строка с метаданными (IP, Port, Slave ID, количество датчиков).
class DeviceDetailHeader extends StatelessWidget {
  final Device device;

  const DeviceDetailHeader({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IiotCard(
      child: Column(
        spacing: 12,
        children: [
          // Верхний ряд: иконка, название, Online бейдж
          Row(
            spacing: 12,
            children: [
              // Иконка устройства
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Icon(
                  LucideIcons.network,
                  color: theme.colorScheme.primary,
                  size: 32,
                ),
              ),

              // Название устройства
              Expanded(
                child: Text(
                  device.name ?? 'unnamed device',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // Бейдж статуса
              _OnlineBadge(isOnline: device.isActive),
            ],
          ),

          // Нижний ряд: метаданные (IP, Port, Slave ID, Датчиков)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _statCell(
                context: context,
                value: device.ipAddress ?? '—',
                label: 'IP',
                labelIcon: LucideIcons.globe,
              ),
              _statCell(
                context: context,
                value: '${device.port ?? '—'}',
                label: 'Port',
                labelIcon: LucideIcons.plug,
              ),
              _statCell(
                context: context,
                value: '${device.slaveId ?? '—'}',
                label: 'Slave ID',
                labelIcon: LucideIcons.hash,
              ),
              _statCell(
                context: context,
                value: '${device.totalSensors}',
                label: 'Датчиков',
                labelIcon: LucideIcons.cpu,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statCell({
    required BuildContext context,
    required String value,
    required String label,
    IconData? labelIcon,
  }) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            if (labelIcon != null)
              Icon(
                labelIcon,
                size: 14,
                color: theme.colorScheme.primary.withValues(alpha: 0.75),
              ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Бейджик статуса Online/Offline
class _OnlineBadge extends StatelessWidget {
  final bool isOnline;

  const _OnlineBadge({required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isOnline
            ? Colors.green.withValues(alpha: 0.15)
            : Colors.red.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isOnline ? Colors.green : Colors.red,
            ),
          ),
          Text(
            isOnline ? 'Online' : 'Offline',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isOnline ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
