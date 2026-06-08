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

 Device get device; List<CalculatedTag> get tags; DeviceSummary get summary;
/// Create a copy of CalculatedDevice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalculatedDeviceCopyWith<CalculatedDevice> get copyWith => _$CalculatedDeviceCopyWithImpl<CalculatedDevice>(this as CalculatedDevice, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalculatedDevice&&(identical(other.device, device) || other.device == device)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.summary, summary) || other.summary == summary));
}


@override
int get hashCode => Object.hash(runtimeType,device,const DeepCollectionEquality().hash(tags),summary);

@override
String toString() {
  return 'CalculatedDevice(device: $device, tags: $tags, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $CalculatedDeviceCopyWith<$Res>  {
  factory $CalculatedDeviceCopyWith(CalculatedDevice value, $Res Function(CalculatedDevice) _then) = _$CalculatedDeviceCopyWithImpl;
@useResult
$Res call({
 Device device, List<CalculatedTag> tags, DeviceSummary summary
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
@pragma('vm:prefer-inline') @override $Res call({Object? device = null,Object? tags = null,Object? summary = null,}) {
  return _then(_self.copyWith(
device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as Device,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<CalculatedTag>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Device device,  List<CalculatedTag> tags,  DeviceSummary summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalculatedDevice() when $default != null:
return $default(_that.device,_that.tags,_that.summary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Device device,  List<CalculatedTag> tags,  DeviceSummary summary)  $default,) {final _that = this;
switch (_that) {
case _CalculatedDevice():
return $default(_that.device,_that.tags,_that.summary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Device device,  List<CalculatedTag> tags,  DeviceSummary summary)?  $default,) {final _that = this;
switch (_that) {
case _CalculatedDevice() when $default != null:
return $default(_that.device,_that.tags,_that.summary);case _:
  return null;

}
}

}

/// @nodoc


class _CalculatedDevice extends CalculatedDevice {
  const _CalculatedDevice({required this.device, required final  List<CalculatedTag> tags, required this.summary}): _tags = tags,super._();
  

@override final  Device device;
 final  List<CalculatedTag> _tags;
@override List<CalculatedTag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  DeviceSummary summary;

/// Create a copy of CalculatedDevice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalculatedDeviceCopyWith<_CalculatedDevice> get copyWith => __$CalculatedDeviceCopyWithImpl<_CalculatedDevice>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalculatedDevice&&(identical(other.device, device) || other.device == device)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.summary, summary) || other.summary == summary));
}


@override
int get hashCode => Object.hash(runtimeType,device,const DeepCollectionEquality().hash(_tags),summary);

@override
String toString() {
  return 'CalculatedDevice(device: $device, tags: $tags, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$CalculatedDeviceCopyWith<$Res> implements $CalculatedDeviceCopyWith<$Res> {
  factory _$CalculatedDeviceCopyWith(_CalculatedDevice value, $Res Function(_CalculatedDevice) _then) = __$CalculatedDeviceCopyWithImpl;
@override @useResult
$Res call({
 Device device, List<CalculatedTag> tags, DeviceSummary summary
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
@override @pragma('vm:prefer-inline') $Res call({Object? device = null,Object? tags = null,Object? summary = null,}) {
  return _then(_CalculatedDevice(
device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as Device,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<CalculatedTag>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
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
