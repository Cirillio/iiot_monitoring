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
  final int criticalCount;
  final int offlineCount;

  const DeviceSensorStatusPanels({
    super.key,
    required this.okCount,
    required this.alertCount,
    required this.criticalCount,
    required this.offlineCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        // В норме
        Expanded(
          child: IiotCard(
            border: BoxBorder.all(
              color: okCount > 0 ? Colors.green : Colors.transparent,
            ),
            child: _SummaryItem(
              label: 'OK',
              count: okCount,
              color: Colors.green,
            ),
          ),
        ),

        // Тревоги
        Expanded(
          child: IiotCard(
            border: BoxBorder.all(
              color: alertCount > 0 ? Colors.orange : Colors.transparent,
            ),
            child: _SummaryItem(
              label: 'WARN',
              count: alertCount,
              color: Colors.orange,
            ),
          ),
        ),
        // Тревоги
        Expanded(
          child: IiotCard(
            border: BoxBorder.all(
              color: criticalCount > 0 ? Colors.red : Colors.transparent,
            ),
            child: _SummaryItem(
              label: 'CRIT',
              count: criticalCount,
              color: Colors.red,
            ),
          ),
        ),
        // Тревоги
        Expanded(
          child: IiotCard(
            border: BoxBorder.all(
              color: offlineCount == 0 ? Colors.transparent : Colors.grey,
            ),
            child: _SummaryItem(
              label: 'OFF',
              count: offlineCount,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}

/// Отдельный элемент сводки (плашка с иконкой, заголовком и цифрой)
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
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
