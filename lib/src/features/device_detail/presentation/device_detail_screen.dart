import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iiot_monitoring/src/features/device_detail/domain/device_summary_ext.dart';
import 'package:iiot_monitoring/src/features/device_detail/domain/sensor_status_ext.dart';
import 'package:iiot_monitoring/src/features/device_detail/presentation/controllers/device_detail_controller.dart';
import 'package:iiot_monitoring/src/features/device_detail/presentation/widgets/device_detail_header.dart';
import 'package:iiot_monitoring/src/features/device_detail/presentation/widgets/device_summary_panel.dart';
import 'package:iiot_monitoring/src/features/device_detail/presentation/widgets/expanded_sensor_card.dart';
import 'package:iiot_monitoring/src/shared/models/device.dart';
import 'package:iiot_monitoring/src/shared/models/sensor.dart';
import 'package:iiot_monitoring/src/shared/widgets/iiot_card.dart';
import 'package:lucide_icons/lucide_icons.dart';

/// Типы фильтров для датчиков.
enum SensorFilter {
  all('Все'),
  analog('Аналоговые'),
  digital('Цифровые'),
  normal('В норме'),
  alert('Тревога');

  final String label;
  const SensorFilter(this.label);
}

/// Экран детальной информации об устройстве.
class DeviceDetailScreen extends ConsumerStatefulWidget {
  final int deviceId;

  const DeviceDetailScreen({super.key, required this.deviceId});

  @override
  ConsumerState<DeviceDetailScreen> createState() => _DeviceDetailScreenState();
}

class _DeviceDetailScreenState extends ConsumerState<DeviceDetailScreen> {
  SensorFilter _selectedFilter = SensorFilter.all;

  @override
  Widget build(BuildContext context) {
    final deviceState = ref.watch(
      deviceDetailControllerProvider(widget.deviceId),
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          deviceState.when(
            data: (Device device) {
              final filteredSensors = _getFilteredSensors(device);

              // Формируем список виджетов. Каждый оборачиваем в Padding(16),
              // КРОМЕ фильтров, чтобы их скролл был на всю ширину.
              final List<Widget> items = [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: _BackButton(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DeviceDetailHeader(device: device)
                      .animate()
                      .fadeIn(duration: 300.ms)
                      .slideY(begin: 0.1, curve: Curves.easeOut),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child:
                      DeviceSensorStatusPanels(
                            okCount: device.normalSensorsCount,
                            alertCount: device.alertSensorsCount,
                          )
                          .animate()
                          .fadeIn(duration: 300.ms)
                          .slideY(begin: 0.1, curve: Curves.easeOut),
                ),

                // ФИЛЬТРЫ: Без внешнего Padding, но с внутренним в ListView
                _buildFilterChips()
                    .animate()
                    .fadeIn(duration: 300.ms)
                    .slideY(begin: 0.1, curve: Curves.easeOut),

                // Датчики
                if (filteredSensors.isNotEmpty)
                  ...filteredSensors.asMap().entries.map((entry) {
                    final index = entry.key;
                    final sensor = entry.value;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child:
                          ExpandedSensorCard(
                                sensor: sensor,
                                onTap: () {
                                  // TODO: Навигация к деталям датчика
                                },
                              )
                              .animate()
                              .fadeIn(duration: 300.ms)
                              .slideY(
                                begin: 0.1,
                                delay: (index * 50).ms,
                                curve: Curves.easeOut,
                              ),
                    );
                  })
                else
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildEmptyState(),
                  ),
              ];

              return SliverPadding(
                padding: const EdgeInsets.only(top: 64, bottom: 128),
                sliver: SliverList.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) => items[index],
                ),
              );
            },
            loading: () => const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) => SliverFillRemaining(
              child: _ErrorView(
                error: error.toString(),
                onRetry: () => ref.invalidate(
                  deviceDetailControllerProvider(widget.deviceId),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return IiotCard(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Icon(
              LucideIcons.activity,
              size: 48,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 16),
            Text(
              'Нет датчиков, подходящих под фильтр',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        // Паддинг внутри списка, чтобы элементы не прилипали к краям при прокрутке,
        // но сама область прокрутки была на всю ширину.
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: SensorFilter.values.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final filter = SensorFilter.values[index];
          final isSelected = _selectedFilter == filter;

          return FilterChip(
            label: Text(filter.label),
            selected: isSelected,
            onSelected: (selected) {
              if (selected) {
                setState(() => _selectedFilter = filter);
              }
            },
            showCheckmark: false,
            backgroundColor: Theme.of(
              context,
            ).colorScheme.surface.withValues(alpha: 0.3),
            selectedColor: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            labelStyle: TextStyle(
              fontSize: 14,
              color: isSelected
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.8),
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
            side: BorderSide.none,
            elevation: 0,
            pressElevation: 0,
          );
        },
      ),
    );
  }

  List<Sensor> _getFilteredSensors(Device device) {
    if (_selectedFilter == SensorFilter.all) {
      return device.sensors;
    }

    return device.sensors.where((Sensor sensor) {
      switch (_selectedFilter) {
        case SensorFilter.analog:
          return sensor.sensorDataType == 0;
        case SensorFilter.digital:
          return sensor.sensorDataType == 1;
        case SensorFilter.normal:
          return sensor.status == SensorStatus.normal;
        case SensorFilter.alert:
          return sensor.status == SensorStatus.warning ||
              sensor.status == SensorStatus.critical;
        case SensorFilter.all:
          return true;
      }
    }).toList();
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IntrinsicHeight(
          child: TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onSurface,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.only(
                left: 16,
                right: 20,
                top: 10,
                bottom: 10,
              ),
            ),
            child: const Row(
              spacing: 8,
              children: [
                Icon(LucideIcons.arrowLeft, size: 20),
                Text(
                  'Вернуться на главную',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const _ErrorView({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: IiotCard(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  LucideIcons.wifiOff,
                  size: 64,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Ошибка загрузки',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  error,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: onRetry,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Повторить'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
