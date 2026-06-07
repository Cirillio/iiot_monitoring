import 'package:flutter/material.dart';

import '../../dashboard/presentation/dashboard_screen.dart';
import '../../logs/presentation/logs_screen.dart';
import '../../settings/presentation/settings_screen.dart';
import 'widgets/floating_bottom_nav_bar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 1; // 0: Logs, 1: Dashboard, 2: Settings
  late AnimationController _animationController;
  late Animation<double> _animation;

  // Позиция свайпа (0 = Logs, 1 = Dashboard, 2 = Settings)
  double _swipePosition = 1.0;
  double? _startSwipePosition;
  double? _startSwipeOffset;

  static const _screens = [LogsScreen(), DashboardScreen(), SettingsScreen()];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    // Плавная кривая без отскока
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    _startSwipePosition = _swipePosition;
    _startSwipeOffset = details.globalPosition.dx;
    _animationController.stop();
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    if (_startSwipePosition == null || _startSwipeOffset == null) return;

    final delta = details.globalPosition.dx - _startSwipeOffset!;
    final screenWidth = MediaQuery.of(context).size.width;

    // Ограничиваем свайп пределами [0, 2]
    _swipePosition = (_startSwipePosition! - delta / screenWidth).clamp(
      0.0,
      (_screens.length - 1).toDouble(),
    );

    setState(() {});
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    // Порог: 25% следующей страницы достаточно для переключения
    final threshold = 0.15;

    int targetPage;

    // Свайп влево (к предыдущей странице)
    if (_swipePosition < _currentIndex - threshold) {
      targetPage = _currentIndex - 1;
    }
    // Свайп вправо (к следующей странице)
    else if (_swipePosition > _currentIndex + threshold) {
      targetPage = _currentIndex + 1;
    }
    // Недостаточно перетащили — возвращаемся к текущей
    else {
      targetPage = _currentIndex;
    }

    // Ограничиваем в пределах [0, 2]
    targetPage = targetPage.clamp(0, _screens.length - 1);

    // Анимация к целевой странице
    _animateToPage(targetPage);
  }

  void _animateToPage(int page) {
    final startPos = _swipePosition;
    _animationController.reset();

    _animationController.addListener(() {
      setState(() {
        _swipePosition = startPos + (page - startPos) * _animation.value;
      });
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _currentIndex = page;
          _swipePosition = page.toDouble();
        });
        _animationController.removeStatusListener(_onAnimationStatus);
      }
    });

    _animationController.forward();
  }

  void _onAnimationStatus(AnimationStatus status) {
    // Пустой обработчик для предотвращения утечек
  }

  void _onNavItemTapped(int index) {
    if (_currentIndex == index) return;
    _animateToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // GestureDetector для горизонтальных свайпов
          GestureDetector(
            onHorizontalDragStart: _onHorizontalDragStart,
            onHorizontalDragUpdate: _onHorizontalDragUpdate,
            onHorizontalDragEnd: _onHorizontalDragEnd,
            behavior: HitTestBehavior.translucent,
            child: SizedBox.expand(
              child: Stack(
                children: [
                  for (int i = 0; i < _screens.length; i++)
                    Positioned.fill(
                      child: OverflowBox(
                        maxWidth: screenWidth * 3,
                        child: Transform.translate(
                          offset: Offset((i - _swipePosition) * screenWidth, 0),
                          child: SizedBox(
                            width: screenWidth,
                            child: _screens[i],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          FloatingBottomNavBar(
            currentIndex: _currentIndex,
            onNavItemTapped: _onNavItemTapped,
          ),
        ],
      ),
    );
  }
}
