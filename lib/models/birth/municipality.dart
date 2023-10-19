

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/models/birth/district.dart';
part 'municipality.freezed.dart';
part 'municipality.g.dart';


@freezed
class Municipality with _$Municipality {
  const factory Municipality ({
    required int id,
    required String name_en,
    required String name_np,
    required District district,
  }) = _Municipality;

  factory Municipality.fromJson(Map<String, dynamic> json) => _$MunicipalityFromJson(json);



}