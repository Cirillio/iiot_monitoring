import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../shared/models/dto/device_dto.dart';

part 'device_repository.g.dart';

class DeviceRepository {
  final Dio _dio;

  DeviceRepository(this._dio);

  Future<List<DeviceDto>> getDevices() async {
    try {
      const path = '/api/devices';
      final response = await _dio.get(path);
      final List<dynamic> data = response.data;
      return data.map((json) => DeviceDto.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Failed to load devices: ${e.message}');
    }
  }
}

@riverpod
DeviceRepository deviceRepository(Ref ref) {
  return DeviceRepository(ref.watch(dioProvider));
}
