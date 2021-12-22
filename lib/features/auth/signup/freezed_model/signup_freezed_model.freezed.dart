// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'signup_freezed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignUpObjectTearOff {
  const _$SignUpObjectTearOff();

  _SignUpObject call(String name, String email, String password) {
    return _SignUpObject(
      name,
      email,
      password,
    );
  }
}

/// @nodoc
const $SignUpObject = _$SignUpObjectTearOff();

/// @nodoc
mixin _$SignUpObject {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpObjectCopyWith<SignUpObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpObjectCopyWith<$Res> {
  factory $SignUpObjectCopyWith(
          SignUpObject value, $Res Function(SignUpObject) then) =
      _$SignUpObjectCopyWithImpl<$Res>;
  $Res call({String name, String email, String password});
}

/// @nodoc
class _$SignUpObjectCopyWithImpl<$Res> implements $SignUpObjectCopyWith<$Res> {
  _$SignUpObjectCopyWithImpl(this._value, this._then);

  final SignUpObject _value;
  // ignore: unused_field
  final $Res Function(SignUpObject) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SignUpObjectCopyWith<$Res>
    implements $SignUpObjectCopyWith<$Res> {
  factory _$SignUpObjectCopyWith(
          _SignUpObject value, $Res Function(_SignUpObject) then) =
      __$SignUpObjectCopyWithImpl<$Res>;
  @override
  $Res call({String name, String email, String password});
}

/// @nodoc
class __$SignUpObjectCopyWithImpl<$Res> extends _$SignUpObjectCopyWithImpl<$Res>
    implements _$SignUpObjectCopyWith<$Res> {
  __$SignUpObjectCopyWithImpl(
      _SignUpObject _value, $Res Function(_SignUpObject) _then)
      : super(_value, (v) => _then(v as _SignUpObject));

  @override
  _SignUpObject get _value => super._value as _SignUpObject;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_SignUpObject(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignUpObject implements _SignUpObject {
  _$_SignUpObject(this.name, this.email, this.password);

  @override
  final String name;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignUpObject(name: $name, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignUpObject &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$SignUpObjectCopyWith<_SignUpObject> get copyWith =>
      __$SignUpObjectCopyWithImpl<_SignUpObject>(this, _$identity);
}

abstract class _SignUpObject implements SignUpObject {
  factory _SignUpObject(String name, String email, String password) =
      _$_SignUpObject;

  @override
  String get name;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$SignUpObjectCopyWith<_SignUpObject> get copyWith =>
      throw _privateConstructorUsedError;
}
