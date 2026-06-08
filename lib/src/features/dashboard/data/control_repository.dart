import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../shared/models/dto/write_command_dto.dart';

part 'control_repository.g.dart';

class ControlRepository {
  final Dio _dio;

  ControlRepository(this._dio);

  Future<void> writeCommand(WriteCommandDto command) async {
    try {
      await _dio.post(
        '/api/v1/control/write',
        data: command.toJson(),
      );
    } on DioException catch (e) {
      throw Exception('Failed to write command: ${e.message}');
    }
  }
}

@riverpod
ControlRepository controlRepository(Ref ref) {
  return ControlRepository(ref.watch(dioProvider));
}
