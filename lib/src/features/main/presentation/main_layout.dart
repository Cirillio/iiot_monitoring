import 'package:flutter/material.dart';

import '../../dashboard/presentation/dashboard_screen.dart';
import '../../logs/presentation/logs_screen.dart';
import '../../settings/presentation/settings_screen.dart';
import 'widgets/floating_bottom_nav_bar.dart';
import 'widgets/strict_swipe_listener.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late final PageController _pageController;
  int _currentIndex = 1; // 0: Logs, 1: Dashboard, 2: Settings

  SwipeDirection _swipeDirection = SwipeDirection.unknown;

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

  void _onSwipeDirectionChanged(SwipeDirection direction) {
    setState(() {
      _swipeDirection = direction;
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
    return Scaffold(
      body: StrictSwipeListener(
        onSwipeDirectionChanged: _onSwipeDirectionChanged,
        child: Stack(
          children: [
            PageView(
              physics: _swipeDirection == SwipeDirection.vertical
                  ? const NeverScrollableScrollPhysics()
                  : null, // Использовать физику по умолчанию (разрешить горизонтальный скролл)
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: const [
                LogsScreen(),
                DashboardScreen(),
                SettingsScreen(),
              ],
            ),
            FloatingBottomNavBar(
              currentIndex: _currentIndex,
              onNavItemTapped: _onNavItemTapped,
            ),
          ],
        ),
      ),
    );
  }
}
