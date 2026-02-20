import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../dashboard/presentation/dashboard_screen.dart';
import '../../logs/presentation/logs_screen.dart';
import '../../settings/presentation/settings_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late final PageController _pageController;
  int _currentIndex = 1; // 0: Logs, 1: Dashboard, 2: Settings

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onNavItemTapped(int index) {
    if (_currentIndex == index) return;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: const [LogsScreen(), DashboardScreen(), SettingsScreen()],
          ),

          // Floating Bottom Navbar
          Positioned(
            left: 0,
            right: 0,
            bottom: 64,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    color: Colors.black.withValues(alpha: 0.5),
                    child: Row(
                      spacing: 12,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _NavItem(
                          icon: LucideIcons.scrollText,
                          isActive: _currentIndex == 0,
                          activeColor: theme.colorScheme.primary,
                          onTap: () => _onNavItemTapped(0),
                        ),
                        _NavItem(
                          icon: LucideIcons.layoutDashboard,
                          isActive: _currentIndex == 1,
                          activeColor: theme.colorScheme.primary,
                          onTap: () => _onNavItemTapped(1),
                        ),
                        _NavItem(
                          icon: LucideIcons.settings,
                          isActive: _currentIndex == 2,
                          activeColor: theme.colorScheme.primary,
                          onTap: () => _onNavItemTapped(2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final Color activeColor;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.isActive,
    required this.activeColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Icon(
            icon,
            key: ValueKey<bool>(isActive),
            color: isActive ? activeColor : Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}
