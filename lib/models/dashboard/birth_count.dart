

import 'package:freezed_annotation/freezed_annotation.dart';
part 'birth_count.freezed.dart';
part 'birth_count.g.dart';


@freezed
class BirthCount with _$BirthCount {
  const factory BirthCount ({
    required String month,
    required int count,
  }) = _BirthCount;

  factory BirthCount.fromJson(Map<String, dynamic> json) => _$BirthCountFromJson(json);




}