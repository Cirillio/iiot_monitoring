import 'package:flutter/material.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/calculated_sensor.dart';
import 'package:iiot_monitoring/src/core/monitoring/extensions/sensor_status_ui.dart';
import 'package:iiot_monitoring/src/shared/widgets/iiot_card.dart';
import 'package:material_symbols_icons/get.dart';
import 'threshold_bar.dart';

class ExpandedSensorCard extends StatefulWidget {
  final CalculatedSensor calculatedSensor;
  final VoidCallback? onTap;

  const ExpandedSensorCard({
    super.key,
    required this.calculatedSensor,
    this.onTap,
  });

  @override
  State<ExpandedSensorCard> createState() => _ExpandedSensorCardState();
}

class _ExpandedSensorCardState extends State<ExpandedSensorCard> {
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
    if (hex == null) return Colors.grey;
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xff')));
    } catch (_) {
      return Colors.grey;
    }
  }

  String _getDataTypeText() {
    return widget.calculatedSensor.sensor.sensorDataType == 0
        ? 'Аналоговый'
        : 'Цифровой';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sensor = widget.calculatedSensor.sensor;
    final evaluation = widget.calculatedSensor.evaluation;
    final status = evaluation.status;
    final statusColor = status.color;
    final iconColor = _parseHexColor(sensor.uiConfigJson?.color);

    final isPressed = _statesController.value.contains(WidgetState.pressed);

    return Listener(
      onPointerDown: (_) => _statesController.update(WidgetState.pressed, true),
      onPointerUp: (_) => _statesController.update(WidgetState.pressed, false),
      onPointerCancel: (_) =>
          _statesController.update(WidgetState.pressed, false),
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: isPressed ? 0.8 : 1.0,
          child: IiotCard(
            usePadding: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Верхний ряд: иконка, название, значение
                  Row(
                    children: [
                      // Иконка датчика
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: statusColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          SymbolsGet.get(
                            sensor.uiConfigJson?.icon ?? 'sensors',
                            SymbolStyle.rounded,
                          ),
                          color: iconColor,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Название и значение
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  evaluation.value?.toStringAsFixed(1) ?? '--',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: statusColor,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                if (sensor.unit != null)
                                  Text(
                                    sensor.unit!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: theme.colorScheme.onSurface
                                          .withValues(alpha: 0.6),
                                    ),
                                  ),
                              ],
                            ),
                            Text(
                              sensor.name ?? 'Неизвестный датчик',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),

                      // Индикатор статуса
                      Icon(
                        status.icon,
                        color: statusColor,
                        size: 24,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Нижний ряд: техническая информация
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Slug датчика
                      if (sensor.slug != null)
                        Expanded(
                          child: Text(
                            sensor.slug!,
                            style: TextStyle(
                              fontSize: 11,
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.4,
                              ),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                      // Тип данных
                      Text(
                        _getDataTypeText(),
                        style: TextStyle(
                          fontSize: 11,
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Средний ряд: ThresholdBar
                  if (sensor.uiConfigJson != null &&
                      sensor.sensorDataType == 0) // Только для аналоговых
                    ThresholdBar(
                      currentValue: evaluation.value ?? 0,
                      min: sensor.uiConfigJson!.minCritical ?? 0,
                      max: sensor.uiConfigJson!.maxCritical ?? 100,
                      minCritical: sensor.uiConfigJson!.minCritical ?? 0,
                      maxCritical: sensor.uiConfigJson!.maxCritical ?? 100,
                      maxWarning: sensor.uiConfigJson!.maxWarning ?? 80,
                    ),
                  if (evaluation.message != null && evaluation.message != 'Normal')
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        evaluation.message!,
                        style: TextStyle(
                          fontSize: 12,
                          color: statusColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
