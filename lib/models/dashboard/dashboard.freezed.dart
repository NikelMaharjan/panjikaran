// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Dashboard _$DashboardFromJson(Map<String, dynamic> json) {
  return _Dashboard.fromJson(json);
}

/// @nodoc
mixin _$Dashboard {
  int get marriage_count => throw _privateConstructorUsedError;
  int get verified_birth_count => throw _privateConstructorUsedError;
  int get divorce_count => throw _privateConstructorUsedError;
  int get death_count => throw _privateConstructorUsedError;
  List<BirthCount> get birth_count_monthwise =>
      throw _privateConstructorUsedError;
  dynamic get L => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardCopyWith<Dashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardCopyWith<$Res> {
  factory $DashboardCopyWith(Dashboard value, $Res Function(Dashboard) then) =
      _$DashboardCopyWithImpl<$Res, Dashboard>;
  @useResult
  $Res call(
      {int marriage_count,
      int verified_birth_count,
      int divorce_count,
      int death_count,
      List<BirthCount> birth_count_monthwise,
      dynamic L});
}

/// @nodoc
class _$DashboardCopyWithImpl<$Res, $Val extends Dashboard>
    implements $DashboardCopyWith<$Res> {
  _$DashboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marriage_count = null,
    Object? verified_birth_count = null,
    Object? divorce_count = null,
    Object? death_count = null,
    Object? birth_count_monthwise = null,
    Object? L = freezed,
  }) {
    return _then(_value.copyWith(
      marriage_count: null == marriage_count
          ? _value.marriage_count
          : marriage_count // ignore: cast_nullable_to_non_nullable
              as int,
      verified_birth_count: null == verified_birth_count
          ? _value.verified_birth_count
          : verified_birth_count // ignore: cast_nullable_to_non_nullable
              as int,
      divorce_count: null == divorce_count
          ? _value.divorce_count
          : divorce_count // ignore: cast_nullable_to_non_nullable
              as int,
      death_count: null == death_count
          ? _value.death_count
          : death_count // ignore: cast_nullable_to_non_nullable
              as int,
      birth_count_monthwise: null == birth_count_monthwise
          ? _value.birth_count_monthwise
          : birth_count_monthwise // ignore: cast_nullable_to_non_nullable
              as List<BirthCount>,
      L: freezed == L
          ? _value.L
          : L // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DashboardCopyWith<$Res> implements $DashboardCopyWith<$Res> {
  factory _$$_DashboardCopyWith(
          _$_Dashboard value, $Res Function(_$_Dashboard) then) =
      __$$_DashboardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int marriage_count,
      int verified_birth_count,
      int divorce_count,
      int death_count,
      List<BirthCount> birth_count_monthwise,
      dynamic L});
}

/// @nodoc
class __$$_DashboardCopyWithImpl<$Res>
    extends _$DashboardCopyWithImpl<$Res, _$_Dashboard>
    implements _$$_DashboardCopyWith<$Res> {
  __$$_DashboardCopyWithImpl(
      _$_Dashboard _value, $Res Function(_$_Dashboard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marriage_count = null,
    Object? verified_birth_count = null,
    Object? divorce_count = null,
    Object? death_count = null,
    Object? birth_count_monthwise = null,
    Object? L = freezed,
  }) {
    return _then(_$_Dashboard(
      marriage_count: null == marriage_count
          ? _value.marriage_count
          : marriage_count // ignore: cast_nullable_to_non_nullable
              as int,
      verified_birth_count: null == verified_birth_count
          ? _value.verified_birth_count
          : verified_birth_count // ignore: cast_nullable_to_non_nullable
              as int,
      divorce_count: null == divorce_count
          ? _value.divorce_count
          : divorce_count // ignore: cast_nullable_to_non_nullable
              as int,
      death_count: null == death_count
          ? _value.death_count
          : death_count // ignore: cast_nullable_to_non_nullable
              as int,
      birth_count_monthwise: null == birth_count_monthwise
          ? _value._birth_count_monthwise
          : birth_count_monthwise // ignore: cast_nullable_to_non_nullable
              as List<BirthCount>,
      L: freezed == L ? _value.L! : L,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Dashboard implements _Dashboard {
  const _$_Dashboard(
      {required this.marriage_count,
      required this.verified_birth_count,
      required this.divorce_count,
      required this.death_count,
      required final List<BirthCount> birth_count_monthwise,
      this.L})
      : _birth_count_monthwise = birth_count_monthwise;

  factory _$_Dashboard.fromJson(Map<String, dynamic> json) =>
      _$$_DashboardFromJson(json);

  @override
  final int marriage_count;
  @override
  final int verified_birth_count;
  @override
  final int divorce_count;
  @override
  final int death_count;
  final List<BirthCount> _birth_count_monthwise;
  @override
  List<BirthCount> get birth_count_monthwise {
    if (_birth_count_monthwise is EqualUnmodifiableListView)
      return _birth_count_monthwise;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_birth_count_monthwise);
  }

  @override
  final dynamic L;

  @override
  String toString() {
    return 'Dashboard(marriage_count: $marriage_count, verified_birth_count: $verified_birth_count, divorce_count: $divorce_count, death_count: $death_count, birth_count_monthwise: $birth_count_monthwise, L: $L)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Dashboard &&
            (identical(other.marriage_count, marriage_count) ||
                other.marriage_count == marriage_count) &&
            (identical(other.verified_birth_count, verified_birth_count) ||
                other.verified_birth_count == verified_birth_count) &&
            (identical(other.divorce_count, divorce_count) ||
                other.divorce_count == divorce_count) &&
            (identical(other.death_count, death_count) ||
                other.death_count == death_count) &&
            const DeepCollectionEquality()
                .equals(other._birth_count_monthwise, _birth_count_monthwise) &&
            const DeepCollectionEquality().equals(other.L, L));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      marriage_count,
      verified_birth_count,
      divorce_count,
      death_count,
      const DeepCollectionEquality().hash(_birth_count_monthwise),
      const DeepCollectionEquality().hash(L));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DashboardCopyWith<_$_Dashboard> get copyWith =>
      __$$_DashboardCopyWithImpl<_$_Dashboard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DashboardToJson(
      this,
    );
  }
}

abstract class _Dashboard implements Dashboard {
  const factory _Dashboard(
      {required final int marriage_count,
      required final int verified_birth_count,
      required final int divorce_count,
      required final int death_count,
      required final List<BirthCount> birth_count_monthwise,
      final dynamic L}) = _$_Dashboard;

  factory _Dashboard.fromJson(Map<String, dynamic> json) =
      _$_Dashboard.fromJson;

  @override
  int get marriage_count;
  @override
  int get verified_birth_count;
  @override
  int get divorce_count;
  @override
  int get death_count;
  @override
  List<BirthCount> get birth_count_monthwise;
  @override
  dynamic get L;
  @override
  @JsonKey(ignore: true)
  _$$_DashboardCopyWith<_$_Dashboard> get copyWith =>
      throw _privateConstructorUsedError;
}
