// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterState<T> {

 RegisterFormState get formState;
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterStateCopyWith<T, RegisterState<T>> get copyWith => _$RegisterStateCopyWithImpl<T, RegisterState<T>>(this as RegisterState<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterState<T>&&(identical(other.formState, formState) || other.formState == formState));
}


@override
int get hashCode => Object.hash(runtimeType,formState);

@override
String toString() {
  return 'RegisterState<$T>(formState: $formState)';
}


}

/// @nodoc
abstract mixin class $RegisterStateCopyWith<T,$Res>  {
  factory $RegisterStateCopyWith(RegisterState<T> value, $Res Function(RegisterState<T>) _then) = _$RegisterStateCopyWithImpl;
@useResult
$Res call({
 RegisterFormState formState
});


$RegisterFormStateCopyWith<$Res> get formState;

}
/// @nodoc
class _$RegisterStateCopyWithImpl<T,$Res>
    implements $RegisterStateCopyWith<T, $Res> {
  _$RegisterStateCopyWithImpl(this._self, this._then);

  final RegisterState<T> _self;
  final $Res Function(RegisterState<T>) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? formState = null,}) {
  return _then(_self.copyWith(
formState: null == formState ? _self.formState : formState // ignore: cast_nullable_to_non_nullable
as RegisterFormState,
  ));
}
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterFormStateCopyWith<$Res> get formState {
  
  return $RegisterFormStateCopyWith<$Res>(_self.formState, (value) {
    return _then(_self.copyWith(formState: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegisterState].
extension RegisterStatePatterns<T> on RegisterState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial<T> value)?  initial,TResult Function( Loading<T> value)?  loading,TResult Function( Success<T> value)?  success,TResult Function( Failure<T> value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial<T> value)  initial,required TResult Function( Loading<T> value)  loading,required TResult Function( Success<T> value)  success,required TResult Function( Failure<T> value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case Success():
return success(_that);case Failure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial<T> value)?  initial,TResult? Function( Loading<T> value)?  loading,TResult? Function( Success<T> value)?  success,TResult? Function( Failure<T> value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( RegisterFormState formState)?  initial,TResult Function( RegisterFormState formState)?  loading,TResult Function( RegisterFormState formState,  T data)?  success,TResult Function( RegisterFormState formState,  String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.formState);case Loading() when loading != null:
return loading(_that.formState);case Success() when success != null:
return success(_that.formState,_that.data);case Failure() when failure != null:
return failure(_that.formState,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( RegisterFormState formState)  initial,required TResult Function( RegisterFormState formState)  loading,required TResult Function( RegisterFormState formState,  T data)  success,required TResult Function( RegisterFormState formState,  String error)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.formState);case Loading():
return loading(_that.formState);case Success():
return success(_that.formState,_that.data);case Failure():
return failure(_that.formState,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( RegisterFormState formState)?  initial,TResult? Function( RegisterFormState formState)?  loading,TResult? Function( RegisterFormState formState,  T data)?  success,TResult? Function( RegisterFormState formState,  String error)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.formState);case Loading() when loading != null:
return loading(_that.formState);case Success() when success != null:
return success(_that.formState,_that.data);case Failure() when failure != null:
return failure(_that.formState,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial<T> implements RegisterState<T> {
  const _Initial(this.formState);
  

@override final  RegisterFormState formState;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<T, _Initial<T>> get copyWith => __$InitialCopyWithImpl<T, _Initial<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial<T>&&(identical(other.formState, formState) || other.formState == formState));
}


@override
int get hashCode => Object.hash(runtimeType,formState);

@override
String toString() {
  return 'RegisterState<$T>.initial(formState: $formState)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<T,$Res> implements $RegisterStateCopyWith<T, $Res> {
  factory _$InitialCopyWith(_Initial<T> value, $Res Function(_Initial<T>) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 RegisterFormState formState
});


@override $RegisterFormStateCopyWith<$Res> get formState;

}
/// @nodoc
class __$InitialCopyWithImpl<T,$Res>
    implements _$InitialCopyWith<T, $Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial<T> _self;
  final $Res Function(_Initial<T>) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? formState = null,}) {
  return _then(_Initial<T>(
null == formState ? _self.formState : formState // ignore: cast_nullable_to_non_nullable
as RegisterFormState,
  ));
}

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterFormStateCopyWith<$Res> get formState {
  
  return $RegisterFormStateCopyWith<$Res>(_self.formState, (value) {
    return _then(_self.copyWith(formState: value));
  });
}
}

