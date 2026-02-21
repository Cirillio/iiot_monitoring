import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:exui/exui.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'controllers/dashboard_controller.dart';
import 'widgets/device_card.dart';

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
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 120), // Bottom padding for navbar
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
        loading: () => const CircularProgressIndicator().center(),
        error: (error, stack) => [
          const Icon(Icons.error_outline, color: Colors.redAccent, size: 48),
          const SizedBox(height: 16),
          Text('Ошибка: $error', textAlign: TextAlign.center),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => ref.invalidate(dashboardControllerProvider),
            child: const Text('Повторить'),
          ),
        ].column().center(),
      ),
    );
  }
}
