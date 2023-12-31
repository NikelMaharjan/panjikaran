

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/models/birth/birth.dart';
import 'package:model/models/death/death.dart';
import 'package:model/models/divorce/divorce.dart';
import 'package:model/models/marriage/marriage.dart';
import 'package:model/models/otp.dart';
import 'package:model/models/user.dart';

part 'common_state.freezed.dart';

@freezed
class CommonState with _$CommonState{

    factory CommonState({
    required String errText,
    required bool isLoad,
    required bool isSuccess,
    required bool isError,
    Map? data,
    User? user,
    Otp? otp,
        String? token,
        List<Birth>? birth,
        List<Death>? death,
        List<Divorce>? divorce,
        List<Marriage>? marriage

  }) =_CommonState;



  //if need to make initialstate
  // factory CommonState.empty(){
  //   return CommonState(errText: '', isLoad: false, isSuccess: false, isError: false, user: null);
  // }



}