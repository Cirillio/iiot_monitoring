// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metric.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Metric {

@JsonKey(name: 'SensorId') int get sensorId;@JsonKey(name: 'Value') double get value;@JsonKey(name: 'Time') DateTime get time;@JsonKey(name: 'RawValue') double? get rawValue;
/// Create a copy of Metric
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetricCopyWith<Metric> get copyWith => _$MetricCopyWithImpl<Metric>(this as Metric, _$identity);

  /// Serializes this Metric to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Metric&&(identical(other.sensorId, sensorId) || other.sensorId == sensorId)&&(identical(other.value, value) || other.value == value)&&(identical(other.time, time) || other.time == time)&&(identical(other.rawValue, rawValue) || other.rawValue == rawValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sensorId,value,time,rawValue);

@override
String toString() {
  return 'Metric(sensorId: $sensorId, value: $value, time: $time, rawValue: $rawValue)';
}


}

/// @nodoc
abstract mixin class $MetricCopyWith<$Res>  {
  factory $MetricCopyWith(Metric value, $Res Function(Metric) _then) = _$MetricCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'SensorId') int sensorId,@JsonKey(name: 'Value') double value,@JsonKey(name: 'Time') DateTime time,@JsonKey(name: 'RawValue') double? rawValue
});




}
/// @nodoc
class _$MetricCopyWithImpl<$Res>
    implements $MetricCopyWith<$Res> {
  _$MetricCopyWithImpl(this._self, this._then);

  final Metric _self;
  final $Res Function(Metric) _then;

/// Create a copy of Metric
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sensorId = null,Object? value = null,Object? time = null,Object? rawValue = freezed,}) {
  return _then(_self.copyWith(
sensorId: null == sensorId ? _self.sensorId : sensorId // ignore: cast_nullable_to_non_nullable
as int,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,rawValue: freezed == rawValue ? _self.rawValue : rawValue // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [Metric].
extension MetricPatterns on Metric {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Metric value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Metric() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Metric value)  $default,){
final _that = this;
switch (_that) {
case _Metric():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Metric value)?  $default,){
final _that = this;
switch (_that) {
case _Metric() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'SensorId')  int sensorId, @JsonKey(name: 'Value')  double value, @JsonKey(name: 'Time')  DateTime time, @JsonKey(name: 'RawValue')  double? rawValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Metric() when $default != null:
return $default(_that.sensorId,_that.value,_that.time,_that.rawValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'SensorId')  int sensorId, @JsonKey(name: 'Value')  double value, @JsonKey(name: 'Time')  DateTime time, @JsonKey(name: 'RawValue')  double? rawValue)  $default,) {final _that = this;
switch (_that) {
case _Metric():
return $default(_that.sensorId,_that.value,_that.time,_that.rawValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'SensorId')  int sensorId, @JsonKey(name: 'Value')  double value, @JsonKey(name: 'Time')  DateTime time, @JsonKey(name: 'RawValue')  double? rawValue)?  $default,) {final _that = this;
switch (_that) {
case _Metric() when $default != null:
return $default(_that.sensorId,_that.value,_that.time,_that.rawValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Metric implements Metric {
  const _Metric({@JsonKey(name: 'SensorId') required this.sensorId, @JsonKey(name: 'Value') required this.value, @JsonKey(name: 'Time') required this.time, @JsonKey(name: 'RawValue') this.rawValue});
  factory _Metric.fromJson(Map<String, dynamic> json) => _$MetricFromJson(json);

@override@JsonKey(name: 'SensorId') final  int sensorId;
@override@JsonKey(name: 'Value') final  double value;
@override@JsonKey(name: 'Time') final  DateTime time;
@override@JsonKey(name: 'RawValue') final  double? rawValue;

/// Create a copy of Metric
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetricCopyWith<_Metric> get copyWith => __$MetricCopyWithImpl<_Metric>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetricToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Metric&&(identical(other.sensorId, sensorId) || other.sensorId == sensorId)&&(identical(other.value, value) || other.value == value)&&(identical(other.time, time) || other.time == time)&&(identical(other.rawValue, rawValue) || other.rawValue == rawValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sensorId,value,time,rawValue);

@override
String toString() {
  return 'Metric(sensorId: $sensorId, value: $value, time: $time, rawValue: $rawValue)';
}


}

/// @nodoc
abstract mixin class _$MetricCopyWith<$Res> implements $MetricCopyWith<$Res> {
  factory _$MetricCopyWith(_Metric value, $Res Function(_Metric) _then) = __$MetricCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'SensorId') int sensorId,@JsonKey(name: 'Value') double value,@JsonKey(name: 'Time') DateTime time,@JsonKey(name: 'RawValue') double? rawValue
});




}
/// @nodoc
class __$MetricCopyWithImpl<$Res>
    implements _$MetricCopyWith<$Res> {
  __$MetricCopyWithImpl(this._self, this._then);

  final _Metric _self;
  final $Res Function(_Metric) _then;

/// Create a copy of Metric
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sensorId = null,Object? value = null,Object? time = null,Object? rawValue = freezed,}) {
  return _then(_Metric(
sensorId: null == sensorId ? _self.sensorId : sensorId // ignore: cast_nullable_to_non_nullable
as int,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,rawValue: freezed == rawValue ? _self.rawValue : rawValue // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
