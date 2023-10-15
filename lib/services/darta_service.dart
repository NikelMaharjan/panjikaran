
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:model/models/user.dart';
import 'dart:developer' as logDev;


class DartaService {


  static Future<Either<String, bool>> postBirth({required Map data}) async {
    final dio = Dio();



    try {
      final response = await dio.post("https://panjikaran.digitalpalika.org/api/v1/birth-notices/",
          data: data,
          options: Options(
              headers: {
                'Accept': 'application/json',
                 'Authorization' : 'Token 67a7b4b2da4fd5859d0a6c0fe7fc3b2b8b932b79'
              }
          )
      );

      return Right(true);


    } on DioException catch (err) {
      print(err.response.toString());
      return Left(err.response.toString());
    }
  }

  static Future<Either<String, bool>> postDeath({required Map data}) async {
    final dio = Dio();



    try {
      final response = await dio.post("https://panjikaran.digitalpalika.org/api/v1/death-notices/",
          data: data,
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization' : 'Token 67a7b4b2da4fd5859d0a6c0fe7fc3b2b8b932b79'
              }
          )
      );

      return Right(true);


    } on DioException catch (err) {
      print(err.response.toString());
      return Left(err.response.toString());
    }
  }






}