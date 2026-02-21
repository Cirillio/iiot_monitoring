import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../shared/models/device.dart';

part 'device_repository.g.dart';

class DeviceRepository {
  final Dio _dio;

  DeviceRepository(this._dio);

  Future<List<Device>> getDevices() async {
    try {
      final response = await _dio.get('/api/dashboard');
      final List<dynamic> data = response.data;
      return data.map((json) => Device.fromJson(json)).toList();
    } on DioException catch (e) {
      // Здесь можно добавить более детальную обработку ошибок (Logging, Custom Exceptions)
      throw Exception('Failed to load devices: ${e.message}');
    }
  }
}

@riverpod
DeviceRepository deviceRepository(Ref ref) {
  return DeviceRepository(ref.watch(dioProvider));
}
