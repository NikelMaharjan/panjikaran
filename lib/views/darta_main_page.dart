

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:model/models/darta.dart';
import 'package:model/views/death/death_registration_page.dart';
import 'package:model/views/divorce/court_detail_page.dart';
import 'package:model/views/divorce/husband_detail_page.dart';
import 'package:model/views/marriage/groom_detail_page.dart';

import '../constants/sizes.dart';
import 'package:get/get.dart';

import 'birth/birth_registration_page.dart';

class DartaMainPage extends StatelessWidget {
  const DartaMainPage({super.key});

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(

        automaticallyImplyLeading: false,
        title: Text("Darta Main Page"),
      ),
      body:  GridView.builder(
          padding: EdgeInsets.all(10.r),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 5,
              crossAxisSpacing: 8,
              crossAxisCount: 2,
              mainAxisExtent: 160.w
          ),
          itemCount: dartaList.length,
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){

                switch(index){
                  case 0:
                    Get.to(() => BirthBibaran(), transition: Transition.leftToRight);
                    break;

                  case 1:
                    Get.to(() => DeathRegistrationPage(), transition: Transition.leftToRight);
                    break;

                  case 2:
                    Get.to(() => CourtDetailPage(), transition: Transition.leftToRight);
                    break;

                  case 3:
                    Get.to(() => GroomDetailPage(), transition: Transition.leftToRight);
                    break;






                }


              },
              child: Card(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Container(
                        height: 60,
                        child: dartaList[index].image,

                      ),
                      gapH12,
                      Text(
                        dartaList[index].label,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );

  }
}
