// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marriage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Marriage _$$_MarriageFromJson(Map<String, dynamic> json) => _$_Marriage(
      id: json['id'] as int,
      created_at: json['created_at'] as String,
      office_ward: Ward.fromJson(json['office_ward'] as Map<String, dynamic>),
      married_ward: Ward.fromJson(json['married_ward'] as Map<String, dynamic>),
      groom_ward: Ward.fromJson(json['groom_ward'] as Map<String, dynamic>),
      bride_ward: Ward.fromJson(json['bride_ward'] as Map<String, dynamic>),
      witness_ward: Ward.fromJson(json['witness_ward'] as Map<String, dynamic>),
      is_social_tradtion: json['is_social_tradtion'] as bool,
      is_law: json['is_law'] as bool,
      married_date_bs: json['married_date_bs'] as String,
      married_date_ad: json['married_date_ad'] as String,
      married_street_name: json['married_street_name'] as String,
      married_tole: json['married_tole'] as String,
      married_house_no: json['married_house_no'] as String,
      married_address_np: json['married_address_np'] as String,
      married_address_en: json['married_address_en'] as String,
      groom_full_name_np: json['groom_full_name_np'] as String,
      groom_full_name_en: json['groom_full_name_en'] as String,
      groom_birth_date: json['groom_birth_date'] as String,
      is_groom_married: json['is_groom_married'] as bool,
      groom_education_status: json['groom_education_status'] as String,
      groom_occupation: json['groom_occupation'] as String,
      groom_religion: json['groom_religion'] as String,
      groom_mother_tongue: json['groom_mother_tongue'] as String,
      groom_street_name: json['groom_street_name'] as String,
      groom_tole: json['groom_tole'] as String,
      groom_house_no: json['groom_house_no'] as String,
      groom_birth_country: json['groom_birth_country'] as String,
      groom_citizenship_country: json['groom_citizenship_country'] as String,
      groom_citizenship_no: json['groom_citizenship_no'] as String,
      groom_citizenship_date: json['groom_citizenship_date'] as String,
      groom_address: json['groom_address'] as String,
      groom_grand_father_en: json['groom_grand_father_en'] as String,
      groom_grand_father_np: json['groom_grand_father_np'] as String,
      groom_father_name_en: json['groom_father_name_en'] as String,
      groom_father_name_np: json['groom_father_name_np'] as String,
      groom_mother_name_en: json['groom_mother_name_en'] as String,
      groom_mother_name_np: json['groom_mother_name_np'] as String,
      groom_photo: json['groom_photo'] as String,
      bride_full_name_np: json['bride_full_name_np'] as String,
      bride_full_name_en: json['bride_full_name_en'] as String,
      bride_birth_date: json['bride_birth_date'] as String,
      is_bride_married: json['is_bride_married'] as bool,
      bride_education_status: json['bride_education_status'] as String,
      bride_occupation: json['bride_occupation'] as String,
      bride_religion: json['bride_religion'] as String,
      bride_mother_tongue: json['bride_mother_tongue'] as String,
      bride_street_name: json['bride_street_name'] as String,
      bride_tole: json['bride_tole'] as String,
      bride_house_no: json['bride_house_no'] as String,
      bride_birth_country: json['bride_birth_country'] as String,
      bride_citizenship_country: json['bride_citizenship_country'] as String,
      bride_citizenship_no: json['bride_citizenship_no'] as String,
      bride_citizenship_date: json['bride_citizenship_date'] as String,
      bride_address: json['bride_address'] as String,
      bride_grand_father_en: json['bride_grand_father_en'] as String,
      bride_grand_father_np: json['bride_grand_father_np'] as String,
      bride_father_name_en: json['bride_father_name_en'] as String,
      bride_father_name_np: json['bride_father_name_np'] as String,
      bride_mother_name_en: json['bride_mother_name_en'] as String,
      bride_mother_name_np: json['bride_mother_name_np'] as String,
      bride_photo: json['bride_photo'] as String,
      witness_full_name_np: json['witness_full_name_np'] as String,
      witness_full_name_en: json['witness_full_name_en'] as String,
      witness_street_name: json['witness_street_name'] as String,
      witness_tole: json['witness_tole'] as String,
      witness_house_no: json['witness_house_no'] as String,
      witness_birth_country: json['witness_birth_country'] as String,
      witness_citizenship_country:
          json['witness_citizenship_country'] as String,
      witness_citizenship_no: json['witness_citizenship_no'] as String,
      witness_citizenship_date: json['witness_citizenship_date'] as String,
      witness_photo: json['witness_photo'] as String,
    );

