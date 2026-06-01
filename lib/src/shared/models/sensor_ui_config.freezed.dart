// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_ui_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SensorUiConfig {

 String? get color; String? get icon; double? get minCritical; double? get minWarning; double? get maxWarning; double? get maxCritical;// Новые поля для DIGITAL
 double? get digitalWarning; double? get digitalCritical; String? get labelZero; String? get labelOne;
/// Create a copy of SensorUiConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SensorUiConfigCopyWith<SensorUiConfig> get copyWith => _$SensorUiConfigCopyWithImpl<SensorUiConfig>(this as SensorUiConfig, _$identity);

  /// Serializes this SensorUiConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorUiConfig&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.minCritical, minCritical) || other.minCritical == minCritical)&&(identical(other.minWarning, minWarning) || other.minWarning == minWarning)&&(identical(other.maxWarning, maxWarning) || other.maxWarning == maxWarning)&&(identical(other.maxCritical, maxCritical) || other.maxCritical == maxCritical)&&(identical(other.digitalWarning, digitalWarning) || other.digitalWarning == digitalWarning)&&(identical(other.digitalCritical, digitalCritical) || other.digitalCritical == digitalCritical)&&(identical(other.labelZero, labelZero) || other.labelZero == labelZero)&&(identical(other.labelOne, labelOne) || other.labelOne == labelOne));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,icon,minCritical,minWarning,maxWarning,maxCritical,digitalWarning,digitalCritical,labelZero,labelOne);

@override
String toString() {
  return 'SensorUiConfig(color: $color, icon: $icon, minCritical: $minCritical, minWarning: $minWarning, maxWarning: $maxWarning, maxCritical: $maxCritical, digitalWarning: $digitalWarning, digitalCritical: $digitalCritical, labelZero: $labelZero, labelOne: $labelOne)';
}


}

