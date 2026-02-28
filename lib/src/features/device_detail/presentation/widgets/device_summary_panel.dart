import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../shared/widgets/iiot_card.dart';

/// Сводка по устройству: показывает общее количество датчиков,
/// количество в норме и количество с тревогами.
///
/// Пропсы:
/// - [totalCount] — общее количество датчиков
/// - [okCount] — количество датчиков в норме
/// - [alertCount] — количество датчиков с тревогами/критических
class DeviceSensorStatusPanels extends StatelessWidget {
  final int okCount;
  final int alertCount;

  const DeviceSensorStatusPanels({
    super.key,
    required this.okCount,
    required this.alertCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        // В норме
        Expanded(
          child: IiotCard(
            child: _SummaryItem(
              icon: LucideIcons.checkCircle,
              label: 'В норме',
              value: okCount,
              color: Colors.green,
              backgroundColor: Colors.green.withValues(alpha: 0.1),
            ),
          ),
        ),

        // Тревоги
        Expanded(
          child: IiotCard(
            child: _SummaryItem(
              icon: LucideIcons.alertTriangle,
              label: 'Тревоги',
              value: alertCount,
              color: alertCount > 0 ? Colors.red : Colors.orange,
              backgroundColor: (alertCount > 0 ? Colors.red : Colors.orange)
                  .withValues(alpha: 0.1),
            ),
          ),
        ),
      ],
    );
  }
}

/// Отдельный элемент сводки (плашка с иконкой, заголовком и цифрой)
class _SummaryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int value;
  final Color color;
  final Color backgroundColor;

  const _SummaryItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: color,
            fontWeight: FontWeight(600),
          ),
        ),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
