// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'birth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Birth _$$_BirthFromJson(Map<String, dynamic> json) => _$_Birth(
      id: json['id'] as int,
      office_ward_id: json['office_ward_id'] as int,
      father_ward_id: json['father_ward_id'] as int,
      ward_id: json['ward_id'] as int,
      name_np: json['name_np'] as String,
      name_en: json['name_en'] as String,
      birth_date_np: json['birth_date_np'] as String,
      birth_date_en: json['birth_date_en'] as String,
      birth_place: json['birth_place'] as String,
      birth_assistant: json['birth_assistant'] as String,
      gender: json['gender'] as String,
      ethnicity: json['ethnicity'] as String,
      birth_type: json['birth_type'] as String,
      is_disable: json['is_disable'] as bool,
      details_disability: json['details_disability'] as String?,
      foreign_address_np: json['foreign_address_np'] as String,
      foreign_address_en: json['foreign_address_en'] as String,
      grandfather_first_name: json['grandfather_first_name'] as String,
      grandfather_middle_name: json['grandfather_middle_name'] as String?,
      grandfather_last_name: json['grandfather_last_name'] as String,
      father_first_name: json['father_first_name'] as String,
      father_middle_name: json['father_middle_name'] as String?,
      father_last_name: json['father_last_name'] as String,
      father_street_name: json['father_street_name'] as String,
      father_tole: json['father_tole'] as String,
      father_house_no: json['father_house_no'] as String,
      father_age: json['father_age'] as String,
      father_birth_country: json['father_birth_country'] as String,
      father_citizenship_country: json['father_citizenship_country'] as String,
      father_citizenship_no: json['father_citizenship_no'] as String,
      father_issued_district: json['father_issued_district'] as int,
      father_citizenship_date: json['father_citizenship_date'] as String,
      father_passport: json['father_passport'] as String,
      father_education_status: json['father_education_status'] as String,
      father_occupation: json['father_occupation'] as String,
      father_religion: json['father_religion'] as String,
      father_mothertongue: json['father_mothertongue'] as String,
      mother_first_name: json['mother_first_name'] as String,
      mother_middle_name: json['mother_middle_name'] as String?,
      mother_last_name: json['mother_last_name'] as String,
      mother_ward_id: json['mother_ward_id'] as int,
      mother_street_name: json['mother_street_name'] as String,
      mother_tole: json['mother_tole'] as String,
      mother_house_no: json['mother_house_no'] as String,
      mother_age: json['mother_age'] as String,
      mother_birth_country: json['mother_birth_country'] as String,
      mother_citizenship_country: json['mother_citizenship_country'] as String,
      mother_citizenship_no: json['mother_citizenship_no'] as String,
      mother_issued_district: json['mother_issued_district'] as int,
      mother_citizenship_date: json['mother_citizenship_date'] as String,
      mother_passport: json['mother_passport'] as String,
      mother_education_status: json['mother_education_status'] as String,
      mother_occupation: json['mother_occupation'] as String,
      mother_religion: json['mother_religion'] as String,
      mother_mothertongue: json['mother_mothertongue'] as String,
      married_date_ad: json['married_date_ad'] as String,
      married_date_bs: json['married_date_bs'] as String,
      total_birth_child: json['total_birth_child'] as int,
      total_alive_child: json['total_alive_child'] as int,
      witness_full_name_np: json['witness_full_name_np'] as String,
      witness_full_name_en: json['witness_full_name_en'] as String,
      witness_ward: json['witness_ward'] as int,
      witness_street_name: json['witness_street_name'] as String,
      witness_tole: json['witness_tole'] as String,
      witness_house_no: json['witness_house_no'] as String,
      married_registration_no: json['married_registration_no'] as String,
      witness_birth_country: json['witness_birth_country'] as String,
      witness_citizenship_country:
          json['witness_citizenship_country'] as String,
      witness_citizenship_no: json['witness_citizenship_no'] as String,
      witness_citizenship_date: json['witness_citizenship_date'] as String,
      created_at: json['created_at'] as String,
      qr_code: json['qr_code'] as String,
      ward: Ward.fromJson(json['ward'] as Map<String, dynamic>),
      father_ward: Ward.fromJson(json['father_ward'] as Map<String, dynamic>),
      mother_ward: Ward.fromJson(json['mother_ward'] as Map<String, dynamic>),
      office_ward: Ward.fromJson(json['office_ward'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BirthToJson(_$_Birth instance) => <String, dynamic>{
      'id': instance.id,
      'office_ward_id': instance.office_ward_id,
      'father_ward_id': instance.father_ward_id,
      'ward_id': instance.ward_id,
      'name_np': instance.name_np,
      'name_en': instance.name_en,
      'birth_date_np': instance.birth_date_np,
      'birth_date_en': instance.birth_date_en,
      'birth_place': instance.birth_place,
      'birth_assistant': instance.birth_assistant,
      'gender': instance.gender,
      'ethnicity': instance.ethnicity,
      'birth_type': instance.birth_type,
      'is_disable': instance.is_disable,
      'details_disability': instance.details_disability,
      'foreign_address_np': instance.foreign_address_np,
      'foreign_address_en': instance.foreign_address_en,
      'grandfather_first_name': instance.grandfather_first_name,
      'grandfather_middle_name': instance.grandfather_middle_name,
      'grandfather_last_name': instance.grandfather_last_name,
      'father_first_name': instance.father_first_name,
      'father_middle_name': instance.father_middle_name,
      'father_last_name': instance.father_last_name,
      'father_street_name': instance.father_street_name,
      'father_tole': instance.father_tole,
      'father_house_no': instance.father_house_no,
      'father_age': instance.father_age,
      'father_birth_country': instance.father_birth_country,
      'father_citizenship_country': instance.father_citizenship_country,
      'father_citizenship_no': instance.father_citizenship_no,
      'father_issued_district': instance.father_issued_district,
      'father_citizenship_date': instance.father_citizenship_date,
      'father_passport': instance.father_passport,
      'father_education_status': instance.father_education_status,
      'father_occupation': instance.father_occupation,
      'father_religion': instance.father_religion,
      'father_mothertongue': instance.father_mothertongue,
      'mother_first_name': instance.mother_first_name,
      'mother_middle_name': instance.mother_middle_name,
      'mother_last_name': instance.mother_last_name,
      'mother_ward_id': instance.mother_ward_id,
      'mother_street_name': instance.mother_street_name,
      'mother_tole': instance.mother_tole,
      'mother_house_no': instance.mother_house_no,
      'mother_age': instance.mother_age,
      'mother_birth_country': instance.mother_birth_country,
      'mother_citizenship_country': instance.mother_citizenship_country,
      'mother_citizenship_no': instance.mother_citizenship_no,
      'mother_issued_district': instance.mother_issued_district,
      'mother_citizenship_date': instance.mother_citizenship_date,
      'mother_passport': instance.mother_passport,
      'mother_education_status': instance.mother_education_status,
      'mother_occupation': instance.mother_occupation,
      'mother_religion': instance.mother_religion,
      'mother_mothertongue': instance.mother_mothertongue,
      'married_date_ad': instance.married_date_ad,
      'married_date_bs': instance.married_date_bs,
      'total_birth_child': instance.total_birth_child,
      'total_alive_child': instance.total_alive_child,
      'witness_full_name_np': instance.witness_full_name_np,
      'witness_full_name_en': instance.witness_full_name_en,
      'witness_ward': instance.witness_ward,
      'witness_street_name': instance.witness_street_name,
      'witness_tole': instance.witness_tole,
      'witness_house_no': instance.witness_house_no,
      'married_registration_no': instance.married_registration_no,
      'witness_birth_country': instance.witness_birth_country,
      'witness_citizenship_country': instance.witness_citizenship_country,
      'witness_citizenship_no': instance.witness_citizenship_no,
      'witness_citizenship_date': instance.witness_citizenship_date,
      'created_at': instance.created_at,
      'qr_code': instance.qr_code,
      'ward': instance.ward.toJson(),
      'father_ward': instance.father_ward.toJson(),
      'mother_ward': instance.mother_ward.toJson(),
      'office_ward': instance.office_ward.toJson(),
    };
