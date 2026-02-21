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

 String? get color; String? get icon; int? get mainPagePosition; int? get graphPosition; int? get tablePosition; int? get alarmPosition; int? get historyPosition; double? get minCritical; double? get minWarning; double? get maxWarning; double? get maxCritical;
/// Create a copy of SensorUiConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SensorUiConfigCopyWith<SensorUiConfig> get copyWith => _$SensorUiConfigCopyWithImpl<SensorUiConfig>(this as SensorUiConfig, _$identity);

  /// Serializes this SensorUiConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorUiConfig&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.mainPagePosition, mainPagePosition) || other.mainPagePosition == mainPagePosition)&&(identical(other.graphPosition, graphPosition) || other.graphPosition == graphPosition)&&(identical(other.tablePosition, tablePosition) || other.tablePosition == tablePosition)&&(identical(other.alarmPosition, alarmPosition) || other.alarmPosition == alarmPosition)&&(identical(other.historyPosition, historyPosition) || other.historyPosition == historyPosition)&&(identical(other.minCritical, minCritical) || other.minCritical == minCritical)&&(identical(other.minWarning, minWarning) || other.minWarning == minWarning)&&(identical(other.maxWarning, maxWarning) || other.maxWarning == maxWarning)&&(identical(other.maxCritical, maxCritical) || other.maxCritical == maxCritical));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,icon,mainPagePosition,graphPosition,tablePosition,alarmPosition,historyPosition,minCritical,minWarning,maxWarning,maxCritical);

@override
String toString() {
  return 'SensorUiConfig(color: $color, icon: $icon, mainPagePosition: $mainPagePosition, graphPosition: $graphPosition, tablePosition: $tablePosition, alarmPosition: $alarmPosition, historyPosition: $historyPosition, minCritical: $minCritical, minWarning: $minWarning, maxWarning: $maxWarning, maxCritical: $maxCritical)';
}


}

