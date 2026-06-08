import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../shared/models/system/system_config.dart';
import '../../../shared/models/system/system_status.dart';

part 'system_repository.g.dart';

class SystemRepository {
  final Dio _dio;

  SystemRepository(this._dio);

  Future<SystemConfig> getConfig() async {
    try {
      final response = await _dio.get('/api/system/config');
      return SystemConfig.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to load system config: ${e.message}');
    }
  }

  Future<List<SystemStatus>> getStatus() async {
    try {
      final response = await _dio.get('/api/system/status');
      final List<dynamic> data = response.data;
      return data.map((json) => SystemStatus.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Failed to load system status: ${e.message}');
    }
  }
}

@riverpod
SystemRepository systemRepository(Ref ref) {
  return SystemRepository(ref.watch(dioProvider));
}
