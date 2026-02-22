import 'package:flutter/material.dart';
import 'package:exui/exui.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DashboardSkeleton extends StatelessWidget {
  const DashboardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 160),
      child: Column(
        children: [
          const DeviceCardSkeleton(),
          const SizedBox(height: 16),
          const DeviceCardSkeleton(),
        ],
      ),
    );
  }
}

class DeviceCardSkeleton extends StatelessWidget {
  const DeviceCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final baseColor = theme.colorScheme.onSurface.withValues(alpha: 0.05);

    return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
            ),
          ),
          child: [
            // Header Skeleton
            [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: baseColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: [
                  Container(
                    width: 120,
                    height: 18,
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 80,
                    height: 12,
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ].column(crossAxisAlignment: CrossAxisAlignment.start),
              ),
              Container(
                width: 40,
                height: 12,
                decoration: BoxDecoration(
                  color: baseColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ].row(),

            const SizedBox(height: 16),

            // Grid Skeleton
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.9,
              ),
              itemCount: 4,
              itemBuilder: (context, index) => const SensorCardSkeleton(),
            ),

            const SizedBox(height: 16),

            // Button Skeleton
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ].column(),
        )
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .shimmer(
          duration: 1500.ms,
          color: theme.colorScheme.primary.withValues(alpha: 0.05),
        );
  }
}

class SensorCardSkeleton extends StatelessWidget {
  const SensorCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final baseColor = theme.colorScheme.onSurface.withValues(alpha: 0.05);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: [
        [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(color: baseColor, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              width: 60,
              height: 12,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ].row(),
        const Spacer(),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(color: baseColor, shape: BoxShape.circle),
        ).center(),
        const Spacer(),
        Container(
          width: 70,
          height: 20,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 40,
          height: 8,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ].column(crossAxisAlignment: CrossAxisAlignment.start),
    );
  }
}
