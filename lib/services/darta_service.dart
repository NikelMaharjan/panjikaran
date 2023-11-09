
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as logDev;

import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:model/models/birth/birth.dart';
import 'package:model/models/death/death.dart';
import 'package:model/models/divorce/divorce.dart';
import 'package:model/models/marriage/marriage.dart';
import 'package:model/widgets/text_form_field.dart';


class DartaService {


  static Future<Either<String, bool>> postBirth({required Map data, required String token}) async {


    final dio = Dio();



    try {
      final response = await dio.post("https://panjikaran.digitalpalika.org/api/v1/birth-notices/",
          data: data,
          options: Options(
              headers: {
                'Accept': 'application/json',
                 'Authorization' : 'Token $token'
              }
          )
      );

      return Right(true);


    } on DioException catch (err) {
      print(err.response.toString());
      return Left(err.response.toString());
    }
  }


  static Future<Either<String, List<Birth>>> showBirth({required String token}) async {
    final dio = Dio();



    try {
      final response = await dio.get("https://panjikaran.digitalpalika.org/api/v1/birth-notices/",
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization' : 'Token $token'
              }
          )
      );

      final data = (response.data['results'] as List).map((e) => Birth.fromJson(e)).toList();

      return Right(data);


    } on DioException catch (err) {
      print(err.response.toString());
      return Left(err.response.toString());
    }
  }

  static Future<Either<String, bool>> deleteBirth({required String token, required int id}) async {
    final dio = Dio();



    try {
      final response = await dio.delete("https://panjikaran.digitalpalika.org/api/v1/birth-notices/$id/",
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization' : 'Token $token'
              }
          )
      );


      return Right(true);


    } on DioException catch (err) {
      print(err.response.toString());
      return Left(err.response.toString());
    }
  }

  static Future<Either<String, bool>> deleteDeath({required String token, required int id}) async {
    final dio = Dio();



    try {
      final response = await dio.delete("https://panjikaran.digitalpalika.org/api/v1/death-notices/$id/",
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization' : 'Token $token'
              }
          )
      );


      return Right(true);


    } on DioException catch (err) {
      print(err.response.toString());
      return Left(err.response.toString());
    }
  }


  static Future<Either<String, bool>> deleteDivorce({required String token, required int id}) async {
    final dio = Dio();



    try {
      final response = await dio.delete("https://panjikaran.digitalpalika.org/api/v1/divorce-notices/$id/",
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization' : 'Token $token'
              }
          )
      );


      return Right(true);


    } on DioException catch (err) {
      print(err.response.toString());
      return Left(err.response.toString());
    }
  }
  static Future<Either<String, bool>> deleteMarriage({required String token, required int id}) async {
    final dio = Dio();



    try {
      final response = await dio.delete("https://panjikaran.digitalpalika.org/api/v1/marriage-notices/$id/",
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization' : 'Token $token'
              }
          )
      );


      return Right(true);


    } on DioException catch (err) {
      print(err.response.toString());
      return Left(err.response.toString());
    }
  }





  static Future<Either<String, List<Death>>> showDeath({required String token}) async {
    final dio = Dio();



    try {
      final response = await dio.get("https://panjikaran.digitalpalika.org/api/v1/death-notices/",
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization' : 'Token $token'
              }
          )
      );

      final data = (response.data['results'] as List).map((e) => Death.fromJson(e)).toList();

      return Right(data);


    } on DioException catch (err) {
      print(err.response.toString());
      return Left(err.response.toString());
    }
  }

  static Future<Either<String, List<Divorce>>> showDivorce({required String token}) async {
    final dio = Dio();



    try {
      final response = await dio.get("https://panjikaran.digitalpalika.org/api/v1/divorce-notices/",
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization' : 'Token $token'
              }
          )
      );

      final data = (response.data['results'] as List).map((e) => Divorce.fromJson(e)).toList();

      return Right(data);


    } on DioException catch (err) {
      print(err.response.toString());
      return Left(err.response.toString());
    }
  }

  static Future<Either<String, List<Marriage>>> showMarriage({required String token}) async {
    final dio = Dio();



    try {
      final response = await dio.get("https://panjikaran.digitalpalika.org/api/v1/marriage-notices/",
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization' : 'Token $token'
              }
          )
      );

      final data = (response.data['results'] as List).map((e) => Marriage.fromJson(e)).toList();

      return Right(data);


    } on DioException catch (err) {
      print(err.response.toString());
      return Left(err.response.toString());
    }
  }













  static Future<Either<String, bool>> postDeath({required Map data, required String token}) async {
    final dio = Dio();


    try {
      final response = await dio.post("https://panjikaran.digitalpalika.org/api/v1/death-notices/",
          data: data,
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization' : 'Token $token'
              }
          )
      );

      return Right(true);


    } on DioException catch (err) {
      print(err.response.toString());
      return Left(err.response.toString());
    }
  }

  static Future<Either<String, bool>>  postDivorce ({required Map data, required String token})async {




    final dio = Dio();

    try {
      final formData = FormData.fromMap({

        for(final m in data.entries) m.key : m.value,

        'witness_photo' : await MultipartFile.fromFile((data['witness_photo'] as XFile).path, filename: (data['witness_photo'] as XFile).name)



      });
      final response = await dio.post("https://panjikaran.digitalpalika.org/api/v1/divorce-notices/", data: formData, options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization' : 'Token $token'
          }
      ));
      print(response);
      return Right(true);
    } on DioException catch (err) {
      print(err.response.toString());
      return Left(err.response.toString());
    }
  }


  static Future<Either<String, bool>>  postMarriage ({required Map<String, dynamic> data, required String token})async {

    final dio = Dio();






    try {
      final formData = FormData.fromMap({

        for(final m in data.entries) m.key : m.value,
        'groom_photo' : await MultipartFile.fromFile((data['groom_photo'] as XFile).path, filename:  (data['groom_photo'] as XFile).name),
        'bride_photo' : await MultipartFile.fromFile((data['bride_photo'] as XFile).path, filename:  (data['bride_photo'] as XFile).name),
        'witness_photo' : await MultipartFile.fromFile((data['witness_photo'] as XFile).path, filename:  (data['witness_photo'] as XFile).name),
      });
      final response = await dio.post("https://panjikaran.digitalpalika.org/api/v1/marriage-notices/", data: formData, options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization' : 'Token $token'
          }
      ));
      print(response);
      return Right(true);
    } on DioException catch (err) {
      logDev.log(err.response.toString());
      return Left(err.response.toString());
    }
  }








}