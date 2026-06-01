import 'package:flutter/material.dart';
import 'package:exui/exui.dart';
import 'package:material_symbols_icons/get.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/calculated_sensor.dart';
import 'package:iiot_monitoring/src/core/monitoring/extensions/sensor_status_ui.dart';

class SensorCard extends StatefulWidget {
  final CalculatedSensor sensor;

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
  }

  @override
  void dispose() {
    _statesController.dispose();
    super.dispose();
  }

  Color _parseHexColor(String? hex) {
    if (hex == null) return Colors.grey;
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xff')));
    } catch (_) {
      return Colors.grey;
    }
  }

  String _getDisplayValue() {
    final evaluation = widget.sensor.evaluation;
    final sensor = widget.sensor.sensor;
    final config = sensor.uiConfigJson;

    if (evaluation.value == null) return '--';

    if (sensor.sensorDataType == 1) {
      if (evaluation.value == 0 && config?.labelZero != null) {
        return config!.labelZero!;
      }
      if (evaluation.value == 1 && config?.labelOne != null) {
        return config!.labelOne!;
      }
      return evaluation.value!.toStringAsFixed(0);
    }

    return '${evaluation.value!.toStringAsFixed(1)} ${sensor.unit ?? ''}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final evaluation = widget.sensor.evaluation;
    final sensor = widget.sensor.sensor;
    final statusColor = evaluation.status.color;
    final iconColor = _parseHexColor(sensor.uiConfigJson?.color);

    return ListenableBuilder(
      listenable: _statesController,
      builder: (context, child) {
        final isPressed = _statesController.value.contains(WidgetState.pressed);

        return GestureDetector(
          onTapDown: (_) => _statesController.update(WidgetState.pressed, true),
          onTapUp: (_) => _statesController.update(WidgetState.pressed, false),
          onTapCancel: () =>
              _statesController.update(WidgetState.pressed, false),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: isPressed ? 0.6 : 1.0,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    theme.colorScheme.surface,
                    statusColor.withValues(alpha: .15),
                  ],
                ),
              ),
              child: [
                // Top Row
                [
                  Icon(
                    SymbolsGet.get(
                      sensor.uiConfigJson?.icon ?? 'sensors',
                      SymbolStyle.rounded,
                    ),
                    color: iconColor,
                    size: 24,
                  ),
                  Expanded(
                    child: [
                      Text(
                        sensor.name ?? "Unknown sensor",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        sensor.sensorDataType == 0 ? 'Аналоговый' : 'Цифровой',
                        style: TextStyle(
                          fontSize: 10,
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: .6,
                          ),
                        ),
                      ),
                    ].column(crossAxisAlignment: CrossAxisAlignment.start),
                  ),
                ].row(spacing: 6),

                // Status Icon
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Icon(
                    evaluation.status.icon,
                    color: statusColor,
                    size: 40,
                  ).center(),
                ),

                // Bottom Value
                [
                  Text(
                    _getDisplayValue(),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: statusColor,
                    ),
                  ).center(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Port: ${sensor.portNumber}',
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: .4,
                          ),
                        ),
                      ),
                      if (evaluation.alarmStartedAt != null)
                        Text(
                          'Alarm: ${_formatDuration(evaluation.alarmStartedAt!)}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.redAccent,
                          ),
                        ).center(),
                      Icon(
                        evaluation.status.icon,
                        size: 12,
                        color: statusColor,
                      ),
                    ],
                  ),
                ].column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                ),
              ].column(crossAxisAlignment: CrossAxisAlignment.start),
            ),
          ),
        );
      },
    );
  }

  String _formatDuration(DateTime start) {
    final diff = DateTime.now().difference(start);
    if (diff.inDays > 0) return '${diff.inDays}d';
    if (diff.inHours > 0) return '${diff.inHours}h';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m';
    return '${diff.inSeconds}s';
  }
}
