// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculated_sensor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalculatedSensor {

 Sensor get sensor; SensorEvaluation get evaluation;
/// Create a copy of CalculatedSensor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalculatedSensorCopyWith<CalculatedSensor> get copyWith => _$CalculatedSensorCopyWithImpl<CalculatedSensor>(this as CalculatedSensor, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalculatedSensor&&(identical(other.sensor, sensor) || other.sensor == sensor)&&(identical(other.evaluation, evaluation) || other.evaluation == evaluation));
}


@override
int get hashCode => Object.hash(runtimeType,sensor,evaluation);

@override
String toString() {
  return 'CalculatedSensor(sensor: $sensor, evaluation: $evaluation)';
}


}

/// @nodoc
abstract mixin class $CalculatedSensorCopyWith<$Res>  {
  factory $CalculatedSensorCopyWith(CalculatedSensor value, $Res Function(CalculatedSensor) _then) = _$CalculatedSensorCopyWithImpl;
@useResult
$Res call({
 Sensor sensor, SensorEvaluation evaluation
});


$SensorCopyWith<$Res> get sensor;$SensorEvaluationCopyWith<$Res> get evaluation;

}
/// @nodoc
class _$CalculatedSensorCopyWithImpl<$Res>
    implements $CalculatedSensorCopyWith<$Res> {
  _$CalculatedSensorCopyWithImpl(this._self, this._then);

  final CalculatedSensor _self;
  final $Res Function(CalculatedSensor) _then;

/// Create a copy of CalculatedSensor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sensor = null,Object? evaluation = null,}) {
  return _then(_self.copyWith(
sensor: null == sensor ? _self.sensor : sensor // ignore: cast_nullable_to_non_nullable
as Sensor,evaluation: null == evaluation ? _self.evaluation : evaluation // ignore: cast_nullable_to_non_nullable
as SensorEvaluation,
  ));
}
/// Create a copy of CalculatedSensor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SensorCopyWith<$Res> get sensor {
  
  return $SensorCopyWith<$Res>(_self.sensor, (value) {
    return _then(_self.copyWith(sensor: value));
  });
}/// Create a copy of CalculatedSensor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SensorEvaluationCopyWith<$Res> get evaluation {
  
  return $SensorEvaluationCopyWith<$Res>(_self.evaluation, (value) {
    return _then(_self.copyWith(evaluation: value));
  });
}
}


/// Adds pattern-matching-related methods to [CalculatedSensor].
extension CalculatedSensorPatterns on CalculatedSensor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalculatedSensor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalculatedSensor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalculatedSensor value)  $default,){
final _that = this;
switch (_that) {
case _CalculatedSensor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalculatedSensor value)?  $default,){
final _that = this;
switch (_that) {
case _CalculatedSensor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Sensor sensor,  SensorEvaluation evaluation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalculatedSensor() when $default != null:
return $default(_that.sensor,_that.evaluation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Sensor sensor,  SensorEvaluation evaluation)  $default,) {final _that = this;
switch (_that) {
case _CalculatedSensor():
return $default(_that.sensor,_that.evaluation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Sensor sensor,  SensorEvaluation evaluation)?  $default,) {final _that = this;
switch (_that) {
case _CalculatedSensor() when $default != null:
return $default(_that.sensor,_that.evaluation);case _:
  return null;

}
}

}

/// @nodoc


class _CalculatedSensor extends CalculatedSensor {
  const _CalculatedSensor({required this.sensor, required this.evaluation}): super._();
  

@override final  Sensor sensor;
@override final  SensorEvaluation evaluation;

/// Create a copy of CalculatedSensor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalculatedSensorCopyWith<_CalculatedSensor> get copyWith => __$CalculatedSensorCopyWithImpl<_CalculatedSensor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalculatedSensor&&(identical(other.sensor, sensor) || other.sensor == sensor)&&(identical(other.evaluation, evaluation) || other.evaluation == evaluation));
}


@override
int get hashCode => Object.hash(runtimeType,sensor,evaluation);

@override
String toString() {
  return 'CalculatedSensor(sensor: $sensor, evaluation: $evaluation)';
}


}

/// @nodoc
abstract mixin class _$CalculatedSensorCopyWith<$Res> implements $CalculatedSensorCopyWith<$Res> {
  factory _$CalculatedSensorCopyWith(_CalculatedSensor value, $Res Function(_CalculatedSensor) _then) = __$CalculatedSensorCopyWithImpl;
@override @useResult
$Res call({
 Sensor sensor, SensorEvaluation evaluation
});


@override $SensorCopyWith<$Res> get sensor;@override $SensorEvaluationCopyWith<$Res> get evaluation;

}
/// @nodoc
class __$CalculatedSensorCopyWithImpl<$Res>
    implements _$CalculatedSensorCopyWith<$Res> {
  __$CalculatedSensorCopyWithImpl(this._self, this._then);

  final _CalculatedSensor _self;
  final $Res Function(_CalculatedSensor) _then;

/// Create a copy of CalculatedSensor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sensor = null,Object? evaluation = null,}) {
  return _then(_CalculatedSensor(
sensor: null == sensor ? _self.sensor : sensor // ignore: cast_nullable_to_non_nullable
as Sensor,evaluation: null == evaluation ? _self.evaluation : evaluation // ignore: cast_nullable_to_non_nullable
as SensorEvaluation,
  ));
}

/// Create a copy of CalculatedSensor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SensorCopyWith<$Res> get sensor {
  
  return $SensorCopyWith<$Res>(_self.sensor, (value) {
    return _then(_self.copyWith(sensor: value));
  });
}/// Create a copy of CalculatedSensor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SensorEvaluationCopyWith<$Res> get evaluation {
  
  return $SensorEvaluationCopyWith<$Res>(_self.evaluation, (value) {
    return _then(_self.copyWith(evaluation: value));
  });
}
}

// dart format on
