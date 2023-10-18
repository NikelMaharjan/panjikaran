
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
        'court_type': data['court_type'],
        'court_decission_no': data['court_decission_no'],
        'court_decission_date': data['court_decission_date'],
        'married_registration_no': data['married_registration_no'],
        'married_date_bs': data['married_date_bs'],
        'married_date_ad': data['married_date_ad'],
        'children_with': data['children_with'],
        'husband_full_name_np': data['husband_full_name_np'],
        'husband_full_name_en': data['husband_full_name_en'],
        'husband_birth_date': data['husband_birth_date'],
        'husband_birth_registration_no': data['husband_birth_registration_no'],
        'husband_religion': data['husband_religion'],
        'husband_birth_country': data['husband_birth_country'],
        'husband_citizenship_date': data['husband_citizenship_date'],
        'husband_issued_date': data['husband_issued_date'],
        'husband_citizenship_country': data['husband_citizenship_country'],
        'husband_street_name': data['husband_street_name'],
        'husband_tole': data['husband_tole'],
        'husband_house_no': data['husband_house_no'],
        'husband_education_status': data['husband_education_status'],
        'husband_mother_tongue': data['husband_mother_tongue'],
        'husband_grand_father_en': data['husband_grand_father_en'],
        'husband_grand_father_np': data['husband_grand_father_np'],
        'husband_father_name_en': data['husband_father_name_en'],
        'husband_father_name_np': data['husband_father_name_np'],
        'husband_mother_name_en': data['husband_mother_name_en'],
        'husband_mother_name_np': data['husband_mother_name_np'],
        'husband_address': data['husband_address'],
        'wife_full_name_np': data['wife_full_name_np'],
        'wife_full_name_en': data['wife_full_name_en'],
        'wife_birth_date': data['wife_birth_date'],
        'wife_education_status': data['wife_education_status'],
        'wife_religion': data['wife_religion'],
        'wife_mother_tongue': data['wife_mother_tongue'],
        'wife_street_name': data['wife_street_name'],
        'wife_tole': data['wife_tole'],
        'wife_house_no': data['wife_house_no'],
        'wife_birth_country': data['wife_birth_country'],
        'wife_citizenship_country': data['wife_citizenship_country'],
        'wife_citizenship_no': data['wife_citizenship_no'],
        'wife_citizenship_date': data['wife_citizenship_date'],
        'wife_address': data['wife_address'],
        'wife_grand_father_en': data['wife_grand_father_en'],
        'wife_grand_father_np': data['wife_grand_father_np'],
        'wife_father_name_en': data['wife_father_name_en'],
        'wife_father_name_np': data['wife_father_name_np'],
        'wife_mother_name_en': data['wife_mother_name_en'],
        'wife_mother_name_np': data['wife_mother_name_np'],
        'witness_street_name': data['witness_street_name'],
        'witness_tole': data['witness_tole'],
        'witness_house_no': data['witness_house_no'],
        'witness_birth_country': data['witness_birth_country'],
        'witness_citizenship_date': data['witness_citizenship_date'],
        'witness_citizenship_no': data['witness_citizenship_no'],
        'witness_citizenship_country': data['witness_citizenship_country'],
        'witness_full_name_en': data['witness_full_name_en'],
        'witness_full_name_np': data['witness_full_name_np'],
        'husband_ward_id': data['husband_ward_id'],
        'wife_ward_id': data['wife_ward_id'],
        'office_ward_id': data['office_ward_id'],
        'witness_ward_id': data['witness_ward_id'],
        'husband_issued_district_id': data['husband_issued_district_id'],
        'wife_issued_district': data['wife_issued_district'],

        'witness_photo':  await MultipartFile.fromFile((data['witness_photo'] as XFile).path, filename: (data['witness_photo'] as XFile).name),
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
      }



    );
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