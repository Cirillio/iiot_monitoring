import 'package:flutter/material.dart';

/// Горизонтальный индикатор уставок (Threshold Bar).
///
/// Отрисовывает полосу с цветными зонами (мин. критический, мин. предупреждение,
/// норма, макс. предупреждение, макс. критический) и треугольным маркером
/// текущего значения.
///
/// Пропсы:
/// - [min] и [max] — границы шкалы
/// - [currentValue] — текущее значение для отображения маркера
/// - [minCritical], [minWarning], [maxWarning], [maxCritical] — уставки
/// - [primaryColor] — основной цвет для нормальных зон
class ThresholdBar extends StatelessWidget {
  final double min;
  final double max;
  final double currentValue;
  final double? minCritical;
  final double? minWarning;
  final double? maxWarning;
  final double? maxCritical;
  final Color primaryColor;

  const ThresholdBar({
    super.key,
    required this.min,
    required this.max,
    required this.currentValue,
    this.minCritical,
    this.minWarning,
    this.maxWarning,
    this.maxCritical,
    this.primaryColor = Colors.green,
  });

  /// Нормализует значение в диапазон 0..1 для позиционирования
  double _normalize(double value) {
    return ((value - min) / (max - min)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = 24.0;

        return Stack(
          alignment: Alignment.center,
          children: [
            // Фоновая полоса (серая)
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(height / 2),
              ),
            ),

            // Цветные зоны (если заданы уставки)
            if (minCritical != null && minWarning != null)
              _buildZone(
                width,
                height,
                _normalize(minCritical!),
                _normalize(minWarning!),
                Colors.red.shade300,
              ),

            if (minWarning != null)
              _buildZone(
                width,
                height,
                _normalize(minWarning!),
                _normalize(currentValue.clamp(minWarning!, maxWarning ?? max)),
                Colors.green.shade100,
              ),

            if (maxWarning != null && maxCritical != null)
              _buildZone(
                width,
                height,
                _normalize(maxWarning!),
                _normalize(maxCritical!),
                Colors.orange.shade200,
              ),

            if (maxWarning != null && maxCritical != null)
              _buildZone(
                width,
                height,
                _normalize(maxCritical!),
                1.0,
                Colors.red.shade300,
              ),

            // Треугольный маркер текущего значения
            Positioned(
              left: (_normalize(currentValue) * width) - 6,
              child: _buildMarker(height),
            ),
          ],
        );
      },
    );
  }

  /// Строит цветную зону на полосе
  Widget _buildZone(
    double totalWidth,
    double height,
    double startNorm,
    double endNorm,
    Color color,
  ) {
    if (endNorm <= startNorm) return const SizedBox.shrink();

    return Positioned(
      left: startNorm * totalWidth,
      width: (endNorm - startNorm) * totalWidth,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(height / 2),
        ),
      ),
    );
  }

  /// Строит треугольный маркер
  Widget _buildMarker(double height) {
    return CustomPaint(
      size: Size(12, height + 8),
      painter: _TriangleMarkerPainter(color: primaryColor),
    );
  }
}

/// Рисует треугольный маркер для ThresholdBar
class _TriangleMarkerPainter extends CustomPainter {
  final Color color;

  _TriangleMarkerPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    // Рисуем треугольник остриём вниз
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _TriangleMarkerPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
