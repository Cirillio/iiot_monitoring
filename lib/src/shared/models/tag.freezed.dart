// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Tag {

 int get tagId; int get deviceId; int? get portNumber; String get name; String get slug; TagDataType get dataType; String get unit; TagUiConfig? get uiConfigJson; DateTime? get updatedAt;// Full Tag fields
 double? get inputMin; double? get inputMax; double? get outputMin; double? get outputMax; double? get offsetVal; int? get registerAddress; RegisterType? get registerType; int? get registerCount; ModbusEndianness? get endianness; double? get deadbandThreshold;// Realtime fields
 double? get currentValue; DateTime? get lastTagUpdated;
/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagCopyWith<Tag> get copyWith => _$TagCopyWithImpl<Tag>(this as Tag, _$identity);

  /// Serializes this Tag to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tag&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.portNumber, portNumber) || other.portNumber == portNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.dataType, dataType) || other.dataType == dataType)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.uiConfigJson, uiConfigJson) || other.uiConfigJson == uiConfigJson)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.inputMin, inputMin) || other.inputMin == inputMin)&&(identical(other.inputMax, inputMax) || other.inputMax == inputMax)&&(identical(other.outputMin, outputMin) || other.outputMin == outputMin)&&(identical(other.outputMax, outputMax) || other.outputMax == outputMax)&&(identical(other.offsetVal, offsetVal) || other.offsetVal == offsetVal)&&(identical(other.registerAddress, registerAddress) || other.registerAddress == registerAddress)&&(identical(other.registerType, registerType) || other.registerType == registerType)&&(identical(other.registerCount, registerCount) || other.registerCount == registerCount)&&(identical(other.endianness, endianness) || other.endianness == endianness)&&(identical(other.deadbandThreshold, deadbandThreshold) || other.deadbandThreshold == deadbandThreshold)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.lastTagUpdated, lastTagUpdated) || other.lastTagUpdated == lastTagUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,tagId,deviceId,portNumber,name,slug,dataType,unit,uiConfigJson,updatedAt,inputMin,inputMax,outputMin,outputMax,offsetVal,registerAddress,registerType,registerCount,endianness,deadbandThreshold,currentValue,lastTagUpdated]);

@override
String toString() {
  return 'Tag(tagId: $tagId, deviceId: $deviceId, portNumber: $portNumber, name: $name, slug: $slug, dataType: $dataType, unit: $unit, uiConfigJson: $uiConfigJson, updatedAt: $updatedAt, inputMin: $inputMin, inputMax: $inputMax, outputMin: $outputMin, outputMax: $outputMax, offsetVal: $offsetVal, registerAddress: $registerAddress, registerType: $registerType, registerCount: $registerCount, endianness: $endianness, deadbandThreshold: $deadbandThreshold, currentValue: $currentValue, lastTagUpdated: $lastTagUpdated)';
}


}

