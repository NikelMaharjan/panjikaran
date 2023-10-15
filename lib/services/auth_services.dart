
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:model/models/user.dart';
import 'dart:developer' as logDev;


class AuthService {


  static Future<Either<String, User>> userLogin({required String phone_number, required String password}) async {
    final dio = Dio();
    final fcm_token = Hive.box<String?>('fcm_token');
    final token  = fcm_token.get('fcm_token');
    // print("fcm_token is $token");
    // logDev.log(token!);



    try {
      final response = await dio.post("https://panjikaran.digitalpalika.org/api/v1/auth/login/",
          data: {
            'phone_number': "+977$phone_number",
            'password': password,
            'fcm_token': token
          },
          options: Options(
              headers: {
                'Accept': 'application/json'
              }
          )
      );

      final user = Hive.box<String?>('user');
      user.put('userInfo', jsonEncode(response.data));

      final phone = Hive.box<String?>('phone_number');
      phone.put('phone_number', phone_number);


      if(response.data["token"] != null){

        final token = Hive.box<String?>('token');
        token.put('token', response.data['token']);

        return Right(User.fromJson(response.data));
      }
      else{
        return left(response.data.toString());
      }

    } on DioException catch (err) {
      print(err.response);
      return Left(err.response.toString());
    }
  }


  static Future<Either<String, bool>> userSignUp({
    required String username,
    required String first_name,
    required String last_name,
    required String phone_number,
    required String password,
    required String confirm_password,
  }) async {
    final dio = Dio();
    try {
      final response = await dio.post("https://panjikaran.digitalpalika.org/api/v1/auth/register/",
          data: {
            'phone_number': "+977$phone_number",
            'password': password,
            'username': username,
            'first_name': first_name,
            'last_name': last_name,
            'confirm_password': confirm_password,
          },
          options: Options(
              headers: {
                'Accept': 'application/json'
              }
          ));


      if(response.data["detail"] != null){
        return Right(true);
      }
      else{
        return left(response.data.toString());
      }

    } on DioException catch (err) {
      return Left(err.response.toString());
    }
  }


}