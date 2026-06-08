import 'package:freezed_annotation/freezed_annotation.dart';

part 'command_status_event.freezed.dart';
part 'command_status_event.g.dart';

enum CommandStatus {
  @JsonValue('PENDING')
  pending,
  @JsonValue('PROCESSING')
  processing,
  @JsonValue('SUCCESS')
  success,
  @JsonValue('FAILED')
  failed,
}

@freezed
abstract class CommandStatusEvent with _$CommandStatusEvent {
  const factory CommandStatusEvent({
    required int commandId,
    required CommandStatus status,
    String? errorMessage,
  }) = _CommandStatusEvent;

  factory CommandStatusEvent.fromJson(Map<String, dynamic> json) =>
      _$CommandStatusEventFromJson(json);
}
