// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculated_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalculatedDevice {

 Device get device; List<CalculatedSensor> get sensors; DeviceSummary get summary;
/// Create a copy of CalculatedDevice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalculatedDeviceCopyWith<CalculatedDevice> get copyWith => _$CalculatedDeviceCopyWithImpl<CalculatedDevice>(this as CalculatedDevice, _$identity);

  /// Serializes this CalculatedDevice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalculatedDevice&&(identical(other.device, device) || other.device == device)&&const DeepCollectionEquality().equals(other.sensors, sensors)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,device,const DeepCollectionEquality().hash(sensors),summary);

@override
String toString() {
  return 'CalculatedDevice(device: $device, sensors: $sensors, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $CalculatedDeviceCopyWith<$Res>  {
  factory $CalculatedDeviceCopyWith(CalculatedDevice value, $Res Function(CalculatedDevice) _then) = _$CalculatedDeviceCopyWithImpl;
@useResult
$Res call({
 Device device, List<CalculatedSensor> sensors, DeviceSummary summary
});


$DeviceCopyWith<$Res> get device;$DeviceSummaryCopyWith<$Res> get summary;

}
/// @nodoc
class _$CalculatedDeviceCopyWithImpl<$Res>
    implements $CalculatedDeviceCopyWith<$Res> {
  _$CalculatedDeviceCopyWithImpl(this._self, this._then);

  final CalculatedDevice _self;
  final $Res Function(CalculatedDevice) _then;

/// Create a copy of CalculatedDevice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? device = null,Object? sensors = null,Object? summary = null,}) {
  return _then(_self.copyWith(
device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as Device,sensors: null == sensors ? _self.sensors : sensors // ignore: cast_nullable_to_non_nullable
as List<CalculatedSensor>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as DeviceSummary,
  ));
}
/// Create a copy of CalculatedDevice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceCopyWith<$Res> get device {
  
  return $DeviceCopyWith<$Res>(_self.device, (value) {
    return _then(_self.copyWith(device: value));
  });
}/// Create a copy of CalculatedDevice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceSummaryCopyWith<$Res> get summary {
  
  return $DeviceSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [CalculatedDevice].
extension CalculatedDevicePatterns on CalculatedDevice {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalculatedDevice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalculatedDevice() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalculatedDevice value)  $default,){
final _that = this;
switch (_that) {
case _CalculatedDevice():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalculatedDevice value)?  $default,){
final _that = this;
switch (_that) {
case _CalculatedDevice() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Device device,  List<CalculatedSensor> sensors,  DeviceSummary summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalculatedDevice() when $default != null:
return $default(_that.device,_that.sensors,_that.summary);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Device device,  List<CalculatedSensor> sensors,  DeviceSummary summary)  $default,) {final _that = this;
switch (_that) {
case _CalculatedDevice():
return $default(_that.device,_that.sensors,_that.summary);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Device device,  List<CalculatedSensor> sensors,  DeviceSummary summary)?  $default,) {final _that = this;
switch (_that) {
case _CalculatedDevice() when $default != null:
return $default(_that.device,_that.sensors,_that.summary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalculatedDevice implements CalculatedDevice {
  const _CalculatedDevice({required this.device, required final  List<CalculatedSensor> sensors, required this.summary}): _sensors = sensors;
  factory _CalculatedDevice.fromJson(Map<String, dynamic> json) => _$CalculatedDeviceFromJson(json);

@override final  Device device;
 final  List<CalculatedSensor> _sensors;
@override List<CalculatedSensor> get sensors {
  if (_sensors is EqualUnmodifiableListView) return _sensors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sensors);
}

@override final  DeviceSummary summary;

/// Create a copy of CalculatedDevice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalculatedDeviceCopyWith<_CalculatedDevice> get copyWith => __$CalculatedDeviceCopyWithImpl<_CalculatedDevice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalculatedDeviceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalculatedDevice&&(identical(other.device, device) || other.device == device)&&const DeepCollectionEquality().equals(other._sensors, _sensors)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,device,const DeepCollectionEquality().hash(_sensors),summary);

@override
String toString() {
  return 'CalculatedDevice(device: $device, sensors: $sensors, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$CalculatedDeviceCopyWith<$Res> implements $CalculatedDeviceCopyWith<$Res> {
  factory _$CalculatedDeviceCopyWith(_CalculatedDevice value, $Res Function(_CalculatedDevice) _then) = __$CalculatedDeviceCopyWithImpl;
@override @useResult
$Res call({
 Device device, List<CalculatedSensor> sensors, DeviceSummary summary
});


@override $DeviceCopyWith<$Res> get device;@override $DeviceSummaryCopyWith<$Res> get summary;

}
/// @nodoc
class __$CalculatedDeviceCopyWithImpl<$Res>
    implements _$CalculatedDeviceCopyWith<$Res> {
  __$CalculatedDeviceCopyWithImpl(this._self, this._then);

  final _CalculatedDevice _self;
  final $Res Function(_CalculatedDevice) _then;

/// Create a copy of CalculatedDevice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? device = null,Object? sensors = null,Object? summary = null,}) {
  return _then(_CalculatedDevice(
device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as Device,sensors: null == sensors ? _self._sensors : sensors // ignore: cast_nullable_to_non_nullable
as List<CalculatedSensor>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as DeviceSummary,
  ));
}

/// Create a copy of CalculatedDevice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceCopyWith<$Res> get device {
  
  return $DeviceCopyWith<$Res>(_self.device, (value) {
    return _then(_self.copyWith(device: value));
  });
}/// Create a copy of CalculatedDevice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceSummaryCopyWith<$Res> get summary {
  
  return $DeviceSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

// dart format on
