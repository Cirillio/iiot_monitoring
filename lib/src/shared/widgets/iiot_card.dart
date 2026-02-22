import 'package:flutter/material.dart';

/// Унифицированный контейнер для всех элементов дашборда.
/// Гарантирует идентичный визуальный стиль (Design System) для карточек статуса,
/// устройств и любых будущих виджетов.
class IiotCard extends StatelessWidget {
  final Widget child;
  final bool usePadding;

  /// Базовый отступ внутри карточки. По умолчанию равен 16, как было в DeviceCard,
  /// но оставлена возможность переопределения для специфичных случаев.
  final EdgeInsetsGeometry padding;

  const IiotCard({
    super.key,
    required this.child,
    this.usePadding = true,
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: usePadding ? padding : EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(36.0),
        // Любые будущие изменения теней, обводок или эффектов наведения
        // должны делаться ТОЛЬКО здесь.
      ),
      child: child,
    );
  }
}