/// @nodoc
abstract mixin class $TagCopyWith<$Res>  {
  factory $TagCopyWith(Tag value, $Res Function(Tag) _then) = _$TagCopyWithImpl;
@useResult
$Res call({
 int tagId, int deviceId, int? portNumber, String name, String slug, TagDataType dataType, String unit, TagUiConfig? uiConfigJson, DateTime? updatedAt, double? inputMin, double? inputMax, double? outputMin, double? outputMax, double? offsetVal, int? registerAddress, RegisterType? registerType, int? registerCount, ModbusEndianness? endianness, double? deadbandThreshold, double? currentValue, DateTime? lastTagUpdated
});


$TagUiConfigCopyWith<$Res>? get uiConfigJson;

}
/// @nodoc
class _$TagCopyWithImpl<$Res>
    implements $TagCopyWith<$Res> {
  _$TagCopyWithImpl(this._self, this._then);

  final Tag _self;
  final $Res Function(Tag) _then;

/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tagId = null,Object? deviceId = null,Object? portNumber = freezed,Object? name = null,Object? slug = null,Object? dataType = null,Object? unit = null,Object? uiConfigJson = freezed,Object? updatedAt = freezed,Object? inputMin = freezed,Object? inputMax = freezed,Object? outputMin = freezed,Object? outputMax = freezed,Object? offsetVal = freezed,Object? registerAddress = freezed,Object? registerType = freezed,Object? registerCount = freezed,Object? endianness = freezed,Object? deadbandThreshold = freezed,Object? currentValue = freezed,Object? lastTagUpdated = freezed,}) {
  return _then(_self.copyWith(
tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as int,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int,portNumber: freezed == portNumber ? _self.portNumber : portNumber // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,dataType: null == dataType ? _self.dataType : dataType // ignore: cast_nullable_to_non_nullable
as TagDataType,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,uiConfigJson: freezed == uiConfigJson ? _self.uiConfigJson : uiConfigJson // ignore: cast_nullable_to_non_nullable
as TagUiConfig?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,inputMin: freezed == inputMin ? _self.inputMin : inputMin // ignore: cast_nullable_to_non_nullable
as double?,inputMax: freezed == inputMax ? _self.inputMax : inputMax // ignore: cast_nullable_to_non_nullable
as double?,outputMin: freezed == outputMin ? _self.outputMin : outputMin // ignore: cast_nullable_to_non_nullable
as double?,outputMax: freezed == outputMax ? _self.outputMax : outputMax // ignore: cast_nullable_to_non_nullable
as double?,offsetVal: freezed == offsetVal ? _self.offsetVal : offsetVal // ignore: cast_nullable_to_non_nullable
as double?,registerAddress: freezed == registerAddress ? _self.registerAddress : registerAddress // ignore: cast_nullable_to_non_nullable
as int?,registerType: freezed == registerType ? _self.registerType : registerType // ignore: cast_nullable_to_non_nullable
as RegisterType?,registerCount: freezed == registerCount ? _self.registerCount : registerCount // ignore: cast_nullable_to_non_nullable
as int?,endianness: freezed == endianness ? _self.endianness : endianness // ignore: cast_nullable_to_non_nullable
as ModbusEndianness?,deadbandThreshold: freezed == deadbandThreshold ? _self.deadbandThreshold : deadbandThreshold // ignore: cast_nullable_to_non_nullable
as double?,currentValue: freezed == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as double?,lastTagUpdated: freezed == lastTagUpdated ? _self.lastTagUpdated : lastTagUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TagUiConfigCopyWith<$Res>? get uiConfigJson {
    if (_self.uiConfigJson == null) {
    return null;
  }

  return $TagUiConfigCopyWith<$Res>(_self.uiConfigJson!, (value) {
    return _then(_self.copyWith(uiConfigJson: value));
  });
}
}


/// Adds pattern-matching-related methods to [Tag].
extension TagPatterns on Tag {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tag value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tag() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tag value)  $default,){
final _that = this;
switch (_that) {
case _Tag():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tag value)?  $default,){
final _that = this;
switch (_that) {
case _Tag() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tagId,  int deviceId,  int? portNumber,  String name,  String slug,  TagDataType dataType,  String unit,  TagUiConfig? uiConfigJson,  DateTime? updatedAt,  double? inputMin,  double? inputMax,  double? outputMin,  double? outputMax,  double? offsetVal,  int? registerAddress,  RegisterType? registerType,  int? registerCount,  ModbusEndianness? endianness,  double? deadbandThreshold,  double? currentValue,  DateTime? lastTagUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tag() when $default != null:
return $default(_that.tagId,_that.deviceId,_that.portNumber,_that.name,_that.slug,_that.dataType,_that.unit,_that.uiConfigJson,_that.updatedAt,_that.inputMin,_that.inputMax,_that.outputMin,_that.outputMax,_that.offsetVal,_that.registerAddress,_that.registerType,_that.registerCount,_that.endianness,_that.deadbandThreshold,_that.currentValue,_that.lastTagUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tagId,  int deviceId,  int? portNumber,  String name,  String slug,  TagDataType dataType,  String unit,  TagUiConfig? uiConfigJson,  DateTime? updatedAt,  double? inputMin,  double? inputMax,  double? outputMin,  double? outputMax,  double? offsetVal,  int? registerAddress,  RegisterType? registerType,  int? registerCount,  ModbusEndianness? endianness,  double? deadbandThreshold,  double? currentValue,  DateTime? lastTagUpdated)  $default,) {final _that = this;
switch (_that) {
case _Tag():
return $default(_that.tagId,_that.deviceId,_that.portNumber,_that.name,_that.slug,_that.dataType,_that.unit,_that.uiConfigJson,_that.updatedAt,_that.inputMin,_that.inputMax,_that.outputMin,_that.outputMax,_that.offsetVal,_that.registerAddress,_that.registerType,_that.registerCount,_that.endianness,_that.deadbandThreshold,_that.currentValue,_that.lastTagUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tagId,  int deviceId,  int? portNumber,  String name,  String slug,  TagDataType dataType,  String unit,  TagUiConfig? uiConfigJson,  DateTime? updatedAt,  double? inputMin,  double? inputMax,  double? outputMin,  double? outputMax,  double? offsetVal,  int? registerAddress,  RegisterType? registerType,  int? registerCount,  ModbusEndianness? endianness,  double? deadbandThreshold,  double? currentValue,  DateTime? lastTagUpdated)?  $default,) {final _that = this;
switch (_that) {
case _Tag() when $default != null:
return $default(_that.tagId,_that.deviceId,_that.portNumber,_that.name,_that.slug,_that.dataType,_that.unit,_that.uiConfigJson,_that.updatedAt,_that.inputMin,_that.inputMax,_that.outputMin,_that.outputMax,_that.offsetVal,_that.registerAddress,_that.registerType,_that.registerCount,_that.endianness,_that.deadbandThreshold,_that.currentValue,_that.lastTagUpdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Tag extends Tag {
  const _Tag({required this.tagId, required this.deviceId, this.portNumber, this.name = "Unnamed tag", this.slug = "unnamed-tag", required this.dataType, this.unit = "UnknownUnit", this.uiConfigJson, this.updatedAt, this.inputMin, this.inputMax, this.outputMin, this.outputMax, this.offsetVal, this.registerAddress, this.registerType, this.registerCount, this.endianness, this.deadbandThreshold, this.currentValue, this.lastTagUpdated}): super._();
  factory _Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

@override final  int tagId;
@override final  int deviceId;
@override final  int? portNumber;
@override@JsonKey() final  String name;
@override@JsonKey() final  String slug;
@override final  TagDataType dataType;
@override@JsonKey() final  String unit;
@override final  TagUiConfig? uiConfigJson;
@override final  DateTime? updatedAt;
// Full Tag fields
@override final  double? inputMin;
@override final  double? inputMax;
@override final  double? outputMin;
@override final  double? outputMax;
@override final  double? offsetVal;
@override final  int? registerAddress;
@override final  RegisterType? registerType;
@override final  int? registerCount;
@override final  ModbusEndianness? endianness;
@override final  double? deadbandThreshold;
// Realtime fields
@override final  double? currentValue;
@override final  DateTime? lastTagUpdated;

/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TagCopyWith<_Tag> get copyWith => __$TagCopyWithImpl<_Tag>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TagToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tag&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.portNumber, portNumber) || other.portNumber == portNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.dataType, dataType) || other.dataType == dataType)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.uiConfigJson, uiConfigJson) || other.uiConfigJson == uiConfigJson)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.inputMin, inputMin) || other.inputMin == inputMin)&&(identical(other.inputMax, inputMax) || other.inputMax == inputMax)&&(identical(other.outputMin, outputMin) || other.outputMin == outputMin)&&(identical(other.outputMax, outputMax) || other.outputMax == outputMax)&&(identical(other.offsetVal, offsetVal) || other.offsetVal == offsetVal)&&(identical(other.registerAddress, registerAddress) || other.registerAddress == registerAddress)&&(identical(other.registerType, registerType) || other.registerType == registerType)&&(identical(other.registerCount, registerCount) || other.registerCount == registerCount)&&(identical(other.endianness, endianness) || other.endianness == endianness)&&(identical(other.deadbandThreshold, deadbandThreshold) || other.deadbandThreshold == deadbandThreshold)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.lastTagUpdated, lastTagUpdated) || other.lastTagUpdated == lastTagUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,tagId,deviceId,portNumber,name,slug,dataType,unit,uiConfigJson,updatedAt,inputMin,inputMax,outputMin,outputMax,offsetVal,registerAddress,registerType,registerCount,endianness,deadbandThreshold,currentValue,lastTagUpdated]);

