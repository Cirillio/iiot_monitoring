import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:exui/exui.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'controllers/dashboard_controller.dart';
import 'widgets/device_card.dart';
import 'widgets/dashboard_skeleton.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Мониторинг',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: dashboardState.when(
        data: (devices) {
          if (devices.isEmpty) {
            return const Text('Устройства не найдены').center();
          }

          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 160),
            itemCount: devices.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return DeviceCard(device: devices[index])
                  .animate()
                  .fade(duration: 300.ms, delay: (index * 100).ms)
                  .slideY(begin: 0.1, curve: Curves.easeOut);
            },
          );
        },
        loading: () => const DashboardSkeleton(),
        error: (error, stack) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
          child: [
            const Icon(
              Icons.wifi_off_rounded,
              color: Colors.redAccent,
              size: 64,
            ),
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
                onPressed: () => ref.invalidate(dashboardControllerProvider),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Попробовать снова'),
              ),
            ),
          ].column().center(),
        ),
      ),
    );
  }
}
