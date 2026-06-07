import 'dart:math' show sqrt, atan2;

import 'package:flutter/material.dart';

enum SwipeDirection { unknown, vertical, horizontal }

/// Виджет для строгого определения направления свайпа.
/// Определяет направление жеста по порогу угла (30°) и расстояния (10px).
/// Горизонтальный свайп разрешает скролл PageView, вертикальный — блокирует.
class StrictSwipeListener extends StatefulWidget {
  final Widget child;
  final ValueChanged<SwipeDirection> onSwipeDirectionChanged;

  const StrictSwipeListener({
    super.key,
    required this.child,
    required this.onSwipeDirectionChanged,
  });

  @override
  State<StrictSwipeListener> createState() => _StrictSwipeListenerState();
}

class _StrictSwipeListenerState extends State<StrictSwipeListener> {
  SwipeDirection _swipeDirection = SwipeDirection.unknown;
  Offset? _initialPointerPosition;

  // Порог расстояния в пикселях для определения направления (меньше = быстрее реакция)
  static const double _distanceThreshold = 10.0;
  // Порог угла в радианах (30° = ~0.52 рад). Если угол < порога — горизонтальный, иначе — вертикальный
  static const double _angleThreshold = 0.48;

  void _onPointerDown(PointerDownEvent event) {
    _initialPointerPosition = event.position;
    if (_swipeDirection != SwipeDirection.unknown) {
      _updateDirection(SwipeDirection.unknown);
    }
  }

  void _onPointerMove(PointerMoveEvent event) {
    if (_initialPointerPosition == null ||
        _swipeDirection != SwipeDirection.unknown) {
      return;
    }

    final dx = event.position.dx - _initialPointerPosition!.dx;
    final dy = event.position.dy - _initialPointerPosition!.dy;
    final distance = _getDistance(dx, dy);

    // Ждём пока палец не сдвинется на пороговое расстояние
    if (distance < _distanceThreshold) {
      return;
    }

    // Вычисляем угол движения относительно горизонтали
    final angle = _getAngle(dx, dy);

    // Если угол маленький (близко к горизонтали) — горизонтальный свайп
    // Если угол большой (близко к вертикали) — вертикальный свайп
    final isHorizontal = angle.abs() < _angleThreshold;

    _updateDirection(
      isHorizontal ? SwipeDirection.horizontal : SwipeDirection.vertical,
    );
  }

  void _onPointerUp(PointerUpEvent event) {
    // Сбрасываем направление когда палец поднят
    _updateDirection(SwipeDirection.unknown);
  }

  void _updateDirection(SwipeDirection direction) {
    if (_swipeDirection != direction) {
      _swipeDirection = direction;
      widget.onSwipeDirectionChanged(direction);
    }
  }

  /// Вычисляет расстояние от начальной точки
  double _getDistance(double dx, double dy) {
    return sqrt(dx * dx + dy * dy);
  }

  /// Вычисляет угол движения относительно оси X (горизонтали)
  /// Возвращает значение от 0 до π/2 (абсолютное значение угла)
  double _getAngle(double dx, double dy) {
    // atan2 возвращает угол в радианах от -π до π
    // нас интересует абсолютное отклонение от горизонтали
    final angle = atan2(dy.abs(), dx.abs());
    return angle;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerMove: _onPointerMove,
      onPointerUp: _onPointerUp,
      behavior: HitTestBehavior.translucent,
      child: widget.child,
    );
  }
}
