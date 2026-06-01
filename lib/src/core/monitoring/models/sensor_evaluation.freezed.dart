// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_evaluation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SensorEvaluation {

 SensorStatus get status; double? get value; DateTime? get alarmStartedAt; String? get message;
/// Create a copy of SensorEvaluation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SensorEvaluationCopyWith<SensorEvaluation> get copyWith => _$SensorEvaluationCopyWithImpl<SensorEvaluation>(this as SensorEvaluation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorEvaluation&&(identical(other.status, status) || other.status == status)&&(identical(other.value, value) || other.value == value)&&(identical(other.alarmStartedAt, alarmStartedAt) || other.alarmStartedAt == alarmStartedAt)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,status,value,alarmStartedAt,message);

@override
String toString() {
  return 'SensorEvaluation(status: $status, value: $value, alarmStartedAt: $alarmStartedAt, message: $message)';
}


}

/// @nodoc
abstract mixin class $SensorEvaluationCopyWith<$Res>  {
  factory $SensorEvaluationCopyWith(SensorEvaluation value, $Res Function(SensorEvaluation) _then) = _$SensorEvaluationCopyWithImpl;
@useResult
$Res call({
 SensorStatus status, double? value, DateTime? alarmStartedAt, String? message
});




}
/// @nodoc
class _$SensorEvaluationCopyWithImpl<$Res>
    implements $SensorEvaluationCopyWith<$Res> {
  _$SensorEvaluationCopyWithImpl(this._self, this._then);

  final SensorEvaluation _self;
  final $Res Function(SensorEvaluation) _then;

/// Create a copy of SensorEvaluation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? value = freezed,Object? alarmStartedAt = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SensorStatus,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,alarmStartedAt: freezed == alarmStartedAt ? _self.alarmStartedAt : alarmStartedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SensorEvaluation].
extension SensorEvaluationPatterns on SensorEvaluation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SensorEvaluation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SensorEvaluation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SensorEvaluation value)  $default,){
final _that = this;
switch (_that) {
case _SensorEvaluation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SensorEvaluation value)?  $default,){
final _that = this;
switch (_that) {
case _SensorEvaluation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SensorStatus status,  double? value,  DateTime? alarmStartedAt,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SensorEvaluation() when $default != null:
return $default(_that.status,_that.value,_that.alarmStartedAt,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SensorStatus status,  double? value,  DateTime? alarmStartedAt,  String? message)  $default,) {final _that = this;
switch (_that) {
case _SensorEvaluation():
return $default(_that.status,_that.value,_that.alarmStartedAt,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SensorStatus status,  double? value,  DateTime? alarmStartedAt,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _SensorEvaluation() when $default != null:
return $default(_that.status,_that.value,_that.alarmStartedAt,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _SensorEvaluation extends SensorEvaluation {
  const _SensorEvaluation({required this.status, this.value, this.alarmStartedAt, this.message}): super._();
  

@override final  SensorStatus status;
@override final  double? value;
@override final  DateTime? alarmStartedAt;
@override final  String? message;

/// Create a copy of SensorEvaluation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SensorEvaluationCopyWith<_SensorEvaluation> get copyWith => __$SensorEvaluationCopyWithImpl<_SensorEvaluation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SensorEvaluation&&(identical(other.status, status) || other.status == status)&&(identical(other.value, value) || other.value == value)&&(identical(other.alarmStartedAt, alarmStartedAt) || other.alarmStartedAt == alarmStartedAt)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,status,value,alarmStartedAt,message);

@override
String toString() {
  return 'SensorEvaluation(status: $status, value: $value, alarmStartedAt: $alarmStartedAt, message: $message)';
}


}

/// @nodoc
abstract mixin class _$SensorEvaluationCopyWith<$Res> implements $SensorEvaluationCopyWith<$Res> {
  factory _$SensorEvaluationCopyWith(_SensorEvaluation value, $Res Function(_SensorEvaluation) _then) = __$SensorEvaluationCopyWithImpl;
@override @useResult
$Res call({
 SensorStatus status, double? value, DateTime? alarmStartedAt, String? message
});




}
/// @nodoc
class __$SensorEvaluationCopyWithImpl<$Res>
    implements _$SensorEvaluationCopyWith<$Res> {
  __$SensorEvaluationCopyWithImpl(this._self, this._then);

  final _SensorEvaluation _self;
  final $Res Function(_SensorEvaluation) _then;

/// Create a copy of SensorEvaluation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? value = freezed,Object? alarmStartedAt = freezed,Object? message = freezed,}) {
  return _then(_SensorEvaluation(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SensorStatus,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,alarmStartedAt: freezed == alarmStartedAt ? _self.alarmStartedAt : alarmStartedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
