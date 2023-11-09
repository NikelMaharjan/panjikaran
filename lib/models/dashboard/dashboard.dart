

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/models/birth/district.dart';
import 'package:model/models/dashboard/birth_count.dart';
part 'dashboard.freezed.dart';
part 'dashboard.g.dart';


@freezed
class Dashboard with _$Dashboard {

  @JsonSerializable(explicitToJson: true)
  const factory Dashboard ({
    required int marriage_count,
    required int verified_birth_count,
    required int divorce_count,
    required int death_count,
    required List<BirthCount> birth_count_monthwise,


L
  }) = _Dashboard;

  factory Dashboard.fromJson(Map<String, dynamic> json) => _$DashboardFromJson(json);



}