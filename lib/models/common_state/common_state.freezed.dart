// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommonState {
  String get errText => throw _privateConstructorUsedError;
  bool get isLoad => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  Otp? get otp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommonStateCopyWith<CommonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonStateCopyWith<$Res> {
  factory $CommonStateCopyWith(
          CommonState value, $Res Function(CommonState) then) =
      _$CommonStateCopyWithImpl<$Res, CommonState>;
  @useResult
  $Res call(
      {String errText,
      bool isLoad,
      bool isSuccess,
      bool isError,
      User? user,
      Otp? otp});
}

/// @nodoc
class _$CommonStateCopyWithImpl<$Res, $Val extends CommonState>
    implements $CommonStateCopyWith<$Res> {
  _$CommonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errText = null,
    Object? isLoad = null,
    Object? isSuccess = null,
    Object? isError = null,
    Object? user = freezed,
    Object? otp = freezed,
  }) {
    return _then(_value.copyWith(
      errText: null == errText
          ? _value.errText
          : errText // ignore: cast_nullable_to_non_nullable
              as String,
      isLoad: null == isLoad
          ? _value.isLoad
          : isLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as Otp?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommonStateCopyWith<$Res>
    implements $CommonStateCopyWith<$Res> {
  factory _$$_CommonStateCopyWith(
          _$_CommonState value, $Res Function(_$_CommonState) then) =
      __$$_CommonStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String errText,
      bool isLoad,
      bool isSuccess,
      bool isError,
      User? user,
      Otp? otp});
}

/// @nodoc
class __$$_CommonStateCopyWithImpl<$Res>
    extends _$CommonStateCopyWithImpl<$Res, _$_CommonState>
    implements _$$_CommonStateCopyWith<$Res> {
  __$$_CommonStateCopyWithImpl(
      _$_CommonState _value, $Res Function(_$_CommonState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errText = null,
    Object? isLoad = null,
    Object? isSuccess = null,
    Object? isError = null,
    Object? user = freezed,
    Object? otp = freezed,
  }) {
    return _then(_$_CommonState(
      errText: null == errText
          ? _value.errText
          : errText // ignore: cast_nullable_to_non_nullable
              as String,
      isLoad: null == isLoad
          ? _value.isLoad
          : isLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as Otp?,
    ));
  }
}

/// @nodoc

class _$_CommonState implements _CommonState {
  const _$_CommonState(
      {required this.errText,
      required this.isLoad,
      required this.isSuccess,
      required this.isError,
      this.user,
      this.otp});

  @override
  final String errText;
  @override
  final bool isLoad;
  @override
  final bool isSuccess;
  @override
  final bool isError;
  @override
  final User? user;
  @override
  final Otp? otp;

  @override
  String toString() {
    return 'CommonState(errText: $errText, isLoad: $isLoad, isSuccess: $isSuccess, isError: $isError, user: $user, otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommonState &&
            (identical(other.errText, errText) || other.errText == errText) &&
            (identical(other.isLoad, isLoad) || other.isLoad == isLoad) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, errText, isLoad, isSuccess, isError, user, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommonStateCopyWith<_$_CommonState> get copyWith =>
      __$$_CommonStateCopyWithImpl<_$_CommonState>(this, _$identity);
}

abstract class _CommonState implements CommonState {
  const factory _CommonState(
      {required final String errText,
      required final bool isLoad,
      required final bool isSuccess,
      required final bool isError,
      final User? user,
      final Otp? otp}) = _$_CommonState;

  @override
  String get errText;
  @override
  bool get isLoad;
  @override
  bool get isSuccess;
  @override
  bool get isError;
  @override
  User? get user;
  @override
  Otp? get otp;
  @override
  @JsonKey(ignore: true)
  _$$_CommonStateCopyWith<_$_CommonState> get copyWith =>
      throw _privateConstructorUsedError;
}
