import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_ui_config.freezed.dart';
part 'tag_ui_config.g.dart';

@freezed
abstract class TagUiConfig with _$TagUiConfig {
  const TagUiConfig._();

  const factory TagUiConfig({
    String? color,
    String? icon,
    double? minCritical,
    double? minWarning,
    double? maxWarning,
    double? maxCritical,
    // Новые поля для DIGITAL
    double? digitalWarning,
    double? digitalCritical,
    String? labelZero,
    String? labelOne,
  }) = _TagUiConfig;

  factory TagUiConfig.fromJson(Map<String, dynamic> json) =>
      _$TagUiConfigFromJson(json);
}
