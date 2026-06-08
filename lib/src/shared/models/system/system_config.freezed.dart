// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SystemConfig {

 int get id; int get rawRetentionDays; int get aggRetentionDays; int get pollingIntervalMs; int get configReloadIntervalSec; int get healthCheckIntervalSec; double get deadbandThreshold; int get dataHeartbeatSec; DateTime? get updatedAt;
/// Create a copy of SystemConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SystemConfigCopyWith<SystemConfig> get copyWith => _$SystemConfigCopyWithImpl<SystemConfig>(this as SystemConfig, _$identity);

  /// Serializes this SystemConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SystemConfig&&(identical(other.id, id) || other.id == id)&&(identical(other.rawRetentionDays, rawRetentionDays) || other.rawRetentionDays == rawRetentionDays)&&(identical(other.aggRetentionDays, aggRetentionDays) || other.aggRetentionDays == aggRetentionDays)&&(identical(other.pollingIntervalMs, pollingIntervalMs) || other.pollingIntervalMs == pollingIntervalMs)&&(identical(other.configReloadIntervalSec, configReloadIntervalSec) || other.configReloadIntervalSec == configReloadIntervalSec)&&(identical(other.healthCheckIntervalSec, healthCheckIntervalSec) || other.healthCheckIntervalSec == healthCheckIntervalSec)&&(identical(other.deadbandThreshold, deadbandThreshold) || other.deadbandThreshold == deadbandThreshold)&&(identical(other.dataHeartbeatSec, dataHeartbeatSec) || other.dataHeartbeatSec == dataHeartbeatSec)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rawRetentionDays,aggRetentionDays,pollingIntervalMs,configReloadIntervalSec,healthCheckIntervalSec,deadbandThreshold,dataHeartbeatSec,updatedAt);

