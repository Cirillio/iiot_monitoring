// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Device {

 int get id; String get name; int get connectionId; String get ipAddress; int get port; int get slaveId; bool get useGroupPolling; int get maxRegisterSpan; bool get isActive; bool get isOnline; DateTime? get lastSeen; DateTime? get createdAt; List<Tag> get tags; int get totalTags;
/// Create a copy of Device
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceCopyWith<Device> get copyWith => _$DeviceCopyWithImpl<Device>(this as Device, _$identity);

  /// Serializes this Device to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Device&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.connectionId, connectionId) || other.connectionId == connectionId)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.port, port) || other.port == port)&&(identical(other.slaveId, slaveId) || other.slaveId == slaveId)&&(identical(other.useGroupPolling, useGroupPolling) || other.useGroupPolling == useGroupPolling)&&(identical(other.maxRegisterSpan, maxRegisterSpan) || other.maxRegisterSpan == maxRegisterSpan)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.totalTags, totalTags) || other.totalTags == totalTags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,connectionId,ipAddress,port,slaveId,useGroupPolling,maxRegisterSpan,isActive,isOnline,lastSeen,createdAt,const DeepCollectionEquality().hash(tags),totalTags);

@override
String toString() {
  return 'Device(id: $id, name: $name, connectionId: $connectionId, ipAddress: $ipAddress, port: $port, slaveId: $slaveId, useGroupPolling: $useGroupPolling, maxRegisterSpan: $maxRegisterSpan, isActive: $isActive, isOnline: $isOnline, lastSeen: $lastSeen, createdAt: $createdAt, tags: $tags, totalTags: $totalTags)';
}


}

/// @nodoc
abstract mixin class $DeviceCopyWith<$Res>  {
  factory $DeviceCopyWith(Device value, $Res Function(Device) _then) = _$DeviceCopyWithImpl;
@useResult
$Res call({
 int id, String name, int connectionId, String ipAddress, int port, int slaveId, bool useGroupPolling, int maxRegisterSpan, bool isActive, bool isOnline, DateTime? lastSeen, DateTime? createdAt, List<Tag> tags, int totalTags
});




}
/// @nodoc
class _$DeviceCopyWithImpl<$Res>
    implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._self, this._then);

  final Device _self;
  final $Res Function(Device) _then;

