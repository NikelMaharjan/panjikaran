// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ward.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ward _$$_WardFromJson(Map<String, dynamic> json) => _$_Ward(
      id: json['id'] as int,
      description: json['description'] as String,
      municipality:
          Municipality.fromJson(json['municipality'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WardToJson(_$_Ward instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'municipality': instance.municipality.toJson(),
    };
