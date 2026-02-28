import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:material_symbols_icons/get.dart';
import '../../../../shared/models/sensor.dart';
import '../../../../shared/widgets/iiot_card.dart';
import '../../domain/sensor_status_ext.dart';
import 'threshold_bar.dart';

/// Расширенная карточка датчика для страницы устройства.
///
/// Содержит:
/// - Верхний ряд: иконка, название, текущее значение с единицей измерения
/// - Средний ряд: ThresholdBar с уставками
/// - Нижний ряд: slug и data_type серым текстом
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

  /// Определяет статус датчика на основе текущего значения и уставок
  SensorStatus _getStatus() {
    final currentValue = widget.sensor.currentValue;
    if (currentValue == null) return SensorStatus.offline;

    final minCritical = widget.sensor.uiConfigJson?.minCritical;
    final maxCritical = widget.sensor.uiConfigJson?.maxCritical;

    if ((minCritical != null && currentValue < minCritical) ||
        (maxCritical != null && currentValue > maxCritical)) {
      return SensorStatus.critical;
    }

    return SensorStatus.normal;
  }

  /// Возвращает цвет статуса
  Color _getStatusColor(BuildContext context) {
    switch (_getStatus()) {
      case SensorStatus.normal:
        return Colors.greenAccent;
      case SensorStatus.warning:
        return Colors.orange;
      case SensorStatus.critical:
        return Colors.redAccent;
      case SensorStatus.offline:
      case SensorStatus.unknown:
        return Colors.grey;
    }
  }

  /// Парсит цвет из hex-строки конфига
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
    final statusColor = _getStatusColor(context);
    final iconColor = _parseHexColor(widget.sensor.uiConfigJson?.color);
    final status = _getStatus();

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
                        child: Icon(_getIconData(), color: iconColor, size: 32),
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
                      Icon(
                        status == SensorStatus.offline
                            ? LucideIcons.wifiOff
                            : status == SensorStatus.normal
                            ? LucideIcons.checkCircle
                            : LucideIcons.alertTriangle,
                        color: status == SensorStatus.offline
                            ? Colors.grey
                            : status == SensorStatus.normal
                            ? Colors.green
                            : Colors.red,
                        size: 24,
                      ),
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

  /// Возвращает ThresholdBar с уставками из uiConfig
  Widget _buildThresholdBar(BuildContext context) {
    final uiConfig = widget.sensor.uiConfigJson;
    if (uiConfig == null || widget.sensor.currentValue == null) {
      // Если нет конфига или значения, показываем простой прогресс
      return LinearProgressIndicator(
        value: 0.5,
        backgroundColor: Colors.grey.shade200,
        color: Colors.grey,
        minHeight: 8,
        borderRadius: BorderRadius.circular(4),
      );
    }

    // Определяем диапазон шкалы
    final min = uiConfig.minCritical ?? uiConfig.minWarning ?? 0.0;
    final max = uiConfig.maxCritical ?? uiConfig.maxWarning ?? 100.0;

    return ThresholdBar(
      min: min,
      max: max,
      currentValue: widget.sensor.currentValue!,
      minCritical: uiConfig.minCritical,
      minWarning: uiConfig.minWarning,
      maxWarning: uiConfig.maxWarning,
      maxCritical: uiConfig.maxCritical,
      primaryColor: _getStatusColor(context),
    );
  }

  /// Возвращает IconData на основе имени иконки из конфига
  IconData _getIconData() {
    final iconName = widget.sensor.uiConfigJson?.icon;
    if (iconName == null) return LucideIcons.gauge;

    try {
      return SymbolsGet.get(iconName, SymbolStyle.rounded);
    } catch (_) {
      return LucideIcons.gauge;
    }
  }

  /// Возвращает текстовое описание типа данных
  String _getDataTypeText() {
    switch (widget.sensor.sensorDataType) {
      case 0:
        return 'Аналоговый';
      case 1:
        return 'Цифровой';
      case 2:
        return 'Дискретный';
      default:
        return 'Неизвестный';
    }
  }
}
