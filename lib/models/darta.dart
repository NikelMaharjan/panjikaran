

import 'package:flutter/material.dart';

class DartaData {

  final Image image;
  final String label;


  DartaData({required this.image, required this.label});

}

List<DartaData> dartaList  = [

 DartaData(image: Image.asset('assets/images/birth.png',), label: "Birth"),
 DartaData(image: Image.asset('assets/images/death.png'), label: "Death"),
 DartaData(image: Image.asset('assets/images/divorce.png'), label: "Divorce"),


];



