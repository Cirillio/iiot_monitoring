import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/signalr_service.dart';
import '../../../../shared/models/system/system_config.dart';
import '../../../../shared/models/system/system_status.dart';
import '../../data/system_repository.dart';

part 'system_notifier.g.dart';

@riverpod
class SystemConfigNotifier extends _$SystemConfigNotifier {
  @override
  FutureOr<SystemConfig> build() async {
    _listenToSignalR();
    return await ref.watch(systemRepositoryProvider).getConfig();
  }

  void _listenToSignalR() {
    final signalR = ref.watch(signalRServiceProvider);
    final subscription = signalR.configUpdatedStream.listen((event) {
      ref.invalidateSelf(); // Перезапрашиваем конфиг
    });
    ref.onDispose(() => subscription.cancel());
  }
}

@riverpod
class SystemStatusNotifier extends _$SystemStatusNotifier {
  Timer? _pollingTimer;

  @override
  FutureOr<List<SystemStatus>> build() async {
    _startPolling();
    ref.onDispose(() {
      _pollingTimer?.cancel();
    });
    return await ref.watch(systemRepositoryProvider).getStatus();
  }

  void _startPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(const Duration(seconds: 5), (_) async {
      try {
        final status = await ref.read(systemRepositoryProvider).getStatus();
        state = AsyncData(status);
      } catch (e, st) {
        // Игнорируем ошибки сети при поллинге, чтобы не моргать ошибками на экране
      }
    });
  }
}
