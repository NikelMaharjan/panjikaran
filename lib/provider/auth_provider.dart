import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:model/services/auth_services.dart';

import '../main.dart';
import '../models/common_state/common_state.dart';




final authProvider = StateNotifierProvider<AuthProvider, CommonState>((ref) => AuthProvider(CommonState(
    errText: '', isLoad: false, isSuccess: false, isError: false, user: ref.watch(box))));


class AuthProvider extends StateNotifier<CommonState>{
  AuthProvider(super.state);


  Future<void> userLogin({required String phone_number, required String password}) async {
    state = state.copyWith(errText: '', isError: false, isLoad: true, isSuccess: false);
    final response = await AuthService.userLogin(phone_number: phone_number, password: password);
    response.fold(
            (l) {
          state =  state.copyWith(errText: l, isError: true, isLoad: false, isSuccess: false);
        },
            (r) {
          state = state.copyWith(errText: '', isError: false, isLoad: false, isSuccess: true, user: r,);
        }
    );
  }

  Future<void> userSignUp({
    required String username,
    required String first_name,
    required String last_name,
    required String phone_number,
    required String password,
    required String confirm_password,

  }) async {
    state = state.copyWith(errText: '', isError: false, isLoad: true, isSuccess: false);
    final response = await AuthService.userSignUp(
        phone_number: phone_number,
        password: password,
        confirm_password: confirm_password,
        first_name: first_name,
        last_name: last_name,
        username: username
    );
    response.fold(
            (l) {
          state =  state.copyWith(errText: l, isError: true, isLoad: false, isSuccess: false);
        },
            (r) {
          state = state.copyWith(errText: '', isError: false, isLoad: false, isSuccess: r,);
        }
    );
  }



  void userLogOut(){
    Hive.box<String?>('user').clear();
    state = state.copyWith(user: null);
  }



}