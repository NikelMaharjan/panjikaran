// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'birth_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BirthCount _$BirthCountFromJson(Map<String, dynamic> json) {
  return _BirthCount.fromJson(json);
}

/// @nodoc
mixin _$BirthCount {
  String get month => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BirthCountCopyWith<BirthCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BirthCountCopyWith<$Res> {
  factory $BirthCountCopyWith(
          BirthCount value, $Res Function(BirthCount) then) =
      _$BirthCountCopyWithImpl<$Res, BirthCount>;
  @useResult
  $Res call({String month, int count});
}

/// @nodoc
class _$BirthCountCopyWithImpl<$Res, $Val extends BirthCount>
    implements $BirthCountCopyWith<$Res> {
  _$BirthCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BirthCountCopyWith<$Res>
    implements $BirthCountCopyWith<$Res> {
  factory _$$_BirthCountCopyWith(
          _$_BirthCount value, $Res Function(_$_BirthCount) then) =
      __$$_BirthCountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String month, int count});
}

/// @nodoc
class __$$_BirthCountCopyWithImpl<$Res>
    extends _$BirthCountCopyWithImpl<$Res, _$_BirthCount>
    implements _$$_BirthCountCopyWith<$Res> {
  __$$_BirthCountCopyWithImpl(
      _$_BirthCount _value, $Res Function(_$_BirthCount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? count = null,
  }) {
    return _then(_$_BirthCount(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BirthCount implements _BirthCount {
  const _$_BirthCount({required this.month, required this.count});

  factory _$_BirthCount.fromJson(Map<String, dynamic> json) =>
      _$$_BirthCountFromJson(json);

  @override
  final String month;
  @override
  final int count;

  @override
  String toString() {
    return 'BirthCount(month: $month, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BirthCount &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, month, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BirthCountCopyWith<_$_BirthCount> get copyWith =>
      __$$_BirthCountCopyWithImpl<_$_BirthCount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BirthCountToJson(
      this,
    );
  }
}

abstract class _BirthCount implements BirthCount {
  const factory _BirthCount(
      {required final String month, required final int count}) = _$_BirthCount;

  factory _BirthCount.fromJson(Map<String, dynamic> json) =
      _$_BirthCount.fromJson;

  @override
  String get month;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_BirthCountCopyWith<_$_BirthCount> get copyWith =>
      throw _privateConstructorUsedError;
}
