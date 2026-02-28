import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iiot_monitoring/src/shared/widgets/iiot_card.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'controllers/dashboard_controller.dart';
import 'widgets/device_card.dart';
import 'widgets/dashboard_skeleton.dart';
import 'widgets/realtime_clock_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardControllerProvider);
    // Извлекаем данные безопасно, чтобы шапка могла показывать "0"
    // или предыдущее значение при перезагрузке.
    final devices = dashboardState.asData?.value ?? [];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Единственный источник истины для отступов страницы (32 верт, 16 гориз)
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 64, 16, 120),
            sliver: SliverList.separated(
              // Индекс 0 — RealtimeClockCard
              // Индекс 1 — StatusCard
              // Остальное: либо элементы, либо 1 заглушка (лоадер/ошибка/пусто).
              itemCount: _calculateItemCount(dashboardState, devices.length),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                // 1. Realtime Clock (Index 0)
                if (index == 0) {
                  return const RealtimeClockCard();
                }

                // 2. Status Card (Index 1)
                if (index == 1) {
                  return _StatusCard(
                    onRefresh: () =>
                        ref.invalidate(dashboardControllerProvider),
                    isLoading: dashboardState.isLoading,
                    devicesCount: devices.length,
                  );
                }

                // 3. Обработка состояний (Индекс > 1)
                return dashboardState.when(
                  data: (_) {
                    if (devices.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 64),
                        child: Center(child: Text('Устройства не найдены')),
                      );
                    }

                    // Сдвигаем индекс, т.к. 0 и 1 заняты
                    final deviceIndex = index - 2;
                    final device = devices[deviceIndex];

                    return DeviceCard(device: device)
                        .animate()
                        .fade(duration: 300.ms, delay: (deviceIndex * 50).ms)
                        .slideY(begin: 0.1, curve: Curves.easeOut);
                  },
                  loading: () => DashboardSkeleton(),
                  error: (error, _) => Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(36)),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: Column(
                      spacing: 24,
                      children: [
                        Icon(
                          LucideIcons.wifiOff,
                          color: Colors.redAccent,
                          size: 64,
                        ),
                        Text(
                          "Не удалось загрузить данные. Попробуйте заново.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () =>
                              ref.invalidate(dashboardControllerProvider),
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              Colors.redAccent,
                            ),
                          ),
                          child: Text(
                            "Повторить",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Высчитывает правильное количество элементов для списка
  int _calculateItemCount(AsyncValue state, int devicesCount) {
    // Если грузимся, ошибка или список пуст — показываем Clock (1) + Status (1) + Заглушка (1) = 3
    if (state.isLoading || state.hasError || devicesCount == 0) {
      return 3;
    }
    // Иначе: Clock (1) + Status (1) + Количество устройств
    return devicesCount + 2;
  }
}

class _StatusCard extends StatelessWidget {
  const _StatusCard({
    required this.onRefresh,
    required this.isLoading,
    required this.devicesCount,
  });

  final VoidCallback onRefresh;
  final bool isLoading;
  final int devicesCount;

  @override
  Widget build(BuildContext context) {
    Color primaryBg = Theme.of(
      context,
    ).colorScheme.primary.withValues(alpha: 0.05);
    Color errorBg = Theme.of(context).colorScheme.error.withValues(alpha: 0.05);

    return IiotCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 12,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: isLoading | (devicesCount == 0) ? 12 : 4,
                ),
                decoration: BoxDecoration(
                  color: devicesCount == 0
                      ? isLoading
                            ? primaryBg
                            : errorBg
                      : primaryBg,
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                ),
                child: isLoading
                    ? Icon(
                        LucideIcons.loader,
                        size: 20,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : devicesCount == 0
                    ? Icon(
                        LucideIcons.x,
                        size: 20,
                        color: Theme.of(context).colorScheme.error,
                      )
                    : Text(
                        devicesCount.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          letterSpacing: 0.2,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
              ),

              Text(
                isLoading ? 'Загрузка...' : 'Устройств',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  letterSpacing: 0.2,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.65),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: isLoading ? null : onRefresh,
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.surfaceDim,
              padding: const EdgeInsets.all(8),
            ),
            icon: const Icon(Icons.refresh_rounded, size: 24),
          ),
        ],
      ),
    );
  }
}
