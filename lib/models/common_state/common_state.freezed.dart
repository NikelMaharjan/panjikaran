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
  Map<dynamic, dynamic>? get data => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  Otp? get otp => throw _privateConstructorUsedError;
  List<Birth>? get birth => throw _privateConstructorUsedError;
  List<Death>? get death => throw _privateConstructorUsedError;

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
      Map<dynamic, dynamic>? data,
      User? user,
      Otp? otp,
      List<Birth>? birth,
      List<Death>? death});
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
    Object? data = freezed,
    Object? user = freezed,
    Object? otp = freezed,
    Object? birth = freezed,
    Object? death = freezed,
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
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as Otp?,
      birth: freezed == birth
          ? _value.birth
          : birth // ignore: cast_nullable_to_non_nullable
              as List<Birth>?,
      death: freezed == death
          ? _value.death
          : death // ignore: cast_nullable_to_non_nullable
              as List<Death>?,
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
      Map<dynamic, dynamic>? data,
      User? user,
      Otp? otp,
      List<Birth>? birth,
      List<Death>? death});
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
    Object? data = freezed,
    Object? user = freezed,
    Object? otp = freezed,
    Object? birth = freezed,
    Object? death = freezed,
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
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as Otp?,
      birth: freezed == birth
          ? _value._birth
          : birth // ignore: cast_nullable_to_non_nullable
              as List<Birth>?,
      death: freezed == death
          ? _value._death
          : death // ignore: cast_nullable_to_non_nullable
              as List<Death>?,
    ));
  }
}

/// @nodoc

class _$_CommonState implements _CommonState {
  _$_CommonState(
      {required this.errText,
      required this.isLoad,
      required this.isSuccess,
      required this.isError,
      final Map<dynamic, dynamic>? data,
      this.user,
      this.otp,
      final List<Birth>? birth,
      final List<Death>? death})
      : _data = data,
        _birth = birth,
        _death = death;

  @override
  final String errText;
  @override
  final bool isLoad;
  @override
  final bool isSuccess;
  @override
  final bool isError;
  final Map<dynamic, dynamic>? _data;
  @override
  Map<dynamic, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final User? user;
  @override
  final Otp? otp;
  final List<Birth>? _birth;
  @override
  List<Birth>? get birth {
    final value = _birth;
    if (value == null) return null;
    if (_birth is EqualUnmodifiableListView) return _birth;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Death>? _death;
  @override
  List<Death>? get death {
    final value = _death;
    if (value == null) return null;
    if (_death is EqualUnmodifiableListView) return _death;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CommonState(errText: $errText, isLoad: $isLoad, isSuccess: $isSuccess, isError: $isError, data: $data, user: $user, otp: $otp, birth: $birth, death: $death)';
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
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            const DeepCollectionEquality().equals(other._birth, _birth) &&
            const DeepCollectionEquality().equals(other._death, _death));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      errText,
      isLoad,
      isSuccess,
      isError,
      const DeepCollectionEquality().hash(_data),
      user,
      otp,
      const DeepCollectionEquality().hash(_birth),
      const DeepCollectionEquality().hash(_death));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommonStateCopyWith<_$_CommonState> get copyWith =>
      __$$_CommonStateCopyWithImpl<_$_CommonState>(this, _$identity);
}

abstract class _CommonState implements CommonState {
  factory _CommonState(
      {required final String errText,
      required final bool isLoad,
      required final bool isSuccess,
      required final bool isError,
      final Map<dynamic, dynamic>? data,
      final User? user,
      final Otp? otp,
      final List<Birth>? birth,
      final List<Death>? death}) = _$_CommonState;

  @override
  String get errText;
  @override
  bool get isLoad;
  @override
  bool get isSuccess;
  @override
  bool get isError;
  @override
  Map<dynamic, dynamic>? get data;
  @override
  User? get user;
  @override
  Otp? get otp;
  @override
  List<Birth>? get birth;
  @override
  List<Death>? get death;
  @override
  @JsonKey(ignore: true)
  _$$_CommonStateCopyWith<_$_CommonState> get copyWith =>
      throw _privateConstructorUsedError;
}
