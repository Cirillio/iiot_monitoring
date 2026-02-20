// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Sensor {

 int get sensorId; int get deviceId; String get name; int get sensorDataType; String? get unit; SensorUiConfig? get uiConfigJson;@JsonKey(includeFromJson: false, includeToJson: false) double? get currentValue;
/// Create a copy of Sensor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SensorCopyWith<Sensor> get copyWith => _$SensorCopyWithImpl<Sensor>(this as Sensor, _$identity);

  /// Serializes this Sensor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sensor&&(identical(other.sensorId, sensorId) || other.sensorId == sensorId)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.name, name) || other.name == name)&&(identical(other.sensorDataType, sensorDataType) || other.sensorDataType == sensorDataType)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.uiConfigJson, uiConfigJson) || other.uiConfigJson == uiConfigJson)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sensorId,deviceId,name,sensorDataType,unit,uiConfigJson,currentValue);

@override
String toString() {
  return 'Sensor(sensorId: $sensorId, deviceId: $deviceId, name: $name, sensorDataType: $sensorDataType, unit: $unit, uiConfigJson: $uiConfigJson, currentValue: $currentValue)';
}


}

/// @nodoc
abstract mixin class $SensorCopyWith<$Res>  {
  factory $SensorCopyWith(Sensor value, $Res Function(Sensor) _then) = _$SensorCopyWithImpl;
@useResult
$Res call({
 int sensorId, int deviceId, String name, int sensorDataType, String? unit, SensorUiConfig? uiConfigJson,@JsonKey(includeFromJson: false, includeToJson: false) double? currentValue
});


$SensorUiConfigCopyWith<$Res>? get uiConfigJson;

}
/// @nodoc
class _$SensorCopyWithImpl<$Res>
    implements $SensorCopyWith<$Res> {
  _$SensorCopyWithImpl(this._self, this._then);

  final Sensor _self;
  final $Res Function(Sensor) _then;

/// Create a copy of Sensor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sensorId = null,Object? deviceId = null,Object? name = null,Object? sensorDataType = null,Object? unit = freezed,Object? uiConfigJson = freezed,Object? currentValue = freezed,}) {
  return _then(_self.copyWith(
sensorId: null == sensorId ? _self.sensorId : sensorId // ignore: cast_nullable_to_non_nullable
as int,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sensorDataType: null == sensorDataType ? _self.sensorDataType : sensorDataType // ignore: cast_nullable_to_non_nullable
as int,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,uiConfigJson: freezed == uiConfigJson ? _self.uiConfigJson : uiConfigJson // ignore: cast_nullable_to_non_nullable
as SensorUiConfig?,currentValue: freezed == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of Sensor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SensorUiConfigCopyWith<$Res>? get uiConfigJson {
    if (_self.uiConfigJson == null) {
    return null;
  }

  return $SensorUiConfigCopyWith<$Res>(_self.uiConfigJson!, (value) {
    return _then(_self.copyWith(uiConfigJson: value));
  });
}
}


/// Adds pattern-matching-related methods to [Sensor].
extension SensorPatterns on Sensor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sensor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sensor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sensor value)  $default,){
final _that = this;
switch (_that) {
case _Sensor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sensor value)?  $default,){
final _that = this;
switch (_that) {
case _Sensor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sensorId,  int deviceId,  String name,  int sensorDataType,  String? unit,  SensorUiConfig? uiConfigJson, @JsonKey(includeFromJson: false, includeToJson: false)  double? currentValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sensor() when $default != null:
return $default(_that.sensorId,_that.deviceId,_that.name,_that.sensorDataType,_that.unit,_that.uiConfigJson,_that.currentValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sensorId,  int deviceId,  String name,  int sensorDataType,  String? unit,  SensorUiConfig? uiConfigJson, @JsonKey(includeFromJson: false, includeToJson: false)  double? currentValue)  $default,) {final _that = this;
switch (_that) {
case _Sensor():
return $default(_that.sensorId,_that.deviceId,_that.name,_that.sensorDataType,_that.unit,_that.uiConfigJson,_that.currentValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sensorId,  int deviceId,  String name,  int sensorDataType,  String? unit,  SensorUiConfig? uiConfigJson, @JsonKey(includeFromJson: false, includeToJson: false)  double? currentValue)?  $default,) {final _that = this;
switch (_that) {
case _Sensor() when $default != null:
return $default(_that.sensorId,_that.deviceId,_that.name,_that.sensorDataType,_that.unit,_that.uiConfigJson,_that.currentValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Sensor implements Sensor {
  const _Sensor({required this.sensorId, required this.deviceId, required this.name, required this.sensorDataType, this.unit, this.uiConfigJson, @JsonKey(includeFromJson: false, includeToJson: false) this.currentValue});
  factory _Sensor.fromJson(Map<String, dynamic> json) => _$SensorFromJson(json);

@override final  int sensorId;
@override final  int deviceId;
@override final  String name;
@override final  int sensorDataType;
@override final  String? unit;
@override final  SensorUiConfig? uiConfigJson;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  double? currentValue;

/// Create a copy of Sensor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SensorCopyWith<_Sensor> get copyWith => __$SensorCopyWithImpl<_Sensor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SensorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sensor&&(identical(other.sensorId, sensorId) || other.sensorId == sensorId)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.name, name) || other.name == name)&&(identical(other.sensorDataType, sensorDataType) || other.sensorDataType == sensorDataType)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.uiConfigJson, uiConfigJson) || other.uiConfigJson == uiConfigJson)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sensorId,deviceId,name,sensorDataType,unit,uiConfigJson,currentValue);

@override
String toString() {
  return 'Sensor(sensorId: $sensorId, deviceId: $deviceId, name: $name, sensorDataType: $sensorDataType, unit: $unit, uiConfigJson: $uiConfigJson, currentValue: $currentValue)';
}


}

/// @nodoc
abstract mixin class _$SensorCopyWith<$Res> implements $SensorCopyWith<$Res> {
  factory _$SensorCopyWith(_Sensor value, $Res Function(_Sensor) _then) = __$SensorCopyWithImpl;
@override @useResult
$Res call({
 int sensorId, int deviceId, String name, int sensorDataType, String? unit, SensorUiConfig? uiConfigJson,@JsonKey(includeFromJson: false, includeToJson: false) double? currentValue
});


@override $SensorUiConfigCopyWith<$Res>? get uiConfigJson;

}
/// @nodoc
class __$SensorCopyWithImpl<$Res>
    implements _$SensorCopyWith<$Res> {
  __$SensorCopyWithImpl(this._self, this._then);

  final _Sensor _self;
  final $Res Function(_Sensor) _then;

/// Create a copy of Sensor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sensorId = null,Object? deviceId = null,Object? name = null,Object? sensorDataType = null,Object? unit = freezed,Object? uiConfigJson = freezed,Object? currentValue = freezed,}) {
  return _then(_Sensor(
sensorId: null == sensorId ? _self.sensorId : sensorId // ignore: cast_nullable_to_non_nullable
as int,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sensorDataType: null == sensorDataType ? _self.sensorDataType : sensorDataType // ignore: cast_nullable_to_non_nullable
as int,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,uiConfigJson: freezed == uiConfigJson ? _self.uiConfigJson : uiConfigJson // ignore: cast_nullable_to_non_nullable
as SensorUiConfig?,currentValue: freezed == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of Sensor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SensorUiConfigCopyWith<$Res>? get uiConfigJson {
    if (_self.uiConfigJson == null) {
    return null;
  }

  return $SensorUiConfigCopyWith<$Res>(_self.uiConfigJson!, (value) {
    return _then(_self.copyWith(uiConfigJson: value));
  });
}
}

// dart format on
