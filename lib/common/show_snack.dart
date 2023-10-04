
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class CommonSnack{

  static successSnack ({required BuildContext context ,required String msg}){
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(duration: Duration(seconds: 2),backgroundColor: Colors.green ,content: Text(msg, style: TextStyle(color: Colors.white),)));
  }


  static errrorSnack ({required BuildContext context ,required String msg}){
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(duration: Duration(seconds: 2),backgroundColor: Colors.red ,content: Text(msg, style: TextStyle(color: Colors.white),)));
  }


}