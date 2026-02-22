import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:exui/exui.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iiot_monitoring/src/shared/widgets/iiot_card.dart';
import 'controllers/dashboard_controller.dart';
import 'widgets/device_card.dart';
import 'widgets/dashboard_skeleton.dart';

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
            padding: const EdgeInsets.fromLTRB(16, 64, 16, 172),
            sliver: SliverList.separated(
              // Индекс 0 — это всегда StatusCard.
              // Остальное: либо элементы, либо 1 заглушка (лоадер/ошибка/пусто).
              itemCount: _calculateItemCount(dashboardState, devices.length),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                // 1. Фиксированный Header (Status Card)
                if (index == 0) {
                  return _StatusCard(
                    onRefresh: () =>
                        ref.invalidate(dashboardControllerProvider),
                    isLoading: dashboardState.isLoading,
                    devicesCount: devices.length,
                  );
                }

                // 2. Обработка состояний (Индекс > 0)
                return dashboardState.when(
                  data: (_) {
                    if (devices.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 64),
                        child: Center(child: Text('Устройства не найдены')),
                      );
                    }

                    // Сдвигаем индекс, т.к. 0-й элемент занят StatusCard
                    final deviceIndex = index - 1;
                    final device = devices[deviceIndex];

                    return DeviceCard(device: device)
                        .animate()
                        .fade(duration: 300.ms, delay: (deviceIndex * 50).ms)
                        .slideY(begin: 0.1, curve: Curves.easeOut);
                  },
                  loading: () => const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: DashboardSkeleton(),
                  ),
                  error: (error, _) => Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: _ErrorView(
                      error: error,
                      onRetry: () =>
                          ref.invalidate(dashboardControllerProvider),
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
    // Если грузимся, ошибка или список пуст — показываем StatusCard (1) + Заглушка (1) = 2
    if (state.isLoading || state.hasError || devicesCount == 0) {
      return 2;
    }
    // Иначе: StatusCard (1) + Количество устройств
    return devicesCount + 1;
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
    return IiotCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 12,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                ),
                child: Text(
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
                'Устройств',
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
            onPressed: onRefresh,
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

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.error, required this.onRetry});

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.wifi_off_rounded, color: Colors.redAccent, size: 64),
          const SizedBox(height: 24),
          Text(
            error.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Попробовать снова'),
            ),
          ),
        ],
      ),
    );
  }
}
