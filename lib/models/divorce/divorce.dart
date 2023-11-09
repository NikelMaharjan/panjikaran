

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/models/birth/district.dart';
import 'package:model/models/birth/ward.dart';
part 'divorce.freezed.dart';
part 'divorce.g.dart';


@freezed
class Divorce with _$Divorce {

  @JsonSerializable(explicitToJson: true)
  const factory Divorce ({
    required int id,
    required String created_at,
    required Ward office_ward,
    required Ward husband_ward,
    required Ward wife_ward,
    required Ward witness_ward,
    required String court_type,
    required String court_decission_no,
    required String court_decission_date,
    required String married_registration_no,
    required String married_date_bs,
    required String married_date_ad,
    required String children_with,
    required String husband_full_name_np,
    required String husband_full_name_en,
    required String husband_birth_date,
    required String husband_birth_registration_no,
    required String husband_religion,
    required String husband_birth_country,
    required String husband_citizenship_no,
    required String husband_citizenship_date,
    required String husband_issued_date,
    required String husband_citizenship_country,
    required String husband_street_name,
    required String husband_father_name_en,
    required String husband_father_name_np,
    required String husband_tole,
    required String husband_house_no,
    required String husband_education_status,
    required String husband_mother_tongue,
    required String husband_grand_father_en,
    required String husband_grand_father_np,
    required String husband_mother_name_en,
    required String husband_mother_name_np,
    required String husband_address,
    required String wife_full_name_np,
    required String wife_full_name_en,
    required String wife_birth_date,
    required String wife_education_status,
    required String wife_religion,
    required String wife_mother_tongue,
    required String wife_street_name,
    required String wife_tole,
    required String wife_house_no,
    required String wife_birth_country,
    required String wife_citizenship_country,
    required String wife_citizenship_no,
    required String wife_citizenship_date,
    required String wife_address,
    required String wife_grand_father_en,
    required String wife_grand_father_np,
    required String wife_father_name_en,
    required String wife_father_name_np,
    required String wife_mother_name_en,
    required String wife_mother_name_np,
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







  }) = _Divorce;

  factory Divorce.fromJson(Map<String, dynamic> json) => _$DivorceFromJson(json);



}