/// Create a copy of Device
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? connectionId = null,Object? ipAddress = null,Object? port = null,Object? slaveId = null,Object? useGroupPolling = null,Object? maxRegisterSpan = null,Object? isActive = null,Object? isOnline = null,Object? lastSeen = freezed,Object? createdAt = freezed,Object? tags = null,Object? totalTags = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,connectionId: null == connectionId ? _self.connectionId : connectionId // ignore: cast_nullable_to_non_nullable
as int,ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,slaveId: null == slaveId ? _self.slaveId : slaveId // ignore: cast_nullable_to_non_nullable
as int,useGroupPolling: null == useGroupPolling ? _self.useGroupPolling : useGroupPolling // ignore: cast_nullable_to_non_nullable
as bool,maxRegisterSpan: null == maxRegisterSpan ? _self.maxRegisterSpan : maxRegisterSpan // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeen: freezed == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,totalTags: null == totalTags ? _self.totalTags : totalTags // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Device].
extension DevicePatterns on Device {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Device value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Device() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Device value)  $default,){
final _that = this;
switch (_that) {
case _Device():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Device value)?  $default,){
final _that = this;
switch (_that) {
case _Device() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int connectionId,  String ipAddress,  int port,  int slaveId,  bool useGroupPolling,  int maxRegisterSpan,  bool isActive,  bool isOnline,  DateTime? lastSeen,  DateTime? createdAt,  List<Tag> tags,  int totalTags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Device() when $default != null:
return $default(_that.id,_that.name,_that.connectionId,_that.ipAddress,_that.port,_that.slaveId,_that.useGroupPolling,_that.maxRegisterSpan,_that.isActive,_that.isOnline,_that.lastSeen,_that.createdAt,_that.tags,_that.totalTags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int connectionId,  String ipAddress,  int port,  int slaveId,  bool useGroupPolling,  int maxRegisterSpan,  bool isActive,  bool isOnline,  DateTime? lastSeen,  DateTime? createdAt,  List<Tag> tags,  int totalTags)  $default,) {final _that = this;
switch (_that) {
case _Device():
return $default(_that.id,_that.name,_that.connectionId,_that.ipAddress,_that.port,_that.slaveId,_that.useGroupPolling,_that.maxRegisterSpan,_that.isActive,_that.isOnline,_that.lastSeen,_that.createdAt,_that.tags,_that.totalTags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int connectionId,  String ipAddress,  int port,  int slaveId,  bool useGroupPolling,  int maxRegisterSpan,  bool isActive,  bool isOnline,  DateTime? lastSeen,  DateTime? createdAt,  List<Tag> tags,  int totalTags)?  $default,) {final _that = this;
switch (_that) {
case _Device() when $default != null:
return $default(_that.id,_that.name,_that.connectionId,_that.ipAddress,_that.port,_that.slaveId,_that.useGroupPolling,_that.maxRegisterSpan,_that.isActive,_that.isOnline,_that.lastSeen,_that.createdAt,_that.tags,_that.totalTags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Device extends Device {
  const _Device({required this.id, this.name = "Unnamed Device", required this.connectionId, this.ipAddress = "127.0.0.1", required this.port, required this.slaveId, this.useGroupPolling = true, this.maxRegisterSpan = 120, this.isActive = false, this.isOnline = false, this.lastSeen, this.createdAt, final  List<Tag> tags = const [], this.totalTags = 0}): _tags = tags,super._();
  factory _Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

@override final  int id;
@override@JsonKey() final  String name;
@override final  int connectionId;
@override@JsonKey() final  String ipAddress;
@override final  int port;
@override final  int slaveId;
@override@JsonKey() final  bool useGroupPolling;
@override@JsonKey() final  int maxRegisterSpan;
@override@JsonKey() final  bool isActive;
@override@JsonKey() final  bool isOnline;
@override final  DateTime? lastSeen;
@override final  DateTime? createdAt;
 final  List<Tag> _tags;
@override@JsonKey() List<Tag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey() final  int totalTags;

/// Create a copy of Device
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceCopyWith<_Device> get copyWith => __$DeviceCopyWithImpl<_Device>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Device&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.connectionId, connectionId) || other.connectionId == connectionId)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.port, port) || other.port == port)&&(identical(other.slaveId, slaveId) || other.slaveId == slaveId)&&(identical(other.useGroupPolling, useGroupPolling) || other.useGroupPolling == useGroupPolling)&&(identical(other.maxRegisterSpan, maxRegisterSpan) || other.maxRegisterSpan == maxRegisterSpan)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.totalTags, totalTags) || other.totalTags == totalTags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,connectionId,ipAddress,port,slaveId,useGroupPolling,maxRegisterSpan,isActive,isOnline,lastSeen,createdAt,const DeepCollectionEquality().hash(_tags),totalTags);

@override
String toString() {
  return 'Device(id: $id, name: $name, connectionId: $connectionId, ipAddress: $ipAddress, port: $port, slaveId: $slaveId, useGroupPolling: $useGroupPolling, maxRegisterSpan: $maxRegisterSpan, isActive: $isActive, isOnline: $isOnline, lastSeen: $lastSeen, createdAt: $createdAt, tags: $tags, totalTags: $totalTags)';
}


}

/// @nodoc
abstract mixin class _$DeviceCopyWith<$Res> implements $DeviceCopyWith<$Res> {
  factory _$DeviceCopyWith(_Device value, $Res Function(_Device) _then) = __$DeviceCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int connectionId, String ipAddress, int port, int slaveId, bool useGroupPolling, int maxRegisterSpan, bool isActive, bool isOnline, DateTime? lastSeen, DateTime? createdAt, List<Tag> tags, int totalTags
});




}
/// @nodoc
class __$DeviceCopyWithImpl<$Res>
    implements _$DeviceCopyWith<$Res> {
  __$DeviceCopyWithImpl(this._self, this._then);

  final _Device _self;
  final $Res Function(_Device) _then;

/// Create a copy of Device
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? connectionId = null,Object? ipAddress = null,Object? port = null,Object? slaveId = null,Object? useGroupPolling = null,Object? maxRegisterSpan = null,Object? isActive = null,Object? isOnline = null,Object? lastSeen = freezed,Object? createdAt = freezed,Object? tags = null,Object? totalTags = null,}) {
  return _then(_Device(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,connectionId: null == connectionId ? _self.connectionId : connectionId // ignore: cast_nullable_to_non_nullable
as int,ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,slaveId: null == slaveId ? _self.slaveId : slaveId // ignore: cast_nullable_to_non_nullable
as int,useGroupPolling: null == useGroupPolling ? _self.useGroupPolling : useGroupPolling // ignore: cast_nullable_to_non_nullable
as bool,maxRegisterSpan: null == maxRegisterSpan ? _self.maxRegisterSpan : maxRegisterSpan // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeen: freezed == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,totalTags: null == totalTags ? _self.totalTags : totalTags // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
