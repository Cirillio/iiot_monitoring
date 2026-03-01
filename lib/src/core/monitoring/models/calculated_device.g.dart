// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculated_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalculatedDevice _$CalculatedDeviceFromJson(Map<String, dynamic> json) =>
    _CalculatedDevice(
      device: Device.fromJson(json['device'] as Map<String, dynamic>),
      sensors: (json['sensors'] as List<dynamic>)
          .map((e) => CalculatedSensor.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: DeviceSummary.fromJson(json['summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CalculatedDeviceToJson(_CalculatedDevice instance) =>
    <String, dynamic>{
      'device': instance.device,
      'sensors': instance.sensors,
      'summary': instance.summary,
    };