/// @nodoc
abstract mixin class $SensorUiConfigCopyWith<$Res>  {
  factory $SensorUiConfigCopyWith(SensorUiConfig value, $Res Function(SensorUiConfig) _then) = _$SensorUiConfigCopyWithImpl;
@useResult
$Res call({
 String? color, String? icon, int? mainPagePosition, int? graphPosition, int? tablePosition, int? alarmPosition, int? historyPosition, double? minCritical, double? minWarning, double? maxWarning, double? maxCritical
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
@pragma('vm:prefer-inline') @override $Res call({Object? color = freezed,Object? icon = freezed,Object? mainPagePosition = freezed,Object? graphPosition = freezed,Object? tablePosition = freezed,Object? alarmPosition = freezed,Object? historyPosition = freezed,Object? minCritical = freezed,Object? minWarning = freezed,Object? maxWarning = freezed,Object? maxCritical = freezed,}) {
  return _then(_self.copyWith(
color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,mainPagePosition: freezed == mainPagePosition ? _self.mainPagePosition : mainPagePosition // ignore: cast_nullable_to_non_nullable
as int?,graphPosition: freezed == graphPosition ? _self.graphPosition : graphPosition // ignore: cast_nullable_to_non_nullable
as int?,tablePosition: freezed == tablePosition ? _self.tablePosition : tablePosition // ignore: cast_nullable_to_non_nullable
as int?,alarmPosition: freezed == alarmPosition ? _self.alarmPosition : alarmPosition // ignore: cast_nullable_to_non_nullable
as int?,historyPosition: freezed == historyPosition ? _self.historyPosition : historyPosition // ignore: cast_nullable_to_non_nullable
as int?,minCritical: freezed == minCritical ? _self.minCritical : minCritical // ignore: cast_nullable_to_non_nullable
as double?,minWarning: freezed == minWarning ? _self.minWarning : minWarning // ignore: cast_nullable_to_non_nullable
as double?,maxWarning: freezed == maxWarning ? _self.maxWarning : maxWarning // ignore: cast_nullable_to_non_nullable
as double?,maxCritical: freezed == maxCritical ? _self.maxCritical : maxCritical // ignore: cast_nullable_to_non_nullable
as double?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? color,  String? icon,  int? mainPagePosition,  int? graphPosition,  int? tablePosition,  int? alarmPosition,  int? historyPosition,  double? minCritical,  double? minWarning,  double? maxWarning,  double? maxCritical)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SensorUiConfig() when $default != null:
return $default(_that.color,_that.icon,_that.mainPagePosition,_that.graphPosition,_that.tablePosition,_that.alarmPosition,_that.historyPosition,_that.minCritical,_that.minWarning,_that.maxWarning,_that.maxCritical);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? color,  String? icon,  int? mainPagePosition,  int? graphPosition,  int? tablePosition,  int? alarmPosition,  int? historyPosition,  double? minCritical,  double? minWarning,  double? maxWarning,  double? maxCritical)  $default,) {final _that = this;
switch (_that) {
case _SensorUiConfig():
return $default(_that.color,_that.icon,_that.mainPagePosition,_that.graphPosition,_that.tablePosition,_that.alarmPosition,_that.historyPosition,_that.minCritical,_that.minWarning,_that.maxWarning,_that.maxCritical);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? color,  String? icon,  int? mainPagePosition,  int? graphPosition,  int? tablePosition,  int? alarmPosition,  int? historyPosition,  double? minCritical,  double? minWarning,  double? maxWarning,  double? maxCritical)?  $default,) {final _that = this;
switch (_that) {
case _SensorUiConfig() when $default != null:
return $default(_that.color,_that.icon,_that.mainPagePosition,_that.graphPosition,_that.tablePosition,_that.alarmPosition,_that.historyPosition,_that.minCritical,_that.minWarning,_that.maxWarning,_that.maxCritical);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SensorUiConfig implements SensorUiConfig {
  const _SensorUiConfig({this.color, this.icon, this.mainPagePosition, this.graphPosition, this.tablePosition, this.alarmPosition, this.historyPosition, this.minCritical, this.minWarning, this.maxWarning, this.maxCritical});
  factory _SensorUiConfig.fromJson(Map<String, dynamic> json) => _$SensorUiConfigFromJson(json);

@override final  String? color;
@override final  String? icon;
@override final  int? mainPagePosition;
@override final  int? graphPosition;
@override final  int? tablePosition;
@override final  int? alarmPosition;
@override final  int? historyPosition;
@override final  double? minCritical;
@override final  double? minWarning;
@override final  double? maxWarning;
@override final  double? maxCritical;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SensorUiConfig&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.mainPagePosition, mainPagePosition) || other.mainPagePosition == mainPagePosition)&&(identical(other.graphPosition, graphPosition) || other.graphPosition == graphPosition)&&(identical(other.tablePosition, tablePosition) || other.tablePosition == tablePosition)&&(identical(other.alarmPosition, alarmPosition) || other.alarmPosition == alarmPosition)&&(identical(other.historyPosition, historyPosition) || other.historyPosition == historyPosition)&&(identical(other.minCritical, minCritical) || other.minCritical == minCritical)&&(identical(other.minWarning, minWarning) || other.minWarning == minWarning)&&(identical(other.maxWarning, maxWarning) || other.maxWarning == maxWarning)&&(identical(other.maxCritical, maxCritical) || other.maxCritical == maxCritical));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,icon,mainPagePosition,graphPosition,tablePosition,alarmPosition,historyPosition,minCritical,minWarning,maxWarning,maxCritical);

@override
String toString() {
  return 'SensorUiConfig(color: $color, icon: $icon, mainPagePosition: $mainPagePosition, graphPosition: $graphPosition, tablePosition: $tablePosition, alarmPosition: $alarmPosition, historyPosition: $historyPosition, minCritical: $minCritical, minWarning: $minWarning, maxWarning: $maxWarning, maxCritical: $maxCritical)';
}


}

/// @nodoc
abstract mixin class _$SensorUiConfigCopyWith<$Res> implements $SensorUiConfigCopyWith<$Res> {
  factory _$SensorUiConfigCopyWith(_SensorUiConfig value, $Res Function(_SensorUiConfig) _then) = __$SensorUiConfigCopyWithImpl;
@override @useResult
$Res call({
 String? color, String? icon, int? mainPagePosition, int? graphPosition, int? tablePosition, int? alarmPosition, int? historyPosition, double? minCritical, double? minWarning, double? maxWarning, double? maxCritical
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
@override @pragma('vm:prefer-inline') $Res call({Object? color = freezed,Object? icon = freezed,Object? mainPagePosition = freezed,Object? graphPosition = freezed,Object? tablePosition = freezed,Object? alarmPosition = freezed,Object? historyPosition = freezed,Object? minCritical = freezed,Object? minWarning = freezed,Object? maxWarning = freezed,Object? maxCritical = freezed,}) {
  return _then(_SensorUiConfig(
color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,mainPagePosition: freezed == mainPagePosition ? _self.mainPagePosition : mainPagePosition // ignore: cast_nullable_to_non_nullable
as int?,graphPosition: freezed == graphPosition ? _self.graphPosition : graphPosition // ignore: cast_nullable_to_non_nullable
as int?,tablePosition: freezed == tablePosition ? _self.tablePosition : tablePosition // ignore: cast_nullable_to_non_nullable
as int?,alarmPosition: freezed == alarmPosition ? _self.alarmPosition : alarmPosition // ignore: cast_nullable_to_non_nullable
as int?,historyPosition: freezed == historyPosition ? _self.historyPosition : historyPosition // ignore: cast_nullable_to_non_nullable
as int?,minCritical: freezed == minCritical ? _self.minCritical : minCritical // ignore: cast_nullable_to_non_nullable
as double?,minWarning: freezed == minWarning ? _self.minWarning : minWarning // ignore: cast_nullable_to_non_nullable
as double?,maxWarning: freezed == maxWarning ? _self.maxWarning : maxWarning // ignore: cast_nullable_to_non_nullable
as double?,maxCritical: freezed == maxCritical ? _self.maxCritical : maxCritical // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
