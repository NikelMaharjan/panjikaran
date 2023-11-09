
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as logDev;

import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:model/models/birth/birth.dart';
import 'package:model/models/dashboard/dashboard.dart';
import 'package:model/models/death/death.dart';
import 'package:model/models/divorce/divorce.dart';
import 'package:model/models/marriage/marriage.dart';
import 'package:model/widgets/text_form_field.dart';


final dashboardProvider = FutureProvider.family((ref, String token) => DashboardService.showDashboard(token: token));


class DashboardService {

  static Future<Dashboard> showDashboard({required String token}) async {
    final dio = Dio();



    try {
      final response = await dio.get("https://panjikaran.digitalpalika.org/api/v1/dashboard/",
          options: Options(
              headers: {
                'Accept': 'application/json',
                'Authorization' : 'Token $token'
              }
          )
      );

      final data = Dashboard.fromJson(response.data);

      return data;



    } on DioException catch (err) {
      print(err.response.toString());
      throw err.response.toString();
    }
  }




}