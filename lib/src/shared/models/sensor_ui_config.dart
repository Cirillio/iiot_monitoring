import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensor_ui_config.freezed.dart';
part 'sensor_ui_config.g.dart';

@freezed
abstract class SensorUiConfig with _$SensorUiConfig {
  const factory SensorUiConfig({
    String? color,
    String? icon,
    double? minCritical,
    double? maxCritical,
  }) = _SensorUiConfig;

  factory SensorUiConfig.fromJson(Map<String, dynamic> json) =>
      _$SensorUiConfigFromJson(json);
}
