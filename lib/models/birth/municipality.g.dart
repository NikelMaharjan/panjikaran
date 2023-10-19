// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'municipality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Municipality _$$_MunicipalityFromJson(Map<String, dynamic> json) =>
    _$_Municipality(
      id: json['id'] as int,
      name_en: json['name_en'] as String,
      name_np: json['name_np'] as String,
      district: District.fromJson(json['district'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MunicipalityToJson(_$_Municipality instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.name_en,
      'name_np': instance.name_np,
      'district': instance.district,
    };
