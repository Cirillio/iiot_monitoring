import 'package:exui/exui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

/// Провайдер, обновляющий время каждую секунду
final _clockProvider = StreamProvider.autoDispose<DateTime>((ref) {
  return Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now());
});

class RealtimeClockCard extends ConsumerWidget {
  const RealtimeClockCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeAsync = ref.watch(_clockProvider);
    final now = timeAsync.value ?? DateTime.now();

    final timeStr = DateFormat('HH:mm:ss').format(now);
    final dayStr = DateFormat('EEEE', 'ru').format(now).toUpperCase();
    final dateStr = DateFormat('dd.MM.yyyy').format(now);

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Время
        Text(
          timeStr,
          style: theme.textTheme.displayMedium?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.0,
            height: 1.0,
            fontSize: 64,
            shadows: [
              Shadow(
                color: Colors.black.withValues(alpha: 0.5),
                offset: const Offset(.5, .5),
                blurRadius: 2,
              ),
            ],
          ),
        ),
        // Дата (ДЕНЬ, дд.мм.гггг)
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: [
            Text(
              '$dayStr, ',
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.8),
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            Text(
              dateStr,
              style: theme.textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.5),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    ).padding(EdgeInsets.symmetric(horizontal: 24));
  }
}
