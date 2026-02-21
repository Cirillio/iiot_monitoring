import 'package:flutter/material.dart';

enum SwipeDirection { unknown, vertical, horizontal }

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

  void _onPointerDown(PointerDownEvent event) {
    _initialPointerPosition = event.position;
    if (_swipeDirection != SwipeDirection.unknown) {
      _updateDirection(SwipeDirection.unknown);
    }
  }

  void _onPointerMove(PointerMoveEvent event) {
    if (_initialPointerPosition != null &&
        _swipeDirection == SwipeDirection.unknown) {
      final dx = (event.position.dx - _initialPointerPosition!.dx).abs();
      final dy = (event.position.dy - _initialPointerPosition!.dy).abs();

      if (dx > 7 || dy > 7) {
        _updateDirection(
          dy > dx ? SwipeDirection.vertical : SwipeDirection.horizontal,
        );
      }
    }
  }

  void _updateDirection(SwipeDirection direction) {
    if (_swipeDirection != direction) {
      setState(() {
        _swipeDirection = direction;
      });
      widget.onSwipeDirectionChanged(direction);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerMove: _onPointerMove,
      child: widget.child,
    );
  }
}
