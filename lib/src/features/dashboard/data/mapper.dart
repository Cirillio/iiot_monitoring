import '../../../core/monitoring/models/calculated_device.dart';
import '../../../core/monitoring/models/calculated_tag.dart';
import '../../../core/monitoring/models/device_summary.dart';
import '../../../core/monitoring/models/tag_evaluation.dart';
import '../../../core/monitoring/models/tag_status.dart';
import '../../../shared/models/device.dart';
import '../../../shared/models/tag.dart';
import '../../../shared/models/dto/device_dto.dart';
import '../../../shared/models/dto/tag_dto.dart';

class Mapper {
  static CalculatedDevice toCalculatedDevice(DeviceDto dto) {
    final device = Device(
      id: dto.id,
      name: dto.name,
      ipAddress: dto.ipAddress,
      port: dto.port,
      slaveId: dto.slaveId,
      isActive: dto.isActive,
      connectionId: dto.connectionId,
      useGroupPolling: dto.useGroupPolling,
      maxRegisterSpan: dto.maxRegisterSpan,
      isOnline: dto.isOnline,
      createdAt: dto.createdAt,
    );

    final tags = dto.tags.map((s) => toCalculatedTag(s)).toList();

    return CalculatedDevice(
      device: device,
      tags: tags,
      summary: _calculateSummary(tags),
    );
  }

  static CalculatedTag toCalculatedTag(TagDto dto) {
    final tag = Tag(
      tagId: dto.tagId,
      deviceId: dto.deviceId,
      portNumber: dto.portNumber,
      name: dto.name,
      slug: dto.slug,
      dataType: dto.dataType,
      unit: dto.unit,
      uiConfigJson: dto.uiConfigJson,
      updatedAt: dto.updatedAt,
    );

    return CalculatedTag(
      tag: tag,
      evaluation: TagEvaluation.idle(),
    );
  }

  static DeviceSummary _calculateSummary(List<CalculatedTag> tags) {
    int normal = 0, warning = 0, critical = 0, offline = 0, noConfig = 0;
    for (var s in tags) {
      switch (s.evaluation.status) {
        case TagStatus.normal:
          normal++;
        case TagStatus.warning:
          warning++;
        case TagStatus.critical:
          critical++;
        case TagStatus.offline:
          offline++;
        case TagStatus.noConfig:
          noConfig++;
        case TagStatus.idle:
          break;
      }
    }
    return DeviceSummary(
      normalCount: normal,
      warningCount: warning,
      criticalCount: critical,
      offlineCount: offline,
      noConfigCount: noConfig,
    );
  }
}
