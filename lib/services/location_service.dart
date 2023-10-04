

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:model/models/province.dart';

final provinceProvider = FutureProvider((ref) => LocationService.getProvince());

class LocationService {

  static Future<List<Province>> getProvince () async{
    final dio = Dio();
    try{
      
      final response = await dio.get("https://panjikaran.digitalpalika.org/api/v1/provinces");
      final data = (response.data as List).map((e) => Province.fromJson(e)).toList();
      return data;
    }
    
    on DioException catch (err){
      
      throw "Something went wrong";
    }



  }


}