

import 'package:freezed_annotation/freezed_annotation.dart';
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

  }) =_CommonState;



  //if need to make initialstate
  // factory CommonState.empty(){
  //   return CommonState(errText: '', isLoad: false, isSuccess: false, isError: false, user: null);
  // }



}