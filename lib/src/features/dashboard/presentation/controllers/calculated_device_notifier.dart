import 'dart:async';
import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/calculated_device.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/calculated_tag.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/device_summary.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/tag_status.dart';
import 'package:iiot_monitoring/src/core/monitoring/tag_evaluator.dart';
import 'package:iiot_monitoring/src/core/monitoring/tag_processing_notifier.dart';
import 'package:iiot_monitoring/src/shared/models/metric.dart';
import 'package:iiot_monitoring/src/shared/models/dto/device_dto.dart';
import 'package:iiot_monitoring/src/features/dashboard/data/device_repository.dart';
import 'package:iiot_monitoring/src/features/dashboard/data/mapper.dart';
import 'package:iiot_monitoring/src/core/network/signalr_service.dart';
import 'package:iiot_monitoring/src/core/storage/prefs_provider.dart';

part 'calculated_device_notifier.g.dart';

@Riverpod(keepAlive: true)
class CalculatedDeviceNotifier extends _$CalculatedDeviceNotifier {
  StreamSubscription<Metric>? _metricsSubscription;
  static const _cacheKey = 'cached_devices';

  @override
  Future<List<CalculatedDevice>> build() async {
    final repository = ref.watch(deviceRepositoryProvider);
    final signalR = ref.watch(signalRServiceProvider);
    final prefs = ref.watch(sharedPreferencesProvider);

    // 1. Пытаемся загрузить из кэша
    List<DeviceDto>? cachedDtos;
    final cacheJson = prefs.getString(_cacheKey);
    if (cacheJson != null) {
      try {
        final List<dynamic> decoded = jsonDecode(cacheJson);
        cachedDtos = decoded.map((j) => DeviceDto.fromJson(jsonDecode(j))).toList();
        print('Notifier: Loaded ${cachedDtos.length} devices from cache');
      } catch (e) {
        print('Notifier: Error loading cache: $e');
      }
    }

    // Если есть кэш, устанавливаем начальное состояние
    if (cachedDtos != null) {
      final cachedDevices = cachedDtos.map((dto) => Mapper.toCalculatedDevice(dto)).toList();
      _initializeHistory(cachedDevices);
      // Мы не возвращаем сразу, а продолжаем загрузку из API
      // Но Riverpod позволяет установить начальное значение через state
      state = AsyncData(cachedDevices);
    }

    // 2. Загружаем из API
    try {
      print('Notifier: Fetching devices from API...');
      final deviceDtos = await repository.getDevices();
      print('Notifier: Received ${deviceDtos.length} device DTOs from API');

      // Сохраняем в кэш
      final encoded = jsonEncode(deviceDtos.map((d) => jsonEncode(d.toJson())).toList());
      await prefs.setString(_cacheKey, encoded);

      final devices = deviceDtos
          .map((dto) => Mapper.toCalculatedDevice(dto))
          .toList();

      _initializeHistory(devices);

      // Запускаем SignalR и подписку
      _setupSignalR(signalR);

      return devices;
    } catch (e) {
      if (cachedDtos != null) {
        print('Notifier: API failed, using cached data');
        _setupSignalR(signalR);
        return state.value!;
      }
      rethrow;
    }
  }

  void _initializeHistory(List<CalculatedDevice> devices) {
    for (var device in devices) {
      for (var tag in device.tags) {
        ref
            .read(tagProcessingProvider.notifier)
            .updateEvaluation(tag.tag.tagId, tag.evaluation);
      }
    }
  }

  void _setupSignalR(SignalRService signalR) {
    unawaited(signalR.start());
    _metricsSubscription?.cancel();
    _metricsSubscription = signalR.metricsStream.listen(processMetric);

    ref.onDispose(() {
      _metricsSubscription?.cancel();
    });
  }

  void processMetric(Metric metric) {
    state.whenData((devices) {
      bool tagFound = false;
      final updatedDevices = devices.map((device) {
        final tagIndex = device.tags.indexWhere(
          (s) => s.tag.tagId == metric.tagId,
        );

        if (tagIndex == -1) return device;

        tagFound = true;
        final previousEvaluation = ref.read(
          tagProcessingProvider,
        )[metric.tagId];

        final newEvaluation = TagEvaluator.evaluate(
          tag: device.tags[tagIndex].tag,
          value: metric.value,
          previousEvaluation: previousEvaluation,
        );

        ref
            .read(tagProcessingProvider.notifier)
            .updateEvaluation(metric.tagId, newEvaluation);

        final updatedTags = List<CalculatedTag>.from(device.tags);
        updatedTags[tagIndex] = updatedTags[tagIndex].copyWith(
          evaluation: newEvaluation,
        );

        return device.copyWith(
          tags: updatedTags,
          summary: _recalculateSummary(updatedTags),
        );
      }).toList();

      if (tagFound) {
        state = AsyncData(updatedDevices);
      }
    });
  }

  DeviceSummary _recalculateSummary(List<CalculatedTag> tags) {
    int normal = 0, warning = 0, critical = 0, offline = 0, noConfig = 0;
    for (var s in tags) {
      switch (s.evaluation.status) {
        case TagStatus.normal:
          normal++;
          break;
        case TagStatus.warning:
          warning++;
          break;
        case TagStatus.critical:
          critical++;
          break;
        case TagStatus.offline:
          offline++;
          break;
        case TagStatus.noConfig:
          noConfig++;
          break;
        case TagStatus.idle:
          break;
      }
    }
    return DeviceSummary(
      normalCount: normal,
      warningCount: warning,
      criticalCount: critical,
      offlineCount: offline,
      noConfigCount: noConfig,
    );
  }
}
