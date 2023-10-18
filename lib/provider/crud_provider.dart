import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:model/services/auth_services.dart';
import 'package:model/services/darta_service.dart';

import '../main.dart';
import '../models/common_state/common_state.dart';

import 'dart:developer' as logDev;





final crudProvider = StateNotifierProvider.autoDispose<CrudProvider, CommonState>((ref) => CrudProvider(CommonState(
    errText: '', isLoad: false, isSuccess: false, isError: false, data: {} )));


class CrudProvider extends StateNotifier<CommonState>{
  CrudProvider(super.state);

  // void addBirthData({data, bool? isLastPage}){
  //
  //  state.data!.addAll(data);
  //
  //   if(isLastPage != null){
  //
  //     logDev.log("data is ${state.data}");
  //
  //
  //   }
  //
  // }


  Future<void> postBirth({required Map data}) async {

   // logDev.log("data is $data}");

    state = state.copyWith(errText: '', isError: false, isLoad: true, isSuccess: false);
    final response = await DartaService.postBirth(data: data);
    response.fold(
            (l) {
          state =  state.copyWith(errText: l, isError: true, isLoad: false, isSuccess: false);
        },
            (r) {
          state = state.copyWith(errText: '', isError: false, isLoad: false, isSuccess: r,);
        }
    );
  }

  Future<void> postDeath({required Map data}) async {

   //  logDev.log("data is $data}");

    state = state.copyWith(errText: '', isError: false, isLoad: true, isSuccess: false);
    final response = await DartaService.postDeath(data: data);
    response.fold(
            (l) {
          state =  state.copyWith(errText: l, isError: true, isLoad: false, isSuccess: false);
        },
            (r) {
          state = state.copyWith(errText: '', isError: false, isLoad: false, isSuccess: r,);
        }
    );
  }

  Future<void> postDivorce({required Map data}) async {

    //  logDev.log("data is $data}");

    state = state.copyWith(errText: '', isError: false, isLoad: true, isSuccess: false);
    final response = await DartaService.postDivorce(data: data);
    response.fold(
            (l) {
          state =  state.copyWith(errText: l, isError: true, isLoad: false, isSuccess: false);
        },
            (r) {
          state = state.copyWith(errText: '', isError: false, isLoad: false, isSuccess: r,);
        }
    );
  }

  Future<void> postMarriage({required Map<String, dynamic> data}) async {

    //  logDev.log("data is $data}");

    state = state.copyWith(errText: '', isError: false, isLoad: true, isSuccess: false);
    final response = await DartaService.postMarriage(data: data);
    response.fold(
            (l) {
          state =  state.copyWith(errText: l, isError: true, isLoad: false, isSuccess: false);
        },
            (r) {
          state = state.copyWith(errText: '', isError: false, isLoad: false, isSuccess: r,);
        }
    );
  }










}