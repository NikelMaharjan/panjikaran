

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/models/birth/municipality.dart';
part 'ward.freezed.dart';
part 'ward.g.dart';


@freezed
class Ward with _$Ward {
  @JsonSerializable(explicitToJson: true)
  const factory Ward ({
    required int id,
    required String description,
    required Municipality municipality,
  }) = _Ward;

  factory Ward.fromJson(Map<String, dynamic> json) => _$WardFromJson(json);




}