/// @nodoc
abstract mixin class $SensorUiConfigCopyWith<$Res>  {
  factory $SensorUiConfigCopyWith(SensorUiConfig value, $Res Function(SensorUiConfig) _then) = _$SensorUiConfigCopyWithImpl;
@useResult
$Res call({
 String? color, String? icon, double? minCritical, double? minWarning, double? maxWarning, double? maxCritical, double? digitalWarning, double? digitalCritical, String? labelZero, String? labelOne
});




}
/// @nodoc
class _$SensorUiConfigCopyWithImpl<$Res>
    implements $SensorUiConfigCopyWith<$Res> {
  _$SensorUiConfigCopyWithImpl(this._self, this._then);

  final SensorUiConfig _self;
  final $Res Function(SensorUiConfig) _then;

/// Create a copy of SensorUiConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? color = freezed,Object? icon = freezed,Object? minCritical = freezed,Object? minWarning = freezed,Object? maxWarning = freezed,Object? maxCritical = freezed,Object? digitalWarning = freezed,Object? digitalCritical = freezed,Object? labelZero = freezed,Object? labelOne = freezed,}) {
  return _then(_self.copyWith(
color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,minCritical: freezed == minCritical ? _self.minCritical : minCritical // ignore: cast_nullable_to_non_nullable
as double?,minWarning: freezed == minWarning ? _self.minWarning : minWarning // ignore: cast_nullable_to_non_nullable
as double?,maxWarning: freezed == maxWarning ? _self.maxWarning : maxWarning // ignore: cast_nullable_to_non_nullable
as double?,maxCritical: freezed == maxCritical ? _self.maxCritical : maxCritical // ignore: cast_nullable_to_non_nullable
as double?,digitalWarning: freezed == digitalWarning ? _self.digitalWarning : digitalWarning // ignore: cast_nullable_to_non_nullable
as double?,digitalCritical: freezed == digitalCritical ? _self.digitalCritical : digitalCritical // ignore: cast_nullable_to_non_nullable
as double?,labelZero: freezed == labelZero ? _self.labelZero : labelZero // ignore: cast_nullable_to_non_nullable
as String?,labelOne: freezed == labelOne ? _self.labelOne : labelOne // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SensorUiConfig].
extension SensorUiConfigPatterns on SensorUiConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SensorUiConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SensorUiConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SensorUiConfig value)  $default,){
final _that = this;
switch (_that) {
case _SensorUiConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SensorUiConfig value)?  $default,){
final _that = this;
switch (_that) {
case _SensorUiConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? color,  String? icon,  double? minCritical,  double? minWarning,  double? maxWarning,  double? maxCritical,  double? digitalWarning,  double? digitalCritical,  String? labelZero,  String? labelOne)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SensorUiConfig() when $default != null:
return $default(_that.color,_that.icon,_that.minCritical,_that.minWarning,_that.maxWarning,_that.maxCritical,_that.digitalWarning,_that.digitalCritical,_that.labelZero,_that.labelOne);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? color,  String? icon,  double? minCritical,  double? minWarning,  double? maxWarning,  double? maxCritical,  double? digitalWarning,  double? digitalCritical,  String? labelZero,  String? labelOne)  $default,) {final _that = this;
switch (_that) {
case _SensorUiConfig():
return $default(_that.color,_that.icon,_that.minCritical,_that.minWarning,_that.maxWarning,_that.maxCritical,_that.digitalWarning,_that.digitalCritical,_that.labelZero,_that.labelOne);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? color,  String? icon,  double? minCritical,  double? minWarning,  double? maxWarning,  double? maxCritical,  double? digitalWarning,  double? digitalCritical,  String? labelZero,  String? labelOne)?  $default,) {final _that = this;
switch (_that) {
case _SensorUiConfig() when $default != null:
return $default(_that.color,_that.icon,_that.minCritical,_that.minWarning,_that.maxWarning,_that.maxCritical,_that.digitalWarning,_that.digitalCritical,_that.labelZero,_that.labelOne);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SensorUiConfig extends SensorUiConfig {
  const _SensorUiConfig({this.color, this.icon, this.minCritical, this.minWarning, this.maxWarning, this.maxCritical, this.digitalWarning, this.digitalCritical, this.labelZero, this.labelOne}): super._();
  factory _SensorUiConfig.fromJson(Map<String, dynamic> json) => _$SensorUiConfigFromJson(json);

@override final  String? color;
@override final  String? icon;
@override final  double? minCritical;
@override final  double? minWarning;
@override final  double? maxWarning;
@override final  double? maxCritical;
// Новые поля для DIGITAL
@override final  double? digitalWarning;
@override final  double? digitalCritical;
@override final  String? labelZero;
@override final  String? labelOne;

/// Create a copy of SensorUiConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SensorUiConfigCopyWith<_SensorUiConfig> get copyWith => __$SensorUiConfigCopyWithImpl<_SensorUiConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SensorUiConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SensorUiConfig&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.minCritical, minCritical) || other.minCritical == minCritical)&&(identical(other.minWarning, minWarning) || other.minWarning == minWarning)&&(identical(other.maxWarning, maxWarning) || other.maxWarning == maxWarning)&&(identical(other.maxCritical, maxCritical) || other.maxCritical == maxCritical)&&(identical(other.digitalWarning, digitalWarning) || other.digitalWarning == digitalWarning)&&(identical(other.digitalCritical, digitalCritical) || other.digitalCritical == digitalCritical)&&(identical(other.labelZero, labelZero) || other.labelZero == labelZero)&&(identical(other.labelOne, labelOne) || other.labelOne == labelOne));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,icon,minCritical,minWarning,maxWarning,maxCritical,digitalWarning,digitalCritical,labelZero,labelOne);

@override
String toString() {
  return 'SensorUiConfig(color: $color, icon: $icon, minCritical: $minCritical, minWarning: $minWarning, maxWarning: $maxWarning, maxCritical: $maxCritical, digitalWarning: $digitalWarning, digitalCritical: $digitalCritical, labelZero: $labelZero, labelOne: $labelOne)';
}


}

/// @nodoc
abstract mixin class _$SensorUiConfigCopyWith<$Res> implements $SensorUiConfigCopyWith<$Res> {
  factory _$SensorUiConfigCopyWith(_SensorUiConfig value, $Res Function(_SensorUiConfig) _then) = __$SensorUiConfigCopyWithImpl;
@override @useResult
$Res call({
 String? color, String? icon, double? minCritical, double? minWarning, double? maxWarning, double? maxCritical, double? digitalWarning, double? digitalCritical, String? labelZero, String? labelOne
});




}
/// @nodoc
class __$SensorUiConfigCopyWithImpl<$Res>
    implements _$SensorUiConfigCopyWith<$Res> {
  __$SensorUiConfigCopyWithImpl(this._self, this._then);

  final _SensorUiConfig _self;
  final $Res Function(_SensorUiConfig) _then;

/// Create a copy of SensorUiConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? color = freezed,Object? icon = freezed,Object? minCritical = freezed,Object? minWarning = freezed,Object? maxWarning = freezed,Object? maxCritical = freezed,Object? digitalWarning = freezed,Object? digitalCritical = freezed,Object? labelZero = freezed,Object? labelOne = freezed,}) {
  return _then(_SensorUiConfig(
color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,minCritical: freezed == minCritical ? _self.minCritical : minCritical // ignore: cast_nullable_to_non_nullable
as double?,minWarning: freezed == minWarning ? _self.minWarning : minWarning // ignore: cast_nullable_to_non_nullable
as double?,maxWarning: freezed == maxWarning ? _self.maxWarning : maxWarning // ignore: cast_nullable_to_non_nullable
as double?,maxCritical: freezed == maxCritical ? _self.maxCritical : maxCritical // ignore: cast_nullable_to_non_nullable
as double?,digitalWarning: freezed == digitalWarning ? _self.digitalWarning : digitalWarning // ignore: cast_nullable_to_non_nullable
as double?,digitalCritical: freezed == digitalCritical ? _self.digitalCritical : digitalCritical // ignore: cast_nullable_to_non_nullable
as double?,labelZero: freezed == labelZero ? _self.labelZero : labelZero // ignore: cast_nullable_to_non_nullable
as String?,labelOne: freezed == labelOne ? _self.labelOne : labelOne // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
