import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:model/provider/auth_provider.dart';
import 'package:model/services/auth_services.dart';
import 'package:model/services/darta_service.dart';

import '../main.dart';
import '../models/common_state/common_state.dart';

import 'dart:developer' as logDev;





final crudProvider = StateNotifierProvider<CrudProvider, CommonState>((ref) => CrudProvider(CommonState(
    errText: '',
    isLoad: false,
    isSuccess: false,
    isError: false,
    data: {},
    birth: [],
    death: [],
    divorce: [],
    token: ref.watch(authProvider).user!.token

)));


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


  void RemoveBirth (int index){

    state.birth!.removeAt(index);


  }




  Future<void> postBirth({required Map data}) async {


    state = state.copyWith(errText: '', isError: false, isLoad: true, isSuccess: false);
    final response = await DartaService.postBirth(data: data, token: state.token!);
    response.fold(
            (l) {
          state =  state.copyWith(errText: l, isError: true, isLoad: false, isSuccess: false);
        },
            (r) {
          state = state.copyWith(errText: '', isError: false, isLoad: false, isSuccess: r,);
        }
    );
  }


  Future<void> showBirth() async {


    state = state.copyWith(errText: '', isError: false, isLoad: true, isSuccess: false);
    final response = await DartaService.showBirth(token: state.token!);
    response.fold(
            (l) {
          state =  state.copyWith(errText: l, isError: true, isLoad: false, isSuccess: false);
        },
            (r) {
          state = state.copyWith(errText: '', isError: false, isLoad: false, isSuccess: true, birth: r);
        }
    );
  }




  Future<void> postDeath({required Map data}) async {


    state = state.copyWith(errText: '', isError: false, isLoad: true, isSuccess: false);
    final response = await DartaService.postDeath(data: data, token: state.token!);
    response.fold(
            (l) {
          state =  state.copyWith(errText: l, isError: true, isLoad: false, isSuccess: false);
        },
            (r) {
          state = state.copyWith(errText: '', isError: false, isLoad: false, isSuccess: r,);
        }
    );
  }


  Future<void> showDeath() async {

    state = state.copyWith(errText: '', isError: false, isLoad: true, isSuccess: false);
    final response = await DartaService.showDeath(token: state.token!);
    response.fold(
            (l) {
          state =  state.copyWith(errText: l, isError: true, isLoad: false, isSuccess: false);
        },
            (r) {
          state = state.copyWith(errText: '', isError: false, isLoad: false, isSuccess: true, death: r);
        }
    );
  }



  Future<void> showDivorce() async {

    state = state.copyWith(errText: '', isError: false, isLoad: true, isSuccess: false);
    final response = await DartaService.showDivorce(token: state.token!);
    response.fold(
            (l) {
          state =  state.copyWith(errText: l, isError: true, isLoad: false, isSuccess: false);
        },
            (r) {
          state = state.copyWith(errText: '', isError: false, isLoad: false, isSuccess: true, divorce: r);
        }
    );
  }


  Future<void> showMarriage() async {

    state = state.copyWith(errText: '', isError: false, isLoad: true, isSuccess: false);
    final response = await DartaService.showMarriage(token: state.token!);
    response.fold(
            (l) {
          state =  state.copyWith(errText: l, isError: true, isLoad: false, isSuccess: false);
        },
            (r) {
          state = state.copyWith(errText: '', isError: false, isLoad: false, isSuccess: true, marriage: r);
        }
    );
  }


  Future<void> postDivorce({required Map data}) async {

    state = state.copyWith(errText: '', isError: false, isLoad: true, isSuccess: false);
    final response = await DartaService.postDivorce(data: data, token: state.token!);
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


    state = state.copyWith(errText: '', isError: false, isLoad: true, isSuccess: false);
    final response = await DartaService.postMarriage(data: data, token: state.token!);
    response.fold(
            (l) {
          state =  state.copyWith(errText: l, isError: true, isLoad: false, isSuccess: false);
        },
            (r) {
          state = state.copyWith(errText: '', isError: false, isLoad: false, isSuccess: r,);
        }
    );
  }


  Future<void> deleteBirth({required int id}) async {


    state = state.copyWith(errText: '', isError: false, isLoad: true, isSuccess: false);
    final response = await DartaService.deleteBirth(token: state.token!, id: id);
    response.fold(
            (l) {
          state =  state.copyWith(errText: l, isError: true, isLoad: false, isSuccess: false);
        },
            (r) {
          state = state.copyWith(errText: '', isError: false, isLoad: false, isSuccess: r,);
        }
    );

    showBirth();

  }

  Future<void> deleteDeath({required int id}) async {


    state = state.copyWith(errText: '', isError: false, isLoad: true, isSuccess: false);
    final response = await DartaService.deleteDeath(token: state.token!, id: id);
    response.fold(
            (l) {
          state =  state.copyWith(errText: l, isError: true, isLoad: false, isSuccess: false);
        },
            (r) {
          state = state.copyWith(errText: '', isError: false, isLoad: false, isSuccess: r,);
        }
    );

    showDeath();

  }


  Future<void> deleteDivorce({required int id}) async {


    state = state.copyWith(errText: '', isError: false, isLoad: true, isSuccess: false);
    final response = await DartaService.deleteDivorce(token: state.token!, id: id);
    response.fold(
            (l) {
          state =  state.copyWith(errText: l, isError: true, isLoad: false, isSuccess: false);
        },
            (r) {
          state = state.copyWith(errText: '', isError: false, isLoad: false, isSuccess: r,);
        }
    );

    showDivorce();

  }


  Future<void> deleteMarriage({required int id}) async {


    state = state.copyWith(errText: '', isError: false, isLoad: true, isSuccess: false);
    final response = await DartaService.deleteMarriage(token: state.token!, id: id);
    response.fold(
            (l) {
          state =  state.copyWith(errText: l, isError: true, isLoad: false, isSuccess: false);
        },
            (r) {
          state = state.copyWith(errText: '', isError: false, isLoad: false, isSuccess: r,);
        }
    );

    showMarriage();

  }












}