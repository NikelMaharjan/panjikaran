import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:model/models/otp.dart';
import 'package:model/provider/auth_provider.dart';
import 'package:model/services/auth_services.dart';
import 'package:model/services/otp_services.dart';

import '../main.dart';
import '../models/common_state/common_state.dart';




final otpStateProvider = StateNotifierProvider<OtpProvider, CommonState>((ref) => OtpProvider(CommonState(
    errText: '', isLoad: false, isSuccess: false, isError: false, user: ref.watch(authProvider).user, otp: Otp(expire_at: "", otp: 0))));


class OtpProvider extends StateNotifier<CommonState>{
  OtpProvider(super.state){
    getOtp();
    }


  Future<void> getOtp() async {
    state = state.copyWith(errText: '', isError: false, isLoad: true, isSuccess: false);
    final response = await OtpServices.getOtpToken(token: state.user!.token);
    response.fold(
            (l) {
          state =  state.copyWith(errText: l, isError: true, isLoad: false, isSuccess: false, otp: Otp(expire_at: "", otp: 0));
        },
            (r) {
          state = state.copyWith(errText: '', isError: false, isLoad: false, isSuccess: true, otp: r);
        }
    );
  }

  }




