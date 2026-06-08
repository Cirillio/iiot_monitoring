// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SystemStatus {

 String get serviceName; ServiceStatus get status; int get uptimeSeconds; String? get lastError; DateTime? get lastSync;
/// Create a copy of SystemStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SystemStatusCopyWith<SystemStatus> get copyWith => _$SystemStatusCopyWithImpl<SystemStatus>(this as SystemStatus, _$identity);

  /// Serializes this SystemStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SystemStatus&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.status, status) || other.status == status)&&(identical(other.uptimeSeconds, uptimeSeconds) || other.uptimeSeconds == uptimeSeconds)&&(identical(other.lastError, lastError) || other.lastError == lastError)&&(identical(other.lastSync, lastSync) || other.lastSync == lastSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceName,status,uptimeSeconds,lastError,lastSync);

@override
String toString() {
  return 'SystemStatus(serviceName: $serviceName, status: $status, uptimeSeconds: $uptimeSeconds, lastError: $lastError, lastSync: $lastSync)';
}


}

/// @nodoc
abstract mixin class $SystemStatusCopyWith<$Res>  {
  factory $SystemStatusCopyWith(SystemStatus value, $Res Function(SystemStatus) _then) = _$SystemStatusCopyWithImpl;
@useResult
$Res call({
 String serviceName, ServiceStatus status, int uptimeSeconds, String? lastError, DateTime? lastSync
});




}
/// @nodoc
class _$SystemStatusCopyWithImpl<$Res>
    implements $SystemStatusCopyWith<$Res> {
  _$SystemStatusCopyWithImpl(this._self, this._then);

  final SystemStatus _self;
  final $Res Function(SystemStatus) _then;

/// Create a copy of SystemStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceName = null,Object? status = null,Object? uptimeSeconds = null,Object? lastError = freezed,Object? lastSync = freezed,}) {
  return _then(_self.copyWith(
serviceName: null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ServiceStatus,uptimeSeconds: null == uptimeSeconds ? _self.uptimeSeconds : uptimeSeconds // ignore: cast_nullable_to_non_nullable
as int,lastError: freezed == lastError ? _self.lastError : lastError // ignore: cast_nullable_to_non_nullable
as String?,lastSync: freezed == lastSync ? _self.lastSync : lastSync // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SystemStatus].
extension SystemStatusPatterns on SystemStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SystemStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SystemStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SystemStatus value)  $default,){
final _that = this;
switch (_that) {
case _SystemStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SystemStatus value)?  $default,){
final _that = this;
switch (_that) {
case _SystemStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String serviceName,  ServiceStatus status,  int uptimeSeconds,  String? lastError,  DateTime? lastSync)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SystemStatus() when $default != null:
return $default(_that.serviceName,_that.status,_that.uptimeSeconds,_that.lastError,_that.lastSync);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String serviceName,  ServiceStatus status,  int uptimeSeconds,  String? lastError,  DateTime? lastSync)  $default,) {final _that = this;
switch (_that) {
case _SystemStatus():
return $default(_that.serviceName,_that.status,_that.uptimeSeconds,_that.lastError,_that.lastSync);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String serviceName,  ServiceStatus status,  int uptimeSeconds,  String? lastError,  DateTime? lastSync)?  $default,) {final _that = this;
switch (_that) {
case _SystemStatus() when $default != null:
return $default(_that.serviceName,_that.status,_that.uptimeSeconds,_that.lastError,_that.lastSync);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SystemStatus implements SystemStatus {
  const _SystemStatus({this.serviceName = '', this.status = ServiceStatus.offline, this.uptimeSeconds = 0, this.lastError, this.lastSync});
  factory _SystemStatus.fromJson(Map<String, dynamic> json) => _$SystemStatusFromJson(json);

@override@JsonKey() final  String serviceName;
@override@JsonKey() final  ServiceStatus status;
@override@JsonKey() final  int uptimeSeconds;
@override final  String? lastError;
@override final  DateTime? lastSync;

/// Create a copy of SystemStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SystemStatusCopyWith<_SystemStatus> get copyWith => __$SystemStatusCopyWithImpl<_SystemStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SystemStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SystemStatus&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.status, status) || other.status == status)&&(identical(other.uptimeSeconds, uptimeSeconds) || other.uptimeSeconds == uptimeSeconds)&&(identical(other.lastError, lastError) || other.lastError == lastError)&&(identical(other.lastSync, lastSync) || other.lastSync == lastSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceName,status,uptimeSeconds,lastError,lastSync);

@override
String toString() {
  return 'SystemStatus(serviceName: $serviceName, status: $status, uptimeSeconds: $uptimeSeconds, lastError: $lastError, lastSync: $lastSync)';
}


}

/// @nodoc
abstract mixin class _$SystemStatusCopyWith<$Res> implements $SystemStatusCopyWith<$Res> {
  factory _$SystemStatusCopyWith(_SystemStatus value, $Res Function(_SystemStatus) _then) = __$SystemStatusCopyWithImpl;
@override @useResult
$Res call({
 String serviceName, ServiceStatus status, int uptimeSeconds, String? lastError, DateTime? lastSync
});




}
/// @nodoc
class __$SystemStatusCopyWithImpl<$Res>
    implements _$SystemStatusCopyWith<$Res> {
  __$SystemStatusCopyWithImpl(this._self, this._then);

  final _SystemStatus _self;
  final $Res Function(_SystemStatus) _then;

/// Create a copy of SystemStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceName = null,Object? status = null,Object? uptimeSeconds = null,Object? lastError = freezed,Object? lastSync = freezed,}) {
  return _then(_SystemStatus(
serviceName: null == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ServiceStatus,uptimeSeconds: null == uptimeSeconds ? _self.uptimeSeconds : uptimeSeconds // ignore: cast_nullable_to_non_nullable
as int,lastError: freezed == lastError ? _self.lastError : lastError // ignore: cast_nullable_to_non_nullable
as String?,lastSync: freezed == lastSync ? _self.lastSync : lastSync // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
