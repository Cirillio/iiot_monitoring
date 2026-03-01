// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceSummary {

 int get normalCount; int get warningCount; int get criticalCount; int get offlineCount; int get noConfigCount;
/// Create a copy of DeviceSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceSummaryCopyWith<DeviceSummary> get copyWith => _$DeviceSummaryCopyWithImpl<DeviceSummary>(this as DeviceSummary, _$identity);

  /// Serializes this DeviceSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceSummary&&(identical(other.normalCount, normalCount) || other.normalCount == normalCount)&&(identical(other.warningCount, warningCount) || other.warningCount == warningCount)&&(identical(other.criticalCount, criticalCount) || other.criticalCount == criticalCount)&&(identical(other.offlineCount, offlineCount) || other.offlineCount == offlineCount)&&(identical(other.noConfigCount, noConfigCount) || other.noConfigCount == noConfigCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,normalCount,warningCount,criticalCount,offlineCount,noConfigCount);

@override
String toString() {
  return 'DeviceSummary(normalCount: $normalCount, warningCount: $warningCount, criticalCount: $criticalCount, offlineCount: $offlineCount, noConfigCount: $noConfigCount)';
}


}

/// @nodoc
abstract mixin class $DeviceSummaryCopyWith<$Res>  {
  factory $DeviceSummaryCopyWith(DeviceSummary value, $Res Function(DeviceSummary) _then) = _$DeviceSummaryCopyWithImpl;
@useResult
$Res call({
 int normalCount, int warningCount, int criticalCount, int offlineCount, int noConfigCount
});




}
/// @nodoc
class _$DeviceSummaryCopyWithImpl<$Res>
    implements $DeviceSummaryCopyWith<$Res> {
  _$DeviceSummaryCopyWithImpl(this._self, this._then);

  final DeviceSummary _self;
  final $Res Function(DeviceSummary) _then;

/// Create a copy of DeviceSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? normalCount = null,Object? warningCount = null,Object? criticalCount = null,Object? offlineCount = null,Object? noConfigCount = null,}) {
  return _then(_self.copyWith(
normalCount: null == normalCount ? _self.normalCount : normalCount // ignore: cast_nullable_to_non_nullable
as int,warningCount: null == warningCount ? _self.warningCount : warningCount // ignore: cast_nullable_to_non_nullable
as int,criticalCount: null == criticalCount ? _self.criticalCount : criticalCount // ignore: cast_nullable_to_non_nullable
as int,offlineCount: null == offlineCount ? _self.offlineCount : offlineCount // ignore: cast_nullable_to_non_nullable
as int,noConfigCount: null == noConfigCount ? _self.noConfigCount : noConfigCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceSummary].
extension DeviceSummaryPatterns on DeviceSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceSummary value)  $default,){
final _that = this;
switch (_that) {
case _DeviceSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceSummary value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int normalCount,  int warningCount,  int criticalCount,  int offlineCount,  int noConfigCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceSummary() when $default != null:
return $default(_that.normalCount,_that.warningCount,_that.criticalCount,_that.offlineCount,_that.noConfigCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int normalCount,  int warningCount,  int criticalCount,  int offlineCount,  int noConfigCount)  $default,) {final _that = this;
switch (_that) {
case _DeviceSummary():
return $default(_that.normalCount,_that.warningCount,_that.criticalCount,_that.offlineCount,_that.noConfigCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int normalCount,  int warningCount,  int criticalCount,  int offlineCount,  int noConfigCount)?  $default,) {final _that = this;
switch (_that) {
case _DeviceSummary() when $default != null:
return $default(_that.normalCount,_that.warningCount,_that.criticalCount,_that.offlineCount,_that.noConfigCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceSummary implements DeviceSummary {
  const _DeviceSummary({this.normalCount = 0, this.warningCount = 0, this.criticalCount = 0, this.offlineCount = 0, this.noConfigCount = 0});
  factory _DeviceSummary.fromJson(Map<String, dynamic> json) => _$DeviceSummaryFromJson(json);

@override@JsonKey() final  int normalCount;
@override@JsonKey() final  int warningCount;
@override@JsonKey() final  int criticalCount;
@override@JsonKey() final  int offlineCount;
@override@JsonKey() final  int noConfigCount;

/// Create a copy of DeviceSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceSummaryCopyWith<_DeviceSummary> get copyWith => __$DeviceSummaryCopyWithImpl<_DeviceSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceSummary&&(identical(other.normalCount, normalCount) || other.normalCount == normalCount)&&(identical(other.warningCount, warningCount) || other.warningCount == warningCount)&&(identical(other.criticalCount, criticalCount) || other.criticalCount == criticalCount)&&(identical(other.offlineCount, offlineCount) || other.offlineCount == offlineCount)&&(identical(other.noConfigCount, noConfigCount) || other.noConfigCount == noConfigCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,normalCount,warningCount,criticalCount,offlineCount,noConfigCount);

@override
String toString() {
  return 'DeviceSummary(normalCount: $normalCount, warningCount: $warningCount, criticalCount: $criticalCount, offlineCount: $offlineCount, noConfigCount: $noConfigCount)';
}


}

/// @nodoc
abstract mixin class _$DeviceSummaryCopyWith<$Res> implements $DeviceSummaryCopyWith<$Res> {
  factory _$DeviceSummaryCopyWith(_DeviceSummary value, $Res Function(_DeviceSummary) _then) = __$DeviceSummaryCopyWithImpl;
@override @useResult
$Res call({
 int normalCount, int warningCount, int criticalCount, int offlineCount, int noConfigCount
});




}
/// @nodoc
class __$DeviceSummaryCopyWithImpl<$Res>
    implements _$DeviceSummaryCopyWith<$Res> {
  __$DeviceSummaryCopyWithImpl(this._self, this._then);

  final _DeviceSummary _self;
  final $Res Function(_DeviceSummary) _then;

/// Create a copy of DeviceSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? normalCount = null,Object? warningCount = null,Object? criticalCount = null,Object? offlineCount = null,Object? noConfigCount = null,}) {
  return _then(_DeviceSummary(
normalCount: null == normalCount ? _self.normalCount : normalCount // ignore: cast_nullable_to_non_nullable
as int,warningCount: null == warningCount ? _self.warningCount : warningCount // ignore: cast_nullable_to_non_nullable
as int,criticalCount: null == criticalCount ? _self.criticalCount : criticalCount // ignore: cast_nullable_to_non_nullable
as int,offlineCount: null == offlineCount ? _self.offlineCount : offlineCount // ignore: cast_nullable_to_non_nullable
as int,noConfigCount: null == noConfigCount ? _self.noConfigCount : noConfigCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
