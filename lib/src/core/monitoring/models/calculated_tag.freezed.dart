// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculated_tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalculatedTag {

 Tag get tag; TagEvaluation get evaluation;
/// Create a copy of CalculatedTag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalculatedTagCopyWith<CalculatedTag> get copyWith => _$CalculatedTagCopyWithImpl<CalculatedTag>(this as CalculatedTag, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalculatedTag&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.evaluation, evaluation) || other.evaluation == evaluation));
}


@override
int get hashCode => Object.hash(runtimeType,tag,evaluation);

@override
String toString() {
  return 'CalculatedTag(tag: $tag, evaluation: $evaluation)';
}


}

/// @nodoc
abstract mixin class $CalculatedTagCopyWith<$Res>  {
  factory $CalculatedTagCopyWith(CalculatedTag value, $Res Function(CalculatedTag) _then) = _$CalculatedTagCopyWithImpl;
@useResult
$Res call({
 Tag tag, TagEvaluation evaluation
});


$TagCopyWith<$Res> get tag;$TagEvaluationCopyWith<$Res> get evaluation;

}
/// @nodoc
class _$CalculatedTagCopyWithImpl<$Res>
    implements $CalculatedTagCopyWith<$Res> {
  _$CalculatedTagCopyWithImpl(this._self, this._then);

  final CalculatedTag _self;
  final $Res Function(CalculatedTag) _then;

/// Create a copy of CalculatedTag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tag = null,Object? evaluation = null,}) {
  return _then(_self.copyWith(
tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as Tag,evaluation: null == evaluation ? _self.evaluation : evaluation // ignore: cast_nullable_to_non_nullable
as TagEvaluation,
  ));
}
/// Create a copy of CalculatedTag
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TagCopyWith<$Res> get tag {
  
  return $TagCopyWith<$Res>(_self.tag, (value) {
    return _then(_self.copyWith(tag: value));
  });
}/// Create a copy of CalculatedTag
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TagEvaluationCopyWith<$Res> get evaluation {
  
  return $TagEvaluationCopyWith<$Res>(_self.evaluation, (value) {
    return _then(_self.copyWith(evaluation: value));
  });
}
}


/// Adds pattern-matching-related methods to [CalculatedTag].
extension CalculatedTagPatterns on CalculatedTag {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalculatedTag value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalculatedTag() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalculatedTag value)  $default,){
final _that = this;
switch (_that) {
case _CalculatedTag():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalculatedTag value)?  $default,){
final _that = this;
switch (_that) {
case _CalculatedTag() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Tag tag,  TagEvaluation evaluation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalculatedTag() when $default != null:
return $default(_that.tag,_that.evaluation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Tag tag,  TagEvaluation evaluation)  $default,) {final _that = this;
switch (_that) {
case _CalculatedTag():
return $default(_that.tag,_that.evaluation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Tag tag,  TagEvaluation evaluation)?  $default,) {final _that = this;
switch (_that) {
case _CalculatedTag() when $default != null:
return $default(_that.tag,_that.evaluation);case _:
  return null;

}
}

}

/// @nodoc


class _CalculatedTag extends CalculatedTag {
  const _CalculatedTag({required this.tag, required this.evaluation}): super._();
  

@override final  Tag tag;
@override final  TagEvaluation evaluation;

/// Create a copy of CalculatedTag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalculatedTagCopyWith<_CalculatedTag> get copyWith => __$CalculatedTagCopyWithImpl<_CalculatedTag>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalculatedTag&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.evaluation, evaluation) || other.evaluation == evaluation));
}


@override
int get hashCode => Object.hash(runtimeType,tag,evaluation);

@override
String toString() {
  return 'CalculatedTag(tag: $tag, evaluation: $evaluation)';
}


}

/// @nodoc
abstract mixin class _$CalculatedTagCopyWith<$Res> implements $CalculatedTagCopyWith<$Res> {
  factory _$CalculatedTagCopyWith(_CalculatedTag value, $Res Function(_CalculatedTag) _then) = __$CalculatedTagCopyWithImpl;
@override @useResult
$Res call({
 Tag tag, TagEvaluation evaluation
});


@override $TagCopyWith<$Res> get tag;@override $TagEvaluationCopyWith<$Res> get evaluation;

}
/// @nodoc
class __$CalculatedTagCopyWithImpl<$Res>
    implements _$CalculatedTagCopyWith<$Res> {
  __$CalculatedTagCopyWithImpl(this._self, this._then);

  final _CalculatedTag _self;
  final $Res Function(_CalculatedTag) _then;

/// Create a copy of CalculatedTag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tag = null,Object? evaluation = null,}) {
  return _then(_CalculatedTag(
tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as Tag,evaluation: null == evaluation ? _self.evaluation : evaluation // ignore: cast_nullable_to_non_nullable
as TagEvaluation,
  ));
}

/// Create a copy of CalculatedTag
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TagCopyWith<$Res> get tag {
  
  return $TagCopyWith<$Res>(_self.tag, (value) {
    return _then(_self.copyWith(tag: value));
  });
}/// Create a copy of CalculatedTag
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TagEvaluationCopyWith<$Res> get evaluation {
  
  return $TagEvaluationCopyWith<$Res>(_self.evaluation, (value) {
    return _then(_self.copyWith(evaluation: value));
  });
}
}

// dart format on
