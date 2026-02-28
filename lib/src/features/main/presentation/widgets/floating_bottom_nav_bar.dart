import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'bottom_nav_bar_item.dart';

class FloatingBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onNavItemTapped;

  const FloatingBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onNavItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Positioned(
      left: 0,
      right: 0,
      bottom: 96,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(38),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 6,
                offset: const Offset(0, 2.5),
              ),
            ],
            border: Border.all(
              color: theme.colorScheme.outline.withValues(alpha: .15),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(36),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Row(
                  spacing: 6,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BottomNavBarItem(
                      name: 'Logs',
                      icon: LucideIcons.scrollText,
                      isActive: currentIndex == 0,
                      activeColor: theme.colorScheme.primary,
                      onTap: () => onNavItemTapped(0),
                    ),
                    BottomNavBarItem(
                      name: 'Dashboard',
                      icon: LucideIcons.layoutDashboard,
                      isActive: currentIndex == 1,
                      activeColor: theme.colorScheme.primary,
                      onTap: () => onNavItemTapped(1),
                    ),
                    BottomNavBarItem(
                      name: 'Settings',
                      icon: LucideIcons.settings,
                      isActive: currentIndex == 2,
                      activeColor: theme.colorScheme.primary,
                      onTap: () => onNavItemTapped(2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