/// @nodoc


class Loading<T> implements RegisterState<T> {
  const Loading(this.formState);
  

@override final  RegisterFormState formState;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingCopyWith<T, Loading<T>> get copyWith => _$LoadingCopyWithImpl<T, Loading<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading<T>&&(identical(other.formState, formState) || other.formState == formState));
}


@override
int get hashCode => Object.hash(runtimeType,formState);

@override
String toString() {
  return 'RegisterState<$T>.loading(formState: $formState)';
}


}

/// @nodoc
abstract mixin class $LoadingCopyWith<T,$Res> implements $RegisterStateCopyWith<T, $Res> {
  factory $LoadingCopyWith(Loading<T> value, $Res Function(Loading<T>) _then) = _$LoadingCopyWithImpl;
@override @useResult
$Res call({
 RegisterFormState formState
});


@override $RegisterFormStateCopyWith<$Res> get formState;

}
/// @nodoc
class _$LoadingCopyWithImpl<T,$Res>
    implements $LoadingCopyWith<T, $Res> {
  _$LoadingCopyWithImpl(this._self, this._then);

  final Loading<T> _self;
  final $Res Function(Loading<T>) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? formState = null,}) {
  return _then(Loading<T>(
null == formState ? _self.formState : formState // ignore: cast_nullable_to_non_nullable
as RegisterFormState,
  ));
}

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterFormStateCopyWith<$Res> get formState {
  
  return $RegisterFormStateCopyWith<$Res>(_self.formState, (value) {
    return _then(_self.copyWith(formState: value));
  });
}
}

/// @nodoc


class Success<T> implements RegisterState<T> {
  const Success(this.formState, {required this.data});
  

@override final  RegisterFormState formState;
 final  T data;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<T, Success<T>> get copyWith => _$SuccessCopyWithImpl<T, Success<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success<T>&&(identical(other.formState, formState) || other.formState == formState)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,formState,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'RegisterState<$T>.success(formState: $formState, data: $data)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<T,$Res> implements $RegisterStateCopyWith<T, $Res> {
  factory $SuccessCopyWith(Success<T> value, $Res Function(Success<T>) _then) = _$SuccessCopyWithImpl;
@override @useResult
$Res call({
 RegisterFormState formState, T data
});


@override $RegisterFormStateCopyWith<$Res> get formState;

}
/// @nodoc
class _$SuccessCopyWithImpl<T,$Res>
    implements $SuccessCopyWith<T, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<T> _self;
  final $Res Function(Success<T>) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? formState = null,Object? data = freezed,}) {
  return _then(Success<T>(
null == formState ? _self.formState : formState // ignore: cast_nullable_to_non_nullable
as RegisterFormState,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterFormStateCopyWith<$Res> get formState {
  
  return $RegisterFormStateCopyWith<$Res>(_self.formState, (value) {
    return _then(_self.copyWith(formState: value));
  });
}
}

/// @nodoc


class Failure<T> implements RegisterState<T> {
  const Failure(this.formState, {required this.error});
  

@override final  RegisterFormState formState;
 final  String error;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<T, Failure<T>> get copyWith => _$FailureCopyWithImpl<T, Failure<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure<T>&&(identical(other.formState, formState) || other.formState == formState)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,formState,error);

@override
String toString() {
  return 'RegisterState<$T>.failure(formState: $formState, error: $error)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<T,$Res> implements $RegisterStateCopyWith<T, $Res> {
  factory $FailureCopyWith(Failure<T> value, $Res Function(Failure<T>) _then) = _$FailureCopyWithImpl;
@override @useResult
$Res call({
 RegisterFormState formState, String error
});


@override $RegisterFormStateCopyWith<$Res> get formState;

}
/// @nodoc
class _$FailureCopyWithImpl<T,$Res>
    implements $FailureCopyWith<T, $Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure<T> _self;
  final $Res Function(Failure<T>) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? formState = null,Object? error = null,}) {
  return _then(Failure<T>(
null == formState ? _self.formState : formState // ignore: cast_nullable_to_non_nullable
as RegisterFormState,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterFormStateCopyWith<$Res> get formState {
  
  return $RegisterFormStateCopyWith<$Res>(_self.formState, (value) {
    return _then(_self.copyWith(formState: value));
  });
}
}

/// @nodoc
mixin _$RegisterFormState {

 String get deviceId; String get username; bool get isValid; bool get rememberMe;
/// Create a copy of RegisterFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterFormStateCopyWith<RegisterFormState> get copyWith => _$RegisterFormStateCopyWithImpl<RegisterFormState>(this as RegisterFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterFormState&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.username, username) || other.username == username)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.rememberMe, rememberMe) || other.rememberMe == rememberMe));
}


@override
int get hashCode => Object.hash(runtimeType,deviceId,username,isValid,rememberMe);

@override
String toString() {
  return 'RegisterFormState(deviceId: $deviceId, username: $username, isValid: $isValid, rememberMe: $rememberMe)';
}


}

/// @nodoc
abstract mixin class $RegisterFormStateCopyWith<$Res>  {
  factory $RegisterFormStateCopyWith(RegisterFormState value, $Res Function(RegisterFormState) _then) = _$RegisterFormStateCopyWithImpl;
@useResult
$Res call({
 String deviceId, String username, bool isValid, bool rememberMe
});




}
/// @nodoc
class _$RegisterFormStateCopyWithImpl<$Res>
    implements $RegisterFormStateCopyWith<$Res> {
  _$RegisterFormStateCopyWithImpl(this._self, this._then);

  final RegisterFormState _self;
  final $Res Function(RegisterFormState) _then;

/// Create a copy of RegisterFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = null,Object? username = null,Object? isValid = null,Object? rememberMe = null,}) {
  return _then(_self.copyWith(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,rememberMe: null == rememberMe ? _self.rememberMe : rememberMe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterFormState].
extension RegisterFormStatePatterns on RegisterFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterFormState value)  $default,){
final _that = this;
switch (_that) {
case _RegisterFormState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterFormState value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String deviceId,  String username,  bool isValid,  bool rememberMe)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterFormState() when $default != null:
return $default(_that.deviceId,_that.username,_that.isValid,_that.rememberMe);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String deviceId,  String username,  bool isValid,  bool rememberMe)  $default,) {final _that = this;
switch (_that) {
case _RegisterFormState():
return $default(_that.deviceId,_that.username,_that.isValid,_that.rememberMe);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String deviceId,  String username,  bool isValid,  bool rememberMe)?  $default,) {final _that = this;
switch (_that) {
case _RegisterFormState() when $default != null:
return $default(_that.deviceId,_that.username,_that.isValid,_that.rememberMe);case _:
  return null;

}
}

}

