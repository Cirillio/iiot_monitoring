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
            children: [LogsScreen(), DashboardScreen(), SettingsScreen()],
          ),

          // Floating Bottom Navbar
          Positioned(
            left: 0,
            right: 0,
            bottom: 64,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 2.5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(36),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: Row(
                        spacing: 6,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _NavItem(
                            name: 'Logs',
                            icon: LucideIcons.scrollText,
                            isActive: _currentIndex == 0,
                            activeColor: theme.colorScheme.primary,
                            onTap: () => _onNavItemTapped(0),
                          ),
                          _NavItem(
                            name: 'Dashboard',
                            icon: LucideIcons.layoutDashboard,
                            isActive: _currentIndex == 1,
                            activeColor: theme.colorScheme.primary,
                            onTap: () => _onNavItemTapped(1),
                          ),
                          _NavItem(
                            name: 'Settings',
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
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String name;
  final IconData icon;
  final bool isActive;
  final Color activeColor;
  final VoidCallback onTap;

  const _NavItem({
    required this.name,
    required this.icon,
    required this.isActive,
    required this.activeColor,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onSurface = theme.colorScheme.onSurface;

    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      behavior: HitTestBehavior.opaque,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.all(Radius.circular(32)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: widget.isActive
                ? widget.activeColor.withValues(alpha: _isPressed ? 0.25 : 0.15)
                : onSurface.withValues(alpha: 0.0),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Column(
              key: ValueKey('${widget.isActive}_$_isPressed'),
              mainAxisSize: MainAxisSize.min,
              spacing: 2,
              children: [
                Icon(
                  key: ValueKey(
                    'icon_${widget.icon}_${widget.isActive}_$_isPressed',
                  ),
                  size: 22,
                  widget.icon,
                  color: widget.isActive
                      ? widget.activeColor
                      : _isPressed
                      ? onSurface.withValues(alpha: 0.75)
                      : onSurface.withValues(alpha: 0.5),
                ),
                Text(
                  key: ValueKey(
                    'text_${widget.name}_${widget.isActive}_$_isPressed',
                  ),
                  widget.name,
                  style: TextStyle(
                    fontSize: 12,
                    color: widget.isActive
                        ? widget.activeColor
                        : _isPressed
                        ? onSurface.withValues(alpha: 0.75)
                        : onSurface.withValues(alpha: 0.5),
                    fontWeight: widget.isActive
                        ? FontWeight.w600
                        : FontWeight.w500,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
