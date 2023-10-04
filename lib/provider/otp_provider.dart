

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:model/models/otp.dart';
import 'package:model/services/otp_services.dart';

final otpProvider = FutureProvider.family.autoDispose((ref, String token) => OtpProvider.getOtp(token: token));

class OtpProvider {


  static Future<Otp> getOtp ({required String token}) async {

    final data = await OtpServices.getOtpToken(token: token);
    return data.fold((l) => throw(l), (r) => r);

  }


}