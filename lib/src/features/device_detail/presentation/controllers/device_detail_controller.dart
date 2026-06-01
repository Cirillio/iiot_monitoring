import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../dashboard/presentation/controllers/calculated_device_notifier.dart';
import '../../../../core/monitoring/models/calculated_device.dart';

part 'device_detail_controller.g.dart';

@riverpod
class DeviceDetailController extends _$DeviceDetailController {
  @override
  AsyncValue<CalculatedDevice?> build(int deviceId) {
    final dashboardState = ref.watch(calculatedDeviceProvider);

    return dashboardState.whenData((devices) {
      try {
        final typedDevices = devices;
        return typedDevices.firstWhere((d) => d.device.id == deviceId);
      } catch (_) {
        return null;
      }
    });
  }
}
