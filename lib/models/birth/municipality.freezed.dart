// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'municipality.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Municipality _$MunicipalityFromJson(Map<String, dynamic> json) {
  return _Municipality.fromJson(json);
}

/// @nodoc
mixin _$Municipality {
  int get id => throw _privateConstructorUsedError;
  String get name_en => throw _privateConstructorUsedError;
  String get name_np => throw _privateConstructorUsedError;
  District get district => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MunicipalityCopyWith<Municipality> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MunicipalityCopyWith<$Res> {
  factory $MunicipalityCopyWith(
          Municipality value, $Res Function(Municipality) then) =
      _$MunicipalityCopyWithImpl<$Res, Municipality>;
  @useResult
  $Res call({int id, String name_en, String name_np, District district});

  $DistrictCopyWith<$Res> get district;
}

/// @nodoc
class _$MunicipalityCopyWithImpl<$Res, $Val extends Municipality>
    implements $MunicipalityCopyWith<$Res> {
  _$MunicipalityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name_en = null,
    Object? name_np = null,
    Object? district = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name_en: null == name_en
          ? _value.name_en
          : name_en // ignore: cast_nullable_to_non_nullable
              as String,
      name_np: null == name_np
          ? _value.name_np
          : name_np // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DistrictCopyWith<$Res> get district {
    return $DistrictCopyWith<$Res>(_value.district, (value) {
      return _then(_value.copyWith(district: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MunicipalityCopyWith<$Res>
    implements $MunicipalityCopyWith<$Res> {
  factory _$$_MunicipalityCopyWith(
          _$_Municipality value, $Res Function(_$_Municipality) then) =
      __$$_MunicipalityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name_en, String name_np, District district});

  @override
  $DistrictCopyWith<$Res> get district;
}

/// @nodoc
class __$$_MunicipalityCopyWithImpl<$Res>
    extends _$MunicipalityCopyWithImpl<$Res, _$_Municipality>
    implements _$$_MunicipalityCopyWith<$Res> {
  __$$_MunicipalityCopyWithImpl(
      _$_Municipality _value, $Res Function(_$_Municipality) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name_en = null,
    Object? name_np = null,
    Object? district = null,
  }) {
    return _then(_$_Municipality(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name_en: null == name_en
          ? _value.name_en
          : name_en // ignore: cast_nullable_to_non_nullable
              as String,
      name_np: null == name_np
          ? _value.name_np
          : name_np // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Municipality implements _Municipality {
  const _$_Municipality(
      {required this.id,
      required this.name_en,
      required this.name_np,
      required this.district});

  factory _$_Municipality.fromJson(Map<String, dynamic> json) =>
      _$$_MunicipalityFromJson(json);

  @override
  final int id;
  @override
  final String name_en;
  @override
  final String name_np;
  @override
  final District district;

  @override
  String toString() {
    return 'Municipality(id: $id, name_en: $name_en, name_np: $name_np, district: $district)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Municipality &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name_en, name_en) || other.name_en == name_en) &&
            (identical(other.name_np, name_np) || other.name_np == name_np) &&
            (identical(other.district, district) ||
                other.district == district));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name_en, name_np, district);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MunicipalityCopyWith<_$_Municipality> get copyWith =>
      __$$_MunicipalityCopyWithImpl<_$_Municipality>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MunicipalityToJson(
      this,
    );
  }
}

abstract class _Municipality implements Municipality {
  const factory _Municipality(
      {required final int id,
      required final String name_en,
      required final String name_np,
      required final District district}) = _$_Municipality;

  factory _Municipality.fromJson(Map<String, dynamic> json) =
      _$_Municipality.fromJson;

  @override
  int get id;
  @override
  String get name_en;
  @override
  String get name_np;
  @override
  District get district;
  @override
  @JsonKey(ignore: true)
  _$$_MunicipalityCopyWith<_$_Municipality> get copyWith =>
      throw _privateConstructorUsedError;
}
