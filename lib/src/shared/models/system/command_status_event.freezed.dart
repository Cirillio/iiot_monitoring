// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command_status_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommandStatusEvent {

 int get commandId; CommandStatus get status; String? get errorMessage;
/// Create a copy of CommandStatusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommandStatusEventCopyWith<CommandStatusEvent> get copyWith => _$CommandStatusEventCopyWithImpl<CommandStatusEvent>(this as CommandStatusEvent, _$identity);

  /// Serializes this CommandStatusEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommandStatusEvent&&(identical(other.commandId, commandId) || other.commandId == commandId)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,commandId,status,errorMessage);

@override
String toString() {
  return 'CommandStatusEvent(commandId: $commandId, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CommandStatusEventCopyWith<$Res>  {
  factory $CommandStatusEventCopyWith(CommandStatusEvent value, $Res Function(CommandStatusEvent) _then) = _$CommandStatusEventCopyWithImpl;
@useResult
$Res call({
 int commandId, CommandStatus status, String? errorMessage
});




}
/// @nodoc
class _$CommandStatusEventCopyWithImpl<$Res>
    implements $CommandStatusEventCopyWith<$Res> {
  _$CommandStatusEventCopyWithImpl(this._self, this._then);

  final CommandStatusEvent _self;
  final $Res Function(CommandStatusEvent) _then;

/// Create a copy of CommandStatusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? commandId = null,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
commandId: null == commandId ? _self.commandId : commandId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommandStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CommandStatusEvent].
extension CommandStatusEventPatterns on CommandStatusEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommandStatusEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommandStatusEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommandStatusEvent value)  $default,){
final _that = this;
switch (_that) {
case _CommandStatusEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommandStatusEvent value)?  $default,){
final _that = this;
switch (_that) {
case _CommandStatusEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int commandId,  CommandStatus status,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommandStatusEvent() when $default != null:
return $default(_that.commandId,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int commandId,  CommandStatus status,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CommandStatusEvent():
return $default(_that.commandId,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int commandId,  CommandStatus status,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CommandStatusEvent() when $default != null:
return $default(_that.commandId,_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommandStatusEvent implements CommandStatusEvent {
  const _CommandStatusEvent({required this.commandId, required this.status, this.errorMessage});
  factory _CommandStatusEvent.fromJson(Map<String, dynamic> json) => _$CommandStatusEventFromJson(json);

@override final  int commandId;
@override final  CommandStatus status;
@override final  String? errorMessage;

/// Create a copy of CommandStatusEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommandStatusEventCopyWith<_CommandStatusEvent> get copyWith => __$CommandStatusEventCopyWithImpl<_CommandStatusEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommandStatusEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommandStatusEvent&&(identical(other.commandId, commandId) || other.commandId == commandId)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,commandId,status,errorMessage);

@override
String toString() {
  return 'CommandStatusEvent(commandId: $commandId, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CommandStatusEventCopyWith<$Res> implements $CommandStatusEventCopyWith<$Res> {
  factory _$CommandStatusEventCopyWith(_CommandStatusEvent value, $Res Function(_CommandStatusEvent) _then) = __$CommandStatusEventCopyWithImpl;
@override @useResult
$Res call({
 int commandId, CommandStatus status, String? errorMessage
});




}
/// @nodoc
class __$CommandStatusEventCopyWithImpl<$Res>
    implements _$CommandStatusEventCopyWith<$Res> {
  __$CommandStatusEventCopyWithImpl(this._self, this._then);

  final _CommandStatusEvent _self;
  final $Res Function(_CommandStatusEvent) _then;

/// Create a copy of CommandStatusEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? commandId = null,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_CommandStatusEvent(
commandId: null == commandId ? _self.commandId : commandId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommandStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
