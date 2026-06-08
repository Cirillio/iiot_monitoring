import 'package:freezed_annotation/freezed_annotation.dart';

part 'write_command_dto.freezed.dart';
part 'write_command_dto.g.dart';

@freezed
abstract class WriteCommandDto with _$WriteCommandDto {
  const factory WriteCommandDto({
    required int tagId,
    required double value,
    required String operatorId,
  }) = _WriteCommandDto;

  factory WriteCommandDto.fromJson(Map<String, dynamic> json) =>
      _$WriteCommandDtoFromJson(json);
}