Map<String, dynamic> _$$_MarriageToJson(_$_Marriage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at,
      'office_ward': instance.office_ward.toJson(),
      'married_ward': instance.married_ward.toJson(),
      'groom_ward': instance.groom_ward.toJson(),
      'bride_ward': instance.bride_ward.toJson(),
      'witness_ward': instance.witness_ward.toJson(),
      'is_social_tradtion': instance.is_social_tradtion,
      'is_law': instance.is_law,
      'married_date_bs': instance.married_date_bs,
      'married_date_ad': instance.married_date_ad,
      'married_street_name': instance.married_street_name,
      'married_tole': instance.married_tole,
      'married_house_no': instance.married_house_no,
      'married_address_np': instance.married_address_np,
      'married_address_en': instance.married_address_en,
      'groom_full_name_np': instance.groom_full_name_np,
      'groom_full_name_en': instance.groom_full_name_en,
      'groom_birth_date': instance.groom_birth_date,
      'is_groom_married': instance.is_groom_married,
      'groom_education_status': instance.groom_education_status,
      'groom_occupation': instance.groom_occupation,
      'groom_religion': instance.groom_religion,
      'groom_mother_tongue': instance.groom_mother_tongue,
      'groom_street_name': instance.groom_street_name,
      'groom_tole': instance.groom_tole,
      'groom_house_no': instance.groom_house_no,
      'groom_birth_country': instance.groom_birth_country,
      'groom_citizenship_country': instance.groom_citizenship_country,
      'groom_citizenship_no': instance.groom_citizenship_no,
      'groom_citizenship_date': instance.groom_citizenship_date,
      'groom_address': instance.groom_address,
      'groom_grand_father_en': instance.groom_grand_father_en,
      'groom_grand_father_np': instance.groom_grand_father_np,
      'groom_father_name_en': instance.groom_father_name_en,
      'groom_father_name_np': instance.groom_father_name_np,
      'groom_mother_name_en': instance.groom_mother_name_en,
      'groom_mother_name_np': instance.groom_mother_name_np,
      'groom_photo': instance.groom_photo,
      'bride_full_name_np': instance.bride_full_name_np,
      'bride_full_name_en': instance.bride_full_name_en,
      'bride_birth_date': instance.bride_birth_date,
      'is_bride_married': instance.is_bride_married,
      'bride_education_status': instance.bride_education_status,
      'bride_occupation': instance.bride_occupation,
      'bride_religion': instance.bride_religion,
      'bride_mother_tongue': instance.bride_mother_tongue,
      'bride_street_name': instance.bride_street_name,
      'bride_tole': instance.bride_tole,
      'bride_house_no': instance.bride_house_no,
      'bride_birth_country': instance.bride_birth_country,
      'bride_citizenship_country': instance.bride_citizenship_country,
      'bride_citizenship_no': instance.bride_citizenship_no,
      'bride_citizenship_date': instance.bride_citizenship_date,
      'bride_address': instance.bride_address,
      'bride_grand_father_en': instance.bride_grand_father_en,
      'bride_grand_father_np': instance.bride_grand_father_np,
      'bride_father_name_en': instance.bride_father_name_en,
      'bride_father_name_np': instance.bride_father_name_np,
      'bride_mother_name_en': instance.bride_mother_name_en,
      'bride_mother_name_np': instance.bride_mother_name_np,
      'bride_photo': instance.bride_photo,
      'witness_full_name_np': instance.witness_full_name_np,
      'witness_full_name_en': instance.witness_full_name_en,
      'witness_street_name': instance.witness_street_name,
      'witness_tole': instance.witness_tole,
      'witness_house_no': instance.witness_house_no,
      'witness_birth_country': instance.witness_birth_country,
      'witness_citizenship_country': instance.witness_citizenship_country,
      'witness_citizenship_no': instance.witness_citizenship_no,
      'witness_citizenship_date': instance.witness_citizenship_date,
      'witness_photo': instance.witness_photo,
    };