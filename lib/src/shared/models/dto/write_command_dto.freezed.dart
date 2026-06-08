// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'write_command_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WriteCommandDto {

 int get tagId; double get value; String get operatorId;
/// Create a copy of WriteCommandDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WriteCommandDtoCopyWith<WriteCommandDto> get copyWith => _$WriteCommandDtoCopyWithImpl<WriteCommandDto>(this as WriteCommandDto, _$identity);

  /// Serializes this WriteCommandDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WriteCommandDto&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.value, value) || other.value == value)&&(identical(other.operatorId, operatorId) || other.operatorId == operatorId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tagId,value,operatorId);

@override
String toString() {
  return 'WriteCommandDto(tagId: $tagId, value: $value, operatorId: $operatorId)';
}


}

/// @nodoc
abstract mixin class $WriteCommandDtoCopyWith<$Res>  {
  factory $WriteCommandDtoCopyWith(WriteCommandDto value, $Res Function(WriteCommandDto) _then) = _$WriteCommandDtoCopyWithImpl;
@useResult
$Res call({
 int tagId, double value, String operatorId
});




}
/// @nodoc
class _$WriteCommandDtoCopyWithImpl<$Res>
    implements $WriteCommandDtoCopyWith<$Res> {
  _$WriteCommandDtoCopyWithImpl(this._self, this._then);

  final WriteCommandDto _self;
  final $Res Function(WriteCommandDto) _then;

/// Create a copy of WriteCommandDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tagId = null,Object? value = null,Object? operatorId = null,}) {
  return _then(_self.copyWith(
tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as int,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,operatorId: null == operatorId ? _self.operatorId : operatorId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WriteCommandDto].
extension WriteCommandDtoPatterns on WriteCommandDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WriteCommandDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WriteCommandDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WriteCommandDto value)  $default,){
final _that = this;
switch (_that) {
case _WriteCommandDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WriteCommandDto value)?  $default,){
final _that = this;
switch (_that) {
case _WriteCommandDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tagId,  double value,  String operatorId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WriteCommandDto() when $default != null:
return $default(_that.tagId,_that.value,_that.operatorId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tagId,  double value,  String operatorId)  $default,) {final _that = this;
switch (_that) {
case _WriteCommandDto():
return $default(_that.tagId,_that.value,_that.operatorId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tagId,  double value,  String operatorId)?  $default,) {final _that = this;
switch (_that) {
case _WriteCommandDto() when $default != null:
return $default(_that.tagId,_that.value,_that.operatorId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WriteCommandDto implements WriteCommandDto {
  const _WriteCommandDto({required this.tagId, required this.value, required this.operatorId});
  factory _WriteCommandDto.fromJson(Map<String, dynamic> json) => _$WriteCommandDtoFromJson(json);

@override final  int tagId;
@override final  double value;
@override final  String operatorId;

/// Create a copy of WriteCommandDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WriteCommandDtoCopyWith<_WriteCommandDto> get copyWith => __$WriteCommandDtoCopyWithImpl<_WriteCommandDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WriteCommandDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WriteCommandDto&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.value, value) || other.value == value)&&(identical(other.operatorId, operatorId) || other.operatorId == operatorId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tagId,value,operatorId);

@override
String toString() {
  return 'WriteCommandDto(tagId: $tagId, value: $value, operatorId: $operatorId)';
}


}

/// @nodoc
abstract mixin class _$WriteCommandDtoCopyWith<$Res> implements $WriteCommandDtoCopyWith<$Res> {
  factory _$WriteCommandDtoCopyWith(_WriteCommandDto value, $Res Function(_WriteCommandDto) _then) = __$WriteCommandDtoCopyWithImpl;
@override @useResult
$Res call({
 int tagId, double value, String operatorId
});




}
/// @nodoc
class __$WriteCommandDtoCopyWithImpl<$Res>
    implements _$WriteCommandDtoCopyWith<$Res> {
  __$WriteCommandDtoCopyWithImpl(this._self, this._then);

  final _WriteCommandDto _self;
  final $Res Function(_WriteCommandDto) _then;

/// Create a copy of WriteCommandDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tagId = null,Object? value = null,Object? operatorId = null,}) {
  return _then(_WriteCommandDto(
tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as int,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,operatorId: null == operatorId ? _self.operatorId : operatorId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
