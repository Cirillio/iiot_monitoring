import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iiot_monitoring/src/shared/widgets/iiot_card.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:iiot_monitoring/src/features/dashboard/presentation/controllers/calculated_device_notifier.dart';
import 'package:iiot_monitoring/src/features/dashboard/presentation/widgets/device_card.dart';
import 'package:iiot_monitoring/src/features/dashboard/presentation/widgets/dashboard_skeleton.dart';
import 'package:iiot_monitoring/src/features/dashboard/presentation/widgets/realtime_clock_card.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/calculated_device.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(calculatedDeviceProvider);
    final devices = dashboardState.asData?.value ?? [];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 64, 16, 120),
            sliver: SliverList.separated(
              itemCount: _calculateItemCount(dashboardState, devices.length),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const RealtimeClockCard();
                }

                if (index == 1) {
                  return _StatusCard(
                    onRefresh: () => ref.invalidate(calculatedDeviceProvider),
                    isLoading: dashboardState.isLoading,
                    devicesCount: devices.length,
                  );
                }

                return dashboardState.when(
                  data: (data) {
                    final typedDevices = data as List<CalculatedDevice>;
                    if (typedDevices.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 64),
                        child: Center(child: Text('Устройства не найдены')),
                      );
                    }

                    final deviceIndex = index - 2;
                    final device = typedDevices[deviceIndex];

                    return DeviceCard(device: device)
                        .animate()
                        .fade(duration: 300.ms, delay: (deviceIndex * 50).ms)
                        .slideY(begin: 0.1, curve: Curves.easeOut);
                  },
                  loading: () => const DashboardSkeleton(),
                  error: (error, _) => _ErrorCard(
                    onRetry: () => ref.invalidate(calculatedDeviceProvider),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  int _calculateItemCount(AsyncValue state, int devicesCount) {
    if (state.isLoading || state.hasError || devicesCount == 0) {
      return 3;
    }
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
    final theme = Theme.of(context);
    final primaryBg = theme.colorScheme.primary.withOpacity(0.05);
    final errorBg = theme.colorScheme.error.withOpacity(0.05);

    return IiotCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: isLoading || (devicesCount == 0) ? 12 : 4,
                ),
                decoration: BoxDecoration(
                  color: devicesCount == 0
                      ? isLoading
                            ? primaryBg
                            : errorBg
                      : primaryBg,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: isLoading
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: theme.colorScheme.primary,
                        ),
                      )
                    : devicesCount == 0
                    ? Icon(
                        LucideIcons.x,
                        size: 20,
                        color: theme.colorScheme.error,
                      )
                    : Text(
                        devicesCount.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: theme.colorScheme.primary,
                        ),
                      ),
              ),
              const SizedBox(width: 12),
              Text(
                isLoading ? 'Загрузка...' : 'Устройств',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: theme.colorScheme.onSurface.withOpacity(0.65),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: isLoading ? null : onRefresh,
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.surfaceVariant,
              padding: const EdgeInsets.all(8),
            ),
            icon: const Icon(Icons.refresh_rounded, size: 24),
          ),
        ],
      ),
    );
  }
}

class _ErrorCard extends StatelessWidget {
  final VoidCallback onRetry;
  const _ErrorCard({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        children: [
          const Icon(LucideIcons.wifiOff, color: Colors.redAccent, size: 64),
          const SizedBox(height: 24),
          const Text(
            "Не удалось загрузить данные",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
            ),
            child: const Text("Повторить"),
          ),
        ],
      ),
    );
  }
}
