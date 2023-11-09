// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Dashboard _$$_DashboardFromJson(Map<String, dynamic> json) => _$_Dashboard(
      marriage_count: json['marriage_count'] as int,
      verified_birth_count: json['verified_birth_count'] as int,
      divorce_count: json['divorce_count'] as int,
      death_count: json['death_count'] as int,
      birth_count_monthwise: (json['birth_count_monthwise'] as List<dynamic>)
          .map((e) => BirthCount.fromJson(e as Map<String, dynamic>))
          .toList(),
      L: json['L'],
    );

Map<String, dynamic> _$$_DashboardToJson(_$_Dashboard instance) =>
    <String, dynamic>{
      'marriage_count': instance.marriage_count,
      'verified_birth_count': instance.verified_birth_count,
      'divorce_count': instance.divorce_count,
      'death_count': instance.death_count,
      'birth_count_monthwise':
          instance.birth_count_monthwise.map((e) => e.toJson()).toList(),
      'L': instance.L,
    };