@override
String toString() {
  return 'SystemConfig(id: $id, rawRetentionDays: $rawRetentionDays, aggRetentionDays: $aggRetentionDays, pollingIntervalMs: $pollingIntervalMs, configReloadIntervalSec: $configReloadIntervalSec, healthCheckIntervalSec: $healthCheckIntervalSec, deadbandThreshold: $deadbandThreshold, dataHeartbeatSec: $dataHeartbeatSec, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SystemConfigCopyWith<$Res>  {
  factory $SystemConfigCopyWith(SystemConfig value, $Res Function(SystemConfig) _then) = _$SystemConfigCopyWithImpl;
@useResult
$Res call({
 int id, int rawRetentionDays, int aggRetentionDays, int pollingIntervalMs, int configReloadIntervalSec, int healthCheckIntervalSec, double deadbandThreshold, int dataHeartbeatSec, DateTime? updatedAt
});




}
/// @nodoc
class _$SystemConfigCopyWithImpl<$Res>
    implements $SystemConfigCopyWith<$Res> {
  _$SystemConfigCopyWithImpl(this._self, this._then);

  final SystemConfig _self;
  final $Res Function(SystemConfig) _then;

/// Create a copy of SystemConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rawRetentionDays = null,Object? aggRetentionDays = null,Object? pollingIntervalMs = null,Object? configReloadIntervalSec = null,Object? healthCheckIntervalSec = null,Object? deadbandThreshold = null,Object? dataHeartbeatSec = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,rawRetentionDays: null == rawRetentionDays ? _self.rawRetentionDays : rawRetentionDays // ignore: cast_nullable_to_non_nullable
as int,aggRetentionDays: null == aggRetentionDays ? _self.aggRetentionDays : aggRetentionDays // ignore: cast_nullable_to_non_nullable
as int,pollingIntervalMs: null == pollingIntervalMs ? _self.pollingIntervalMs : pollingIntervalMs // ignore: cast_nullable_to_non_nullable
as int,configReloadIntervalSec: null == configReloadIntervalSec ? _self.configReloadIntervalSec : configReloadIntervalSec // ignore: cast_nullable_to_non_nullable
as int,healthCheckIntervalSec: null == healthCheckIntervalSec ? _self.healthCheckIntervalSec : healthCheckIntervalSec // ignore: cast_nullable_to_non_nullable
as int,deadbandThreshold: null == deadbandThreshold ? _self.deadbandThreshold : deadbandThreshold // ignore: cast_nullable_to_non_nullable
as double,dataHeartbeatSec: null == dataHeartbeatSec ? _self.dataHeartbeatSec : dataHeartbeatSec // ignore: cast_nullable_to_non_nullable
as int,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SystemConfig].
extension SystemConfigPatterns on SystemConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SystemConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SystemConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SystemConfig value)  $default,){
final _that = this;
switch (_that) {
case _SystemConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SystemConfig value)?  $default,){
final _that = this;
switch (_that) {
case _SystemConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int rawRetentionDays,  int aggRetentionDays,  int pollingIntervalMs,  int configReloadIntervalSec,  int healthCheckIntervalSec,  double deadbandThreshold,  int dataHeartbeatSec,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SystemConfig() when $default != null:
return $default(_that.id,_that.rawRetentionDays,_that.aggRetentionDays,_that.pollingIntervalMs,_that.configReloadIntervalSec,_that.healthCheckIntervalSec,_that.deadbandThreshold,_that.dataHeartbeatSec,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int rawRetentionDays,  int aggRetentionDays,  int pollingIntervalMs,  int configReloadIntervalSec,  int healthCheckIntervalSec,  double deadbandThreshold,  int dataHeartbeatSec,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SystemConfig():
return $default(_that.id,_that.rawRetentionDays,_that.aggRetentionDays,_that.pollingIntervalMs,_that.configReloadIntervalSec,_that.healthCheckIntervalSec,_that.deadbandThreshold,_that.dataHeartbeatSec,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int rawRetentionDays,  int aggRetentionDays,  int pollingIntervalMs,  int configReloadIntervalSec,  int healthCheckIntervalSec,  double deadbandThreshold,  int dataHeartbeatSec,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SystemConfig() when $default != null:
return $default(_that.id,_that.rawRetentionDays,_that.aggRetentionDays,_that.pollingIntervalMs,_that.configReloadIntervalSec,_that.healthCheckIntervalSec,_that.deadbandThreshold,_that.dataHeartbeatSec,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SystemConfig implements SystemConfig {
  const _SystemConfig({required this.id, this.rawRetentionDays = 90, this.aggRetentionDays = 1825, this.pollingIntervalMs = 1000, this.configReloadIntervalSec = 60, this.healthCheckIntervalSec = 30, this.deadbandThreshold = 0.01, this.dataHeartbeatSec = 600, this.updatedAt});
  factory _SystemConfig.fromJson(Map<String, dynamic> json) => _$SystemConfigFromJson(json);

@override final  int id;
@override@JsonKey() final  int rawRetentionDays;
@override@JsonKey() final  int aggRetentionDays;
@override@JsonKey() final  int pollingIntervalMs;
@override@JsonKey() final  int configReloadIntervalSec;
@override@JsonKey() final  int healthCheckIntervalSec;
@override@JsonKey() final  double deadbandThreshold;
@override@JsonKey() final  int dataHeartbeatSec;
@override final  DateTime? updatedAt;

/// Create a copy of SystemConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SystemConfigCopyWith<_SystemConfig> get copyWith => __$SystemConfigCopyWithImpl<_SystemConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SystemConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SystemConfig&&(identical(other.id, id) || other.id == id)&&(identical(other.rawRetentionDays, rawRetentionDays) || other.rawRetentionDays == rawRetentionDays)&&(identical(other.aggRetentionDays, aggRetentionDays) || other.aggRetentionDays == aggRetentionDays)&&(identical(other.pollingIntervalMs, pollingIntervalMs) || other.pollingIntervalMs == pollingIntervalMs)&&(identical(other.configReloadIntervalSec, configReloadIntervalSec) || other.configReloadIntervalSec == configReloadIntervalSec)&&(identical(other.healthCheckIntervalSec, healthCheckIntervalSec) || other.healthCheckIntervalSec == healthCheckIntervalSec)&&(identical(other.deadbandThreshold, deadbandThreshold) || other.deadbandThreshold == deadbandThreshold)&&(identical(other.dataHeartbeatSec, dataHeartbeatSec) || other.dataHeartbeatSec == dataHeartbeatSec)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rawRetentionDays,aggRetentionDays,pollingIntervalMs,configReloadIntervalSec,healthCheckIntervalSec,deadbandThreshold,dataHeartbeatSec,updatedAt);

@override
String toString() {
  return 'SystemConfig(id: $id, rawRetentionDays: $rawRetentionDays, aggRetentionDays: $aggRetentionDays, pollingIntervalMs: $pollingIntervalMs, configReloadIntervalSec: $configReloadIntervalSec, healthCheckIntervalSec: $healthCheckIntervalSec, deadbandThreshold: $deadbandThreshold, dataHeartbeatSec: $dataHeartbeatSec, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SystemConfigCopyWith<$Res> implements $SystemConfigCopyWith<$Res> {
  factory _$SystemConfigCopyWith(_SystemConfig value, $Res Function(_SystemConfig) _then) = __$SystemConfigCopyWithImpl;
@override @useResult
$Res call({
 int id, int rawRetentionDays, int aggRetentionDays, int pollingIntervalMs, int configReloadIntervalSec, int healthCheckIntervalSec, double deadbandThreshold, int dataHeartbeatSec, DateTime? updatedAt
});




}
/// @nodoc
class __$SystemConfigCopyWithImpl<$Res>
    implements _$SystemConfigCopyWith<$Res> {
  __$SystemConfigCopyWithImpl(this._self, this._then);

  final _SystemConfig _self;
  final $Res Function(_SystemConfig) _then;

/// Create a copy of SystemConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rawRetentionDays = null,Object? aggRetentionDays = null,Object? pollingIntervalMs = null,Object? configReloadIntervalSec = null,Object? healthCheckIntervalSec = null,Object? deadbandThreshold = null,Object? dataHeartbeatSec = null,Object? updatedAt = freezed,}) {
  return _then(_SystemConfig(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,rawRetentionDays: null == rawRetentionDays ? _self.rawRetentionDays : rawRetentionDays // ignore: cast_nullable_to_non_nullable
as int,aggRetentionDays: null == aggRetentionDays ? _self.aggRetentionDays : aggRetentionDays // ignore: cast_nullable_to_non_nullable
as int,pollingIntervalMs: null == pollingIntervalMs ? _self.pollingIntervalMs : pollingIntervalMs // ignore: cast_nullable_to_non_nullable
as int,configReloadIntervalSec: null == configReloadIntervalSec ? _self.configReloadIntervalSec : configReloadIntervalSec // ignore: cast_nullable_to_non_nullable
as int,healthCheckIntervalSec: null == healthCheckIntervalSec ? _self.healthCheckIntervalSec : healthCheckIntervalSec // ignore: cast_nullable_to_non_nullable
as int,deadbandThreshold: null == deadbandThreshold ? _self.deadbandThreshold : deadbandThreshold // ignore: cast_nullable_to_non_nullable
as double,dataHeartbeatSec: null == dataHeartbeatSec ? _self.dataHeartbeatSec : dataHeartbeatSec // ignore: cast_nullable_to_non_nullable
as int,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
