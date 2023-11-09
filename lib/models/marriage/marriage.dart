

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/models/birth/district.dart';
import 'package:model/models/birth/ward.dart';
part 'marriage.freezed.dart';
part 'marriage.g.dart';


@freezed
class Marriage with _$Marriage {

  @JsonSerializable(explicitToJson: true)
  const factory Marriage ({
    required int id,
    required String created_at,
    required Ward office_ward,
    required Ward married_ward,
    required Ward groom_ward,
    required Ward bride_ward,
    required Ward witness_ward,
    required bool is_social_tradtion,
    required bool is_law,
    required String married_date_bs,
    required String married_date_ad,
    required String married_street_name,
    required String married_tole,
    required String married_house_no,
    required String married_address_np,
    required String married_address_en,
    required String groom_full_name_np,
    required String groom_full_name_en,
    required String groom_birth_date,
    required bool is_groom_married,
    required String groom_education_status,
    required String groom_occupation,
    required String groom_religion,
    required String groom_mother_tongue,
    required String groom_street_name,
    required String groom_tole,
    required String groom_house_no,
    required String groom_birth_country,
    required String groom_citizenship_country,
    required String groom_citizenship_no,
    required String groom_citizenship_date,
    required String groom_address,
    required String groom_grand_father_en,
    required String groom_grand_father_np,
    required String groom_father_name_en,
    required String groom_father_name_np,
    required String groom_mother_name_en,
    required String groom_mother_name_np,
    required String groom_photo,
    required String bride_full_name_np,
    required String bride_full_name_en,
    required String bride_birth_date,
    required bool is_bride_married,
    required String bride_education_status,
    required String bride_occupation,
    required String bride_religion,
    required String bride_mother_tongue,
    required String bride_street_name,
    required String bride_tole,
    required String bride_house_no,
    required String bride_birth_country,
    required String bride_citizenship_country,
    required String bride_citizenship_no,
    required String bride_citizenship_date,
    required String bride_address,
    required String bride_grand_father_en,
    required String bride_grand_father_np,
    required String bride_father_name_en,
    required String bride_father_name_np,
    required String bride_mother_name_en,
    required String bride_mother_name_np,
    required String bride_photo,
    required String witness_full_name_np,
    required String witness_full_name_en,
    required String witness_street_name,
    required String witness_tole,
    required String witness_house_no,
    required String witness_birth_country,
    required String witness_citizenship_country,
    required String witness_citizenship_no,
    required String witness_citizenship_date,
    required String witness_photo,











  }) = _Marriage;

  factory Marriage.fromJson(Map<String, dynamic> json) => _$MarriageFromJson(json);



}