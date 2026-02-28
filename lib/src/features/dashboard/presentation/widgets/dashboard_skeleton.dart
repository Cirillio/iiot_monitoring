import 'package:flutter/material.dart';
import 'package:exui/exui.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DashboardSkeleton extends StatelessWidget {
  const DashboardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
      child: Column(
        children: [
          const DeviceCardSkeleton(),
          const SizedBox(height: 6),
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
          ),
          child: [
            // Header Skeleton (status dot, name, IP, ID)
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
                    width: 140,
                    height: 18,
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: 100,
                    height: 14,
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ].column(crossAxisAlignment: CrossAxisAlignment.start),
              ),
              Container(
                width: 50,
                height: 12,
                decoration: BoxDecoration(
                  color: baseColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ].row(),

            const SizedBox(height: 16),

            // Sensors Grid Skeleton (2x2)
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
              childAspectRatio: 0.85,
              children: const [
                SensorCardSkeleton(),
                SensorCardSkeleton(),
                SensorCardSkeleton(),
                SensorCardSkeleton(),
              ],
            ),

            const SizedBox(height: 12),

            // Total sensors text skeleton
            Container(
              width: 120,
              height: 12,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),

            const SizedBox(height: 16),

            // Action Button Skeleton
            Container(
              width: double.infinity,
              height: 44,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(36),
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(32),
      ),
      child: [
        // Top Row: Icon + Name + Type
        [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: [
              Container(
                width: 70,
                height: 13,
                decoration: BoxDecoration(
                  color: baseColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: 50,
                height: 10,
                decoration: BoxDecoration(
                  color: baseColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ].column(crossAxisAlignment: CrossAxisAlignment.start),
          ),
        ].row(),

        // Trend Icon placeholder
        const Spacer(),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(24),
          ),
        ).center(),
        const Spacer(),

        // Value and metadata
        [
          Container(
            width: 80,
            height: 24,
            decoration: BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ).center(),
          const SizedBox(height: 6),
          [
            Container(
              width: 60,
              height: 8,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              width: 40,
              height: 8,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ].row(mainAxisAlignment: MainAxisAlignment.spaceBetween),
        ].column(crossAxisAlignment: CrossAxisAlignment.start),
      ].column(crossAxisAlignment: CrossAxisAlignment.start),
    );
  }
}
