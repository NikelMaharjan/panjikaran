
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:model/models/otp.dart';


//final OtpProvider = FutureProvider.family.autoDispose((ref, String token) => OtpServices.getOtpToken(token: token));

class OtpServices {

  // static Stream<Otp> getOtpToken({required String token}) async* {
  //   final dio = Dio();
  //
  //   // try{
  //   //   final response = await dio.post("https://panjikaran.digitalpalika.org/api/v1/auth/otp/resend",
  //   //       options: Options(
  //   //           headers: {
  //   //             'Accept': 'application/json',
  //   //             'Authorization' : 'Token $token'
  //   //           }
  //   //       )
  //   //   );
  //   //   final data = Otp.fromJson(response.data);
  //   //   yield data;
  //   //
  //   // }
  //   //
  //   // on DioException catch (err) {
  //   //   throw err.response.toString();
  //   // }
  //
  //   while (true) {
  //     await Future.delayed(Duration(milliseconds: 30000));
  //    // print("something");
  //     try{
  //       final response = await dio.post("https://panjikaran.digitalpalika.org/api/v1/auth/otp/resend",
  //           options: Options(
  //               headers: {
  //                 'Accept': 'application/json',
  //                 'Authorization' : 'Token $token'
  //               }
  //           )
  //       );
  //       final data = Otp.fromJson(response.data);
  //       yield data;
  //
  //     }
  //     on DioException catch (err) {
  //       throw err.response.toString();
  //     }
  //   }
  // }


  static Future <Either<String, Otp>> getOtpToken ({required String token}) async {
    final dio = Dio();

    try{
      final response = await dio.post("https://panjikaran.digitalpalika.org/api/v1/auth/otp/resend",
          options: Options(
              headers: {
                'Accept': 'application/json',
                 'Authorization' : 'Token $token'
              }
          )
      );
      final data = Otp.fromJson(response.data);
      return right(data);

    }
    on DioException catch (err) {
      return Left(err.response.toString());
    }



  }





}