/// @nodoc


class _RegisterFormState implements RegisterFormState {
  const _RegisterFormState({this.deviceId = '', this.username = '', this.isValid = false, this.rememberMe = false});
  

@override@JsonKey() final  String deviceId;
@override@JsonKey() final  String username;
@override@JsonKey() final  bool isValid;
@override@JsonKey() final  bool rememberMe;

/// Create a copy of RegisterFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterFormStateCopyWith<_RegisterFormState> get copyWith => __$RegisterFormStateCopyWithImpl<_RegisterFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterFormState&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.username, username) || other.username == username)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.rememberMe, rememberMe) || other.rememberMe == rememberMe));
}


@override
int get hashCode => Object.hash(runtimeType,deviceId,username,isValid,rememberMe);

@override
String toString() {
  return 'RegisterFormState(deviceId: $deviceId, username: $username, isValid: $isValid, rememberMe: $rememberMe)';
}


}

/// @nodoc
abstract mixin class _$RegisterFormStateCopyWith<$Res> implements $RegisterFormStateCopyWith<$Res> {
  factory _$RegisterFormStateCopyWith(_RegisterFormState value, $Res Function(_RegisterFormState) _then) = __$RegisterFormStateCopyWithImpl;
@override @useResult
$Res call({
 String deviceId, String username, bool isValid, bool rememberMe
});




}
/// @nodoc
class __$RegisterFormStateCopyWithImpl<$Res>
    implements _$RegisterFormStateCopyWith<$Res> {
  __$RegisterFormStateCopyWithImpl(this._self, this._then);

  final _RegisterFormState _self;
  final $Res Function(_RegisterFormState) _then;

/// Create a copy of RegisterFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = null,Object? username = null,Object? isValid = null,Object? rememberMe = null,}) {
  return _then(_RegisterFormState(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,rememberMe: null == rememberMe ? _self.rememberMe : rememberMe // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
