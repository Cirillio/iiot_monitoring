import 'package:iiot_monitoring/src/core/monitoring/models/tag_evaluation.dart';
import 'package:iiot_monitoring/src/shared/models/enums.dart';
import 'package:iiot_monitoring/src/core/monitoring/models/tag_status.dart';
import 'package:iiot_monitoring/src/shared/models/tag.dart';
import 'package:iiot_monitoring/src/shared/models/tag_ui_config.dart';

class TagEvaluator {
  static TagEvaluation evaluate({
    required Tag tag,
    required double value,
    TagEvaluation? previousEvaluation,
  }) {
    final config = tag.uiConfigJson;

    if (config == null) {
      return TagEvaluation(
        status: TagStatus.noConfig,
        value: value,
        message: 'No configuration',
      );
    }

    final isDigital = tag.dataType == TagDataType.digital;
    final prevStatus = previousEvaluation?.status ?? TagStatus.idle;
    TagStatus newStatus = TagStatus.normal;

    if (isDigital) {
      // Логика для DIGITAL датчиков
      if (config.digitalCritical != null && value == config.digitalCritical) {
        newStatus = TagStatus.critical;
      } else if (config.digitalWarning != null &&
          value == config.digitalWarning) {
        newStatus = TagStatus.warning;
      } else {
        newStatus = TagStatus.normal;
      }
    } else {
      // Логика для ANALOG датчиков
      final maxCritical = config.maxCritical;
      final maxWarning = config.maxWarning;
      final minCritical = config.minCritical;

      if (maxCritical == null || maxWarning == null || minCritical == null) {
        return TagEvaluation(
          status: TagStatus.noConfig,
          value: value,
          message: 'Incomplete thresholds',
        );
      }

      // Гистерезис: 2% от диапазона
      final range = maxCritical - minCritical;
      final noise = range * 0.02;

      if (value >= maxCritical) {
        newStatus = TagStatus.critical;
      } else if (prevStatus == TagStatus.critical &&
          value >= maxCritical - noise) {
        newStatus = TagStatus.critical;
      } else if (value >= maxWarning) {
        newStatus = TagStatus.warning;
      } else if (prevStatus == TagStatus.warning &&
          value >= maxWarning - noise) {
        newStatus = TagStatus.warning;
      } else {
        newStatus = TagStatus.normal;
      }
    }

    DateTime? alarmStartedAt = previousEvaluation?.alarmStartedAt;
    if (newStatus == TagStatus.warning || newStatus == TagStatus.critical) {
      // Если вошли в аларм из нормального состояния
      if (prevStatus == TagStatus.normal || prevStatus == TagStatus.idle) {
        alarmStartedAt = DateTime.now();
      }
    } else if (newStatus == TagStatus.normal) {
      alarmStartedAt = null;
    }

    String message = _getMessageForStatus(newStatus, value, tag, config);

    return TagEvaluation(
      status: newStatus,
      value: value,
      alarmStartedAt: alarmStartedAt,
      message: message,
    );
  }

  static String _getMessageForStatus(
    TagStatus status,
    double value,
    Tag tag,
    TagUiConfig config,
  ) {
    if (status == TagStatus.normal) return 'Normal';

    final unit = tag.unit;
    String valueStr;

    if (tag.dataType == TagDataType.digital) {
      if (value == 0 && config.labelZero != null) {
        valueStr = config.labelZero!;
      } else if (value == 1 && config.labelOne != null) {
        valueStr = config.labelOne!;
      } else {
        valueStr = value.toStringAsFixed(0);
      }
    } else {
      valueStr = '${value.toStringAsFixed(2)} $unit';
    }

    switch (status) {
      case TagStatus.critical:
        return 'Critical: $valueStr';
      case TagStatus.warning:
        return 'Warning: $valueStr';
      default:
        return '';
    }
  }
}
