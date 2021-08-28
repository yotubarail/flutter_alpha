// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'signin_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SigninDataTearOff {
  const _$SigninDataTearOff();

  _SigninData call(
      {String email = 'test@test.com', String password = 'P@ssw0rd'}) {
    return _SigninData(
      email: email,
      password: password,
    );
  }
}

/// @nodoc
const $SigninData = _$SigninDataTearOff();

/// @nodoc
mixin _$SigninData {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SigninDataCopyWith<SigninData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SigninDataCopyWith<$Res> {
  factory $SigninDataCopyWith(
          SigninData value, $Res Function(SigninData) then) =
      _$SigninDataCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class _$SigninDataCopyWithImpl<$Res> implements $SigninDataCopyWith<$Res> {
  _$SigninDataCopyWithImpl(this._value, this._then);

  final SigninData _value;
  // ignore: unused_field
  final $Res Function(SigninData) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$SigninDataCopyWith<$Res> implements $SigninDataCopyWith<$Res> {
  factory _$SigninDataCopyWith(
          _SigninData value, $Res Function(_SigninData) then) =
      __$SigninDataCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

/// @nodoc
class __$SigninDataCopyWithImpl<$Res> extends _$SigninDataCopyWithImpl<$Res>
    implements _$SigninDataCopyWith<$Res> {
  __$SigninDataCopyWithImpl(
      _SigninData _value, $Res Function(_SigninData) _then)
      : super(_value, (v) => _then(v as _SigninData));

  @override
  _SigninData get _value => super._value as _SigninData;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_SigninData(
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

class _$_SigninData implements _SigninData {
  const _$_SigninData(
      {this.email = 'test@test.com', this.password = 'P@ssw0rd'});

  @JsonKey(defaultValue: 'test@test.com')
  @override
  final String email;
  @JsonKey(defaultValue: 'P@ssw0rd')
  @override
  final String password;

  @override
  String toString() {
    return 'SigninData(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SigninData &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$SigninDataCopyWith<_SigninData> get copyWith =>
      __$SigninDataCopyWithImpl<_SigninData>(this, _$identity);
}

abstract class _SigninData implements SigninData {
  const factory _SigninData({String email, String password}) = _$_SigninData;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SigninDataCopyWith<_SigninData> get copyWith =>
      throw _privateConstructorUsedError;
}