@override
String toString() {
  return 'Tag(tagId: $tagId, deviceId: $deviceId, portNumber: $portNumber, name: $name, slug: $slug, dataType: $dataType, unit: $unit, uiConfigJson: $uiConfigJson, updatedAt: $updatedAt, inputMin: $inputMin, inputMax: $inputMax, outputMin: $outputMin, outputMax: $outputMax, offsetVal: $offsetVal, registerAddress: $registerAddress, registerType: $registerType, registerCount: $registerCount, endianness: $endianness, deadbandThreshold: $deadbandThreshold, currentValue: $currentValue, lastTagUpdated: $lastTagUpdated)';
}


}

/// @nodoc
abstract mixin class _$TagCopyWith<$Res> implements $TagCopyWith<$Res> {
  factory _$TagCopyWith(_Tag value, $Res Function(_Tag) _then) = __$TagCopyWithImpl;
@override @useResult
$Res call({
 int tagId, int deviceId, int? portNumber, String name, String slug, TagDataType dataType, String unit, TagUiConfig? uiConfigJson, DateTime? updatedAt, double? inputMin, double? inputMax, double? outputMin, double? outputMax, double? offsetVal, int? registerAddress, RegisterType? registerType, int? registerCount, ModbusEndianness? endianness, double? deadbandThreshold, double? currentValue, DateTime? lastTagUpdated
});


@override $TagUiConfigCopyWith<$Res>? get uiConfigJson;

}
/// @nodoc
class __$TagCopyWithImpl<$Res>
    implements _$TagCopyWith<$Res> {
  __$TagCopyWithImpl(this._self, this._then);

  final _Tag _self;
  final $Res Function(_Tag) _then;

/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tagId = null,Object? deviceId = null,Object? portNumber = freezed,Object? name = null,Object? slug = null,Object? dataType = null,Object? unit = null,Object? uiConfigJson = freezed,Object? updatedAt = freezed,Object? inputMin = freezed,Object? inputMax = freezed,Object? outputMin = freezed,Object? outputMax = freezed,Object? offsetVal = freezed,Object? registerAddress = freezed,Object? registerType = freezed,Object? registerCount = freezed,Object? endianness = freezed,Object? deadbandThreshold = freezed,Object? currentValue = freezed,Object? lastTagUpdated = freezed,}) {
  return _then(_Tag(
tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as int,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int,portNumber: freezed == portNumber ? _self.portNumber : portNumber // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,dataType: null == dataType ? _self.dataType : dataType // ignore: cast_nullable_to_non_nullable
as TagDataType,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,uiConfigJson: freezed == uiConfigJson ? _self.uiConfigJson : uiConfigJson // ignore: cast_nullable_to_non_nullable
as TagUiConfig?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,inputMin: freezed == inputMin ? _self.inputMin : inputMin // ignore: cast_nullable_to_non_nullable
as double?,inputMax: freezed == inputMax ? _self.inputMax : inputMax // ignore: cast_nullable_to_non_nullable
as double?,outputMin: freezed == outputMin ? _self.outputMin : outputMin // ignore: cast_nullable_to_non_nullable
as double?,outputMax: freezed == outputMax ? _self.outputMax : outputMax // ignore: cast_nullable_to_non_nullable
as double?,offsetVal: freezed == offsetVal ? _self.offsetVal : offsetVal // ignore: cast_nullable_to_non_nullable
as double?,registerAddress: freezed == registerAddress ? _self.registerAddress : registerAddress // ignore: cast_nullable_to_non_nullable
as int?,registerType: freezed == registerType ? _self.registerType : registerType // ignore: cast_nullable_to_non_nullable
as RegisterType?,registerCount: freezed == registerCount ? _self.registerCount : registerCount // ignore: cast_nullable_to_non_nullable
as int?,endianness: freezed == endianness ? _self.endianness : endianness // ignore: cast_nullable_to_non_nullable
as ModbusEndianness?,deadbandThreshold: freezed == deadbandThreshold ? _self.deadbandThreshold : deadbandThreshold // ignore: cast_nullable_to_non_nullable
as double?,currentValue: freezed == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as double?,lastTagUpdated: freezed == lastTagUpdated ? _self.lastTagUpdated : lastTagUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TagUiConfigCopyWith<$Res>? get uiConfigJson {
    if (_self.uiConfigJson == null) {
    return null;
  }

  return $TagUiConfigCopyWith<$Res>(_self.uiConfigJson!, (value) {
    return _then(_self.copyWith(uiConfigJson: value));
  });
}
}

// dart format on
