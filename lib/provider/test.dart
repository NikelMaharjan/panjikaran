//
//
//
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'dart:developer' as logDev;
//
//
//
// final birthDataProvider = StateNotifierProvider<BirthDataProvider, Map>((ref) => BirthDataProvider({}));
//
// class BirthDataProvider extends StateNotifier<Map>{
//   BirthDataProvider(super.state);
//
//   void addBirthData({data, bool? isLastPage}){
//     state.addAll(data);
//
//     if(isLastPage != null){
//
//       logDev.log("data is $state");
//
//
//
//     }
//
//   }
// }