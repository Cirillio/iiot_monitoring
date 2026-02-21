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
        borderRadius: const BorderRadius.all(Radius.circular(32)),
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
