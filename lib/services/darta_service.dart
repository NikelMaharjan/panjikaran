
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as logDev;

import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:model/widgets/text_form_field.dart';


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

  static Future<Either<String, bool>>  postDivorce ({required Map data})async {

    final dio = Dio();

    try {
      final formData = FormData.fromMap({

        for(final m in data.entries) m.key : m.value,

        'witness_photo' : MultipartFile.fromFile((data['witness_photo'] as XFile).path, filename: (data['witness_photo'] as XFile).name)







      });
      final response = await dio.post("https://panjikaran.digitalpalika.org/api/v1/divorce-notices/", data: formData, options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Token 67a7b4b2da4fd5859d0a6c0fe7fc3b2b8b932b79'
          }
      ));
      print(response);
      return Right(true);
    } on DioException catch (err) {
      print(err.response.toString());
      return Left(err.response.toString());
    }
  }


  static Future<Either<String, bool>>  postMarriage ({required Map<String, dynamic> data})async {

    final dio = Dio();



   // print("data is ${data}");



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
            'Authorization': 'Token 67a7b4b2da4fd5859d0a6c0fe7fc3b2b8b932b79'
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