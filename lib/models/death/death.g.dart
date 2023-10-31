// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'death.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Death _$$_DeathFromJson(Map<String, dynamic> json) => _$_Death(
      id: json['id'] as int,
      created_at: json['created_at'] as String,
      office_ward: Ward.fromJson(json['office_ward'] as Map<String, dynamic>),
      ward: Ward.fromJson(json['ward'] as Map<String, dynamic>),
      witness_ward: Ward.fromJson(json['witness_ward'] as Map<String, dynamic>),
      citizenship_issued_district: District.fromJson(
          json['citizenship_issued_district'] as Map<String, dynamic>),
      birth_registration_no: json['birth_registration_no'] as String,
      death_full_name_np: json['death_full_name_np'] as String,
      death_full_name_en: json['death_full_name_en'] as String,
      birth_date_bs: json['birth_date_bs'] as String,
      birth_date_ad: json['birth_date_ad'] as String,
      dead_date_bs: json['dead_date_bs'] as String,
      dead_date_ad: json['dead_date_ad'] as String,
      dead_place: json['dead_place'] as String,
      address: json['address'] as String,
      house_no: json['house_no'] as String,
      tole: json['tole'] as String,
      citizenship_no: json['citizenship_no'] as String,
      is_married: json['is_married'] as bool,
      religion: json['religion'] as String,
      cast: json['cast'] as String,
      mother_tongue: json['mother_tongue'] as String,
      grandfather_full_name_np: json['grandfather_full_name_np'] as String,
      grandfather_full_name_en: json['grandfather_full_name_en'] as String,
      father_full_name_np: json['father_full_name_np'] as String,
      father_full_name_en: json['father_full_name_en'] as String,
      mother_full_name_np: json['mother_full_name_np'] as String,
      mother_full_name_en: json['mother_full_name_en'] as String,
      dead_reason: json['dead_reason'] as String,
      witness_full_name_np: json['witness_full_name_np'] as String,
      witness_full_name_en: json['witness_full_name_en'] as String,
      witness_citizenship_country:
          json['witness_citizenship_country'] as String,
      witness_citizenship_no: json['witness_citizenship_no'] as String,
      witness_citizenship_date: json['witness_citizenship_date'] as String,
    );

Map<String, dynamic> _$$_DeathToJson(_$_Death instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at,
      'office_ward': instance.office_ward.toJson(),
      'ward': instance.ward.toJson(),
      'witness_ward': instance.witness_ward.toJson(),
      'citizenship_issued_district':
          instance.citizenship_issued_district.toJson(),
      'birth_registration_no': instance.birth_registration_no,
      'death_full_name_np': instance.death_full_name_np,
      'death_full_name_en': instance.death_full_name_en,
      'birth_date_bs': instance.birth_date_bs,
      'birth_date_ad': instance.birth_date_ad,
      'dead_date_bs': instance.dead_date_bs,
      'dead_date_ad': instance.dead_date_ad,
      'dead_place': instance.dead_place,
      'address': instance.address,
      'house_no': instance.house_no,
      'tole': instance.tole,
      'citizenship_no': instance.citizenship_no,
      'is_married': instance.is_married,
      'religion': instance.religion,
      'cast': instance.cast,
      'mother_tongue': instance.mother_tongue,
      'grandfather_full_name_np': instance.grandfather_full_name_np,
      'grandfather_full_name_en': instance.grandfather_full_name_en,
      'father_full_name_np': instance.father_full_name_np,
      'father_full_name_en': instance.father_full_name_en,
      'mother_full_name_np': instance.mother_full_name_np,
      'mother_full_name_en': instance.mother_full_name_en,
      'dead_reason': instance.dead_reason,
      'witness_full_name_np': instance.witness_full_name_np,
      'witness_full_name_en': instance.witness_full_name_en,
      'witness_citizenship_country': instance.witness_citizenship_country,
      'witness_citizenship_no': instance.witness_citizenship_no,
      'witness_citizenship_date': instance.witness_citizenship_date,
    };
