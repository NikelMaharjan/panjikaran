

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/dummy_data.dart';
import 'package:model/models/birth/province.dart';
part 'district.freezed.dart';
part 'district.g.dart';


@freezed
class District with _$District {

  @JsonSerializable(explicitToJson: true)
  const factory District ({
    required int id,
    required String en_name,
    required String np_name,
    required Province province,
  }) = _District;

  factory District.fromJson(Map<String, dynamic> json) => _$DistrictFromJson(json);




}