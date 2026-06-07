import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IIoTSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const IIoTSwitch({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return GestureDetector(
      onTap: () {
        onChanged(!value);
        HapticFeedback.selectionClick();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 50),
            curve: Curves.easeInOut,
            width: 44,
            height: 24,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: value
                  ? primary.withValues(alpha: 0.15)
                  : theme.colorScheme.surfaceDim,
              borderRadius: BorderRadius.circular(32),
            ),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeInOut,
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: value
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
