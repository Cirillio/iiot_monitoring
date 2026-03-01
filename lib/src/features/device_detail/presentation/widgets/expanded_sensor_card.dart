import 'package:flutter/material.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/sensor_status.dart';
import 'package:iiot_monitoring/src/core/monitoring/extensions/sensor_status_ui.dart';
import 'package:iiot_monitoring/src/shared/models/sensor.dart';
import 'package:iiot_monitoring/src/shared/widgets/iiot_card.dart';
import 'package:material_symbols_icons/get.dart';
import 'threshold_bar.dart';

class ExpandedSensorCard extends StatefulWidget {
  final Sensor sensor;
  final VoidCallback? onTap;

  const ExpandedSensorCard({super.key, required this.sensor, this.onTap});

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

  // Временный маппинг для совместимости, пока экран деталей не переведен на CalculatedSensor полностью
  SensorStatus _getStatus() {
    if (widget.sensor.currentValue == null) return SensorStatus.offline;
    final config = widget.sensor.uiConfigJson;
    if (config == null) return SensorStatus.noConfig;

    if (widget.sensor.currentValue! >=
        (config.maxCritical ?? double.infinity)) {
      return SensorStatus.critical;
    }
    if (widget.sensor.currentValue! >= (config.maxWarning ?? double.infinity)) {
      return SensorStatus.warning;
    }
    return SensorStatus.normal;
  }

  Color _parseHexColor(String? hex) {
    if (hex == null) return Colors.white;
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xff')));
    } catch (_) {
      return Colors.white;
    }
  }

  String _getDataTypeText() {
    return widget.sensor.sensorDataType == 0 ? 'Аналоговый' : 'Цифровой';
  }

  Widget _buildThresholdBar(BuildContext context) {
    if (widget.sensor.uiConfigJson == null) return const SizedBox.shrink();
    return ThresholdBar(
      currentValue: widget.sensor.currentValue ?? 0,
      min: widget.sensor.uiConfigJson!.minCritical ?? 0,
      max: widget.sensor.uiConfigJson!.maxCritical ?? 100,
      minCritical: widget.sensor.uiConfigJson!.minCritical ?? 0,
      maxCritical: widget.sensor.uiConfigJson!.maxCritical ?? 100,
      maxWarning: widget.sensor.uiConfigJson!.maxWarning ?? 80,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final status = _getStatus();
    final statusColor = status.color;
    final iconColor = _parseHexColor(widget.sensor.uiConfigJson?.color);

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
                spacing: 12,
                children: [
                  // Верхний ряд: иконка, название, значение
                  Row(
                    spacing: 12,
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
                            widget.sensor.uiConfigJson?.icon ?? 'sensors',
                            SymbolStyle.rounded,
                          ),
                          color: iconColor,
                          size: 32,
                        ),
                      ),

                      // Название и значение
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              spacing: 6,
                              children: [
                                Text(
                                  widget.sensor.currentValue?.toStringAsFixed(
                                        1,
                                      ) ??
                                      '--',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: statusColor,
                                  ),
                                ),
                                if (widget.sensor.unit != null)
                                  Text(
                                    widget.sensor.unit!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: theme.colorScheme.onSurface
                                          .withValues(alpha: 0.6),
                                    ),
                                  ),
                              ],
                            ),
                            Text(
                              widget.sensor.name ?? 'Неизвестный датчик',
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
                      Icon(status.icon, color: statusColor, size: 24),
                    ],
                  ),

                  // Нижний ряд: техническая информация
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Slug датчика
                      if (widget.sensor.slug != null)
                        Expanded(
                          child: Text(
                            widget.sensor.slug!,
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

                  // Средний ряд: ThresholdBar
                  _buildThresholdBar(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
