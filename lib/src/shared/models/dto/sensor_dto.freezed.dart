// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SensorDto {

 int get sensorId; int? get deviceId; int? get portNumber; String? get name; String? get slug; int get sensorDataType; String? get unit; SensorUiConfig? get uiConfigJson; DateTime? get updatedAt;
/// Create a copy of SensorDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SensorDtoCopyWith<SensorDto> get copyWith => _$SensorDtoCopyWithImpl<SensorDto>(this as SensorDto, _$identity);

  /// Serializes this SensorDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorDto&&(identical(other.sensorId, sensorId) || other.sensorId == sensorId)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.portNumber, portNumber) || other.portNumber == portNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.sensorDataType, sensorDataType) || other.sensorDataType == sensorDataType)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.uiConfigJson, uiConfigJson) || other.uiConfigJson == uiConfigJson)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sensorId,deviceId,portNumber,name,slug,sensorDataType,unit,uiConfigJson,updatedAt);

@override
String toString() {
  return 'SensorDto(sensorId: $sensorId, deviceId: $deviceId, portNumber: $portNumber, name: $name, slug: $slug, sensorDataType: $sensorDataType, unit: $unit, uiConfigJson: $uiConfigJson, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SensorDtoCopyWith<$Res>  {
  factory $SensorDtoCopyWith(SensorDto value, $Res Function(SensorDto) _then) = _$SensorDtoCopyWithImpl;
@useResult
$Res call({
 int sensorId, int? deviceId, int? portNumber, String? name, String? slug, int sensorDataType, String? unit, SensorUiConfig? uiConfigJson, DateTime? updatedAt
});


$SensorUiConfigCopyWith<$Res>? get uiConfigJson;

}
/// @nodoc
class _$SensorDtoCopyWithImpl<$Res>
    implements $SensorDtoCopyWith<$Res> {
  _$SensorDtoCopyWithImpl(this._self, this._then);

  final SensorDto _self;
  final $Res Function(SensorDto) _then;

/// Create a copy of SensorDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sensorId = null,Object? deviceId = freezed,Object? portNumber = freezed,Object? name = freezed,Object? slug = freezed,Object? sensorDataType = null,Object? unit = freezed,Object? uiConfigJson = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
sensorId: null == sensorId ? _self.sensorId : sensorId // ignore: cast_nullable_to_non_nullable
as int,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int?,portNumber: freezed == portNumber ? _self.portNumber : portNumber // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,sensorDataType: null == sensorDataType ? _self.sensorDataType : sensorDataType // ignore: cast_nullable_to_non_nullable
as int,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,uiConfigJson: freezed == uiConfigJson ? _self.uiConfigJson : uiConfigJson // ignore: cast_nullable_to_non_nullable
as SensorUiConfig?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of SensorDto
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


/// Adds pattern-matching-related methods to [SensorDto].
extension SensorDtoPatterns on SensorDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SensorDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SensorDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SensorDto value)  $default,){
final _that = this;
switch (_that) {
case _SensorDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SensorDto value)?  $default,){
final _that = this;
switch (_that) {
case _SensorDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sensorId,  int? deviceId,  int? portNumber,  String? name,  String? slug,  int sensorDataType,  String? unit,  SensorUiConfig? uiConfigJson,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SensorDto() when $default != null:
return $default(_that.sensorId,_that.deviceId,_that.portNumber,_that.name,_that.slug,_that.sensorDataType,_that.unit,_that.uiConfigJson,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sensorId,  int? deviceId,  int? portNumber,  String? name,  String? slug,  int sensorDataType,  String? unit,  SensorUiConfig? uiConfigJson,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SensorDto():
return $default(_that.sensorId,_that.deviceId,_that.portNumber,_that.name,_that.slug,_that.sensorDataType,_that.unit,_that.uiConfigJson,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sensorId,  int? deviceId,  int? portNumber,  String? name,  String? slug,  int sensorDataType,  String? unit,  SensorUiConfig? uiConfigJson,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SensorDto() when $default != null:
return $default(_that.sensorId,_that.deviceId,_that.portNumber,_that.name,_that.slug,_that.sensorDataType,_that.unit,_that.uiConfigJson,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SensorDto implements SensorDto {
  const _SensorDto({required this.sensorId, this.deviceId, this.portNumber, this.name, this.slug, required this.sensorDataType, this.unit, this.uiConfigJson, this.updatedAt});
  factory _SensorDto.fromJson(Map<String, dynamic> json) => _$SensorDtoFromJson(json);

@override final  int sensorId;
@override final  int? deviceId;
@override final  int? portNumber;
@override final  String? name;
@override final  String? slug;
@override final  int sensorDataType;
@override final  String? unit;
@override final  SensorUiConfig? uiConfigJson;
@override final  DateTime? updatedAt;

/// Create a copy of SensorDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SensorDtoCopyWith<_SensorDto> get copyWith => __$SensorDtoCopyWithImpl<_SensorDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SensorDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SensorDto&&(identical(other.sensorId, sensorId) || other.sensorId == sensorId)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.portNumber, portNumber) || other.portNumber == portNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.sensorDataType, sensorDataType) || other.sensorDataType == sensorDataType)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.uiConfigJson, uiConfigJson) || other.uiConfigJson == uiConfigJson)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sensorId,deviceId,portNumber,name,slug,sensorDataType,unit,uiConfigJson,updatedAt);

@override
String toString() {
  return 'SensorDto(sensorId: $sensorId, deviceId: $deviceId, portNumber: $portNumber, name: $name, slug: $slug, sensorDataType: $sensorDataType, unit: $unit, uiConfigJson: $uiConfigJson, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SensorDtoCopyWith<$Res> implements $SensorDtoCopyWith<$Res> {
  factory _$SensorDtoCopyWith(_SensorDto value, $Res Function(_SensorDto) _then) = __$SensorDtoCopyWithImpl;
@override @useResult
$Res call({
 int sensorId, int? deviceId, int? portNumber, String? name, String? slug, int sensorDataType, String? unit, SensorUiConfig? uiConfigJson, DateTime? updatedAt
});


@override $SensorUiConfigCopyWith<$Res>? get uiConfigJson;

}
/// @nodoc
class __$SensorDtoCopyWithImpl<$Res>
    implements _$SensorDtoCopyWith<$Res> {
  __$SensorDtoCopyWithImpl(this._self, this._then);

  final _SensorDto _self;
  final $Res Function(_SensorDto) _then;

/// Create a copy of SensorDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sensorId = null,Object? deviceId = freezed,Object? portNumber = freezed,Object? name = freezed,Object? slug = freezed,Object? sensorDataType = null,Object? unit = freezed,Object? uiConfigJson = freezed,Object? updatedAt = freezed,}) {
  return _then(_SensorDto(
sensorId: null == sensorId ? _self.sensorId : sensorId // ignore: cast_nullable_to_non_nullable
as int,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int?,portNumber: freezed == portNumber ? _self.portNumber : portNumber // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,sensorDataType: null == sensorDataType ? _self.sensorDataType : sensorDataType // ignore: cast_nullable_to_non_nullable
as int,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,uiConfigJson: freezed == uiConfigJson ? _self.uiConfigJson : uiConfigJson // ignore: cast_nullable_to_non_nullable
as SensorUiConfig?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of SensorDto
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
