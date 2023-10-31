

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/models/birth/district.dart';
import 'package:model/models/birth/ward.dart';
part 'death.freezed.dart';
part 'death.g.dart';


@freezed
class Death with _$Death {

  @JsonSerializable(explicitToJson: true)
  const factory Death ({
    required int id,
    required String created_at,
    required Ward office_ward,
    required Ward ward,
    required Ward witness_ward,
    required District citizenship_issued_district,
    required String birth_registration_no,
    required String death_full_name_np,
    required String death_full_name_en,
    required String birth_date_bs,
    required String birth_date_ad,
    required String dead_date_bs,
    required String dead_date_ad,
    required String dead_place,
    required String address,
    required String house_no,
    required String tole,
    required String citizenship_no,
    required bool is_married,
    required String religion,
    required String cast,
    required String mother_tongue,
    required String grandfather_full_name_np,
    required String grandfather_full_name_en,
    required String father_full_name_np,
    required String father_full_name_en,
    required String mother_full_name_np,
    required String mother_full_name_en,
    required String dead_reason,
    required String witness_full_name_np,
    required String witness_full_name_en,
    required String witness_citizenship_country,
    required String witness_citizenship_no,
    required String witness_citizenship_date,



  }) = _Death;

  factory Death.fromJson(Map<String, dynamic> json) => _$DeathFromJson(json);



}