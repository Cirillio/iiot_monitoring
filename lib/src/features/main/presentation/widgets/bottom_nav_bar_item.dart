import 'package:flutter/material.dart';

class BottomNavBarItem extends StatefulWidget {
  final String name;
  final IconData icon;
  final bool isActive;
  final Color activeColor;
  final VoidCallback onTap;

  const BottomNavBarItem({
    super.key,
    required this.name,
    required this.icon,
    required this.isActive,
    required this.activeColor,
    required this.onTap,
  });

  @override
  State<BottomNavBarItem> createState() => _BottomNavBarItemState();
}

class _BottomNavBarItemState extends State<BottomNavBarItem> {
  late final WidgetStatesController _statesController;

  @override
  void initState() {
    super.initState();
    _statesController = WidgetStatesController();
    // Слушаем изменения состояний, чтобы перерисовывать AnimatedContainer и AnimatedSwitcher
    _statesController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _statesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onSurface = theme.colorScheme.onSurface;
    final isPressed = _statesController.value.contains(WidgetState.pressed);

    // Определяем цвет контента (иконка и текст) через WidgetStateProperty
    final contentColor = WidgetStateProperty.resolveWith<Color>((states) {
      if (widget.isActive) return widget.activeColor;
      if (states.contains(WidgetState.pressed)) {
        return onSurface.withValues(alpha: 0.75);
      }
      return onSurface.withValues(alpha: 0.5);
    }).resolve(_statesController.value);

    // Определяем цвет фона
    final backgroundColor = WidgetStateProperty.resolveWith<Color>((states) {
      if (widget.isActive) {
        return widget.activeColor.withValues(
          alpha: states.contains(WidgetState.pressed) ? 0.25 : 0.15,
        );
      }
      return Colors.transparent;
    }).resolve(_statesController.value);

    return InkResponse(
      onTap: widget.onTap,
      statesController: _statesController,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(26)),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),
          child: Column(
            key: ValueKey('${widget.isActive}_$isPressed'),
            mainAxisSize: MainAxisSize.min,
            spacing: 2,
            children: [
              Icon(
                key: ValueKey(
                  'icon_${widget.icon}_${widget.isActive}_$isPressed',
                ),
                size: 22,
                widget.icon,
                color: contentColor,
              ),
              Text(
                key: ValueKey(
                  'text_${widget.name}_${widget.isActive}_$isPressed',
                ),
                widget.name,
                style: TextStyle(
                  fontSize: 12,
                  color: contentColor,
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
    );
  }
}
