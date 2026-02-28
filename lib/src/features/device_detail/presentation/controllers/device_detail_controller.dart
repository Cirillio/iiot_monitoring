import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/models/device.dart';
import '../../../dashboard/presentation/controllers/dashboard_controller.dart';

part 'device_detail_controller.g.dart';

/// Riverpod провайдер для получения данных об устройстве по его ID.
///
/// Подписывается на главный список устройств из [dashboardControllerProvider]
/// и автоматически обновляется при изменении данных (в том числе через SignalR).
@riverpod
class DeviceDetailController extends _$DeviceDetailController {
  @override
  Future<Device> build(int deviceId) async {
    final dashboardState = ref.watch(dashboardControllerProvider);
    
    return dashboardState.when(
      data: (devices) {
        return devices.firstWhere(
          (d) => d.id == deviceId,
          orElse: () => throw Exception('Устройство с ID $deviceId не найдено'),
        );
      },
      loading: () => throw const AsyncLoading(),
      error: (error, stack) => Error.throwWithStackTrace(error, stack),
    );
  }
}
