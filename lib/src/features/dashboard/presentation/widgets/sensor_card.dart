import 'package:flutter/material.dart';
import 'package:exui/exui.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../shared/models/sensor.dart';
import 'package:material_symbols_icons/get.dart'; // ВАЖНО: именно /get.dart

enum SensorStatus { normal, critical, offline }

extension SensorStatusX on Sensor {
  SensorStatus get status {
    if (currentValue == null) return SensorStatus.offline;

    final min = uiConfigJson?.minCritical;
    final max = uiConfigJson?.maxCritical;

    if ((min != null && currentValue! < min) ||
        (max != null && currentValue! > max)) {
      return SensorStatus.critical;
    }

    return SensorStatus.normal;
  }

  Color getStatusColor(BuildContext context) {
    switch (status) {
      case SensorStatus.normal:
        return Colors.greenAccent;
      case SensorStatus.critical:
        return Colors.redAccent;
      case SensorStatus.offline:
        return Colors.grey;
    }
  }

  IconData get trendIcon {
    if (status == SensorStatus.offline) return LucideIcons.wifiOff;
    if (status == SensorStatus.normal) return LucideIcons.check;

    final min = uiConfigJson?.minCritical;
    final max = uiConfigJson?.maxCritical;

    if (max != null && currentValue! > max) return LucideIcons.chevronsUp;
    if (min != null && currentValue! < min) return LucideIcons.chevronsDown;

    return LucideIcons.check;
  }
}

class SensorCard extends StatefulWidget {
  final Sensor sensor;

  const SensorCard({super.key, required this.sensor});

  @override
  State<SensorCard> createState() => _SensorCardState();
}

class _SensorCardState extends State<SensorCard> {
  late final WidgetStatesController _statesController;

  @override
  void initState() {
    super.initState();
    _statesController = WidgetStatesController();
    _statesController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _statesController.dispose();
    super.dispose();
  }

  Color _parseHexColor(String? hex) {
    if (hex == null) return Colors.white;
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xff')));
    } catch (_) {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = widget.sensor.getStatusColor(
      context,
    ); // Use widget.sensor
    final iconColor = _parseHexColor(
      widget.sensor.uiConfigJson?.color,
    ); // Use widget.sensor

    final isPressed = _statesController.value.contains(WidgetState.pressed);

    return Listener(
      onPointerDown: (_) => _statesController.update(WidgetState.pressed, true),
      onPointerUp: (_) => _statesController.update(WidgetState.pressed, false),
      onPointerCancel: (_) =>
          _statesController.update(WidgetState.pressed, false),
      child: GestureDetector(
        onTap: () {}, // Добавь логику нажатия здесь
        behavior: HitTestBehavior.opaque,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: isPressed ? 0.6 : 1.0,
          child: Container(
            // Removed extra closing parenthesis here
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  theme.colorScheme.surface,
                  statusColor.withValues(alpha: 0.15),
                ],
              ),
            ),
            child: [
              // Top Row
              [
                Icon(
                  SymbolsGet.get(
                    widget.sensor.uiConfigJson?.icon ?? 'horizontal_rule',
                    SymbolStyle.rounded,
                  ),
                  color: iconColor,
                  size: 24,
                ),
                Expanded(
                  child: [
                    Text(
                      widget.sensor.name ?? "Unknown sensor",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.sensor.sensorDataType == 0
                          ? 'Аналоговый'
                          : 'Цифровой',
                      style: TextStyle(
                        fontSize: 10,
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
                      ),
                    ),
                  ].column(crossAxisAlignment: CrossAxisAlignment.start),
                ),
              ].row(spacing: 6),

              // Trend Icon
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Icon(
                  widget.sensor.trendIcon,
                  color: statusColor,
                  size: 48,
                ).center(),
              ).marginSymmetric(vertical: 6),

              // Bottom Value
              [
                Text(
                  '${widget.sensor.currentValue?.toStringAsFixed(1) ?? '--'} ${widget.sensor.unit ?? ''}',
                  style: TextStyle(
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(alpha: 0.5),
                        offset: const Offset(.5, .5),
                        blurRadius: 2,
                      ),
                    ],
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ).center(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Обновлено: ${widget.sensor.lastSensorUpdated?.toLocal().toString().split('.').first ?? 'N/A'}',
                      style: TextStyle(
                        fontSize: 8,
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.4,
                        ),
                      ),
                    ),
                    Text(
                      'Port: ${widget.sensor.portNumber}',
                      style: TextStyle(
                        fontSize: 8,
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ].column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
              ),
            ].column(crossAxisAlignment: CrossAxisAlignment.start),
          ),
        ),
      ),
    );
  }
}
