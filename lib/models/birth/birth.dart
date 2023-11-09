

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/models/birth/district.dart';
import 'package:model/models/birth/ward.dart';
part 'birth.freezed.dart';
part 'birth.g.dart';


@freezed
class Birth with _$Birth {

  @JsonSerializable(explicitToJson: true)
  const factory Birth ({
    required int id,
    required int office_ward_id,
    required int father_ward_id,
    required int ward_id,
    required String name_np,
    required String name_en,
    required String birth_date_np,
    required String birth_date_en,
    required String birth_place,
    required String birth_assistant,
    required String gender,
    required String ethnicity,
    required String birth_type,
    required bool is_disable,
    String? details_disability,
    required String foreign_address_np,
    required String foreign_address_en,
    required String grandfather_first_name,
    String? grandfather_middle_name,
    required String grandfather_last_name,
    required String father_first_name,
    String? father_middle_name,
    required String father_last_name,
    required String father_street_name,
    required String father_tole,
    required String father_house_no,
    required String father_age,
    required String father_birth_country,
    required String father_citizenship_country,
    required String father_citizenship_no,
    required int father_issued_district,
    required String father_citizenship_date,
    required String father_passport,
    required String father_education_status,
    required String father_occupation,
    required String father_religion,
    required String father_mothertongue,
    required String mother_first_name,
    String? mother_middle_name,
    required String mother_last_name,
    required int mother_ward_id,
    required String mother_street_name,
    required String mother_tole,
    required String mother_house_no,
    required String mother_age,
    required String mother_birth_country,
    required String mother_citizenship_country,
    required String mother_citizenship_no,
    required int mother_issued_district,
    required String mother_citizenship_date,
    required String mother_passport,
    required String mother_education_status,
    required String mother_occupation,
    required String mother_religion,
    required String mother_mothertongue,
    required String married_date_ad,
    required String married_date_bs,
    required int total_birth_child,
    required int total_alive_child,
    required String witness_full_name_np,
    required String witness_full_name_en,
    required int witness_ward,
    required String witness_street_name,
    required String witness_tole,
    required String witness_house_no,
    required String married_registration_no,

    required String witness_birth_country,
    required String witness_citizenship_country,
    required String witness_citizenship_no,
    required String witness_citizenship_date,
    required String created_at,
    required String qr_code,
    required Ward ward,
    required Ward father_ward,
    required Ward mother_ward,
    required Ward office_ward,


  }) = _Birth;

  factory Birth.fromJson(Map<String, dynamic> json) => _$BirthFromJson(json);



}