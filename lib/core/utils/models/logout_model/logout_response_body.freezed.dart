// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_response_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LogoutResponseBody {

 bool get success; String get message; String? get data;
/// Create a copy of LogoutResponseBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutResponseBodyCopyWith<LogoutResponseBody> get copyWith => _$LogoutResponseBodyCopyWithImpl<LogoutResponseBody>(this as LogoutResponseBody, _$identity);

  /// Serializes this LogoutResponseBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutResponseBody&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'LogoutResponseBody(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $LogoutResponseBodyCopyWith<$Res>  {
  factory $LogoutResponseBodyCopyWith(LogoutResponseBody value, $Res Function(LogoutResponseBody) _then) = _$LogoutResponseBodyCopyWithImpl;
@useResult
$Res call({
 bool success, String message, String? data
});




}
/// @nodoc
class _$LogoutResponseBodyCopyWithImpl<$Res>
    implements $LogoutResponseBodyCopyWith<$Res> {
  _$LogoutResponseBodyCopyWithImpl(this._self, this._then);

  final LogoutResponseBody _self;
  final $Res Function(LogoutResponseBody) _then;

/// Create a copy of LogoutResponseBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LogoutResponseBody].
extension LogoutResponseBodyPatterns on LogoutResponseBody {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogoutResponseBody value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogoutResponseBody() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogoutResponseBody value)  $default,){
final _that = this;
switch (_that) {
case _LogoutResponseBody():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogoutResponseBody value)?  $default,){
final _that = this;
switch (_that) {
case _LogoutResponseBody() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  String? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogoutResponseBody() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  String? data)  $default,) {final _that = this;
switch (_that) {
case _LogoutResponseBody():
return $default(_that.success,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  String? data)?  $default,) {final _that = this;
switch (_that) {
case _LogoutResponseBody() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LogoutResponseBody implements LogoutResponseBody {
  const _LogoutResponseBody({required this.success, required this.message, this.data});
  factory _LogoutResponseBody.fromJson(Map<String, dynamic> json) => _$LogoutResponseBodyFromJson(json);

@override final  bool success;
@override final  String message;
@override final  String? data;

/// Create a copy of LogoutResponseBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoutResponseBodyCopyWith<_LogoutResponseBody> get copyWith => __$LogoutResponseBodyCopyWithImpl<_LogoutResponseBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogoutResponseBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutResponseBody&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'LogoutResponseBody(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$LogoutResponseBodyCopyWith<$Res> implements $LogoutResponseBodyCopyWith<$Res> {
  factory _$LogoutResponseBodyCopyWith(_LogoutResponseBody value, $Res Function(_LogoutResponseBody) _then) = __$LogoutResponseBodyCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, String? data
});




}
/// @nodoc
class __$LogoutResponseBodyCopyWithImpl<$Res>
    implements _$LogoutResponseBodyCopyWith<$Res> {
  __$LogoutResponseBodyCopyWithImpl(this._self, this._then);

  final _LogoutResponseBody _self;
  final $Res Function(_LogoutResponseBody) _then;

/// Create a copy of LogoutResponseBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_LogoutResponseBody(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
