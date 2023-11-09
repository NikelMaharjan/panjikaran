

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:model/models/darta.dart';
import 'package:model/provider/crud_provider.dart';
import 'package:model/views/birth/show_birth.dart';
import 'package:model/views/death/death_registration_page.dart';
import 'package:model/views/death/show_death.dart';
import 'package:model/views/divorce/court_detail_page.dart';
import 'package:model/views/divorce/husband_detail_page.dart';
import 'package:model/views/divorce/show_divorce.dart';
import 'package:model/views/marriage/groom_detail_page.dart';
import 'package:model/views/marriage/show_marriage.dart';

import '../constants/sizes.dart';
import 'package:get/get.dart';

import 'birth/birth_registration_page.dart';

class DartaMainPage extends ConsumerWidget {
  const DartaMainPage({super.key});

  @override
  Widget build(BuildContext context, ref) {



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
                    _buildAlertDialog(context, index, ref);

                    break;

                  case 1:

                    _buildAlertDialog(context, index, ref);



                    break;

                  case 2:

                    _buildAlertDialog(context, index, ref);

                    break;

                  case 3:

                    _buildAlertDialog(context, index, ref);

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

  void _buildAlertDialog(BuildContext context, int index, WidgetRef ref) {
    showDialog (
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius:
          BorderRadius.all(Radius.circular(10))),
          content:   Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [

              gapH24,



              ElevatedButton(
                child: const Text('View'),
                onPressed: () {


                  Navigator.of(context).pop();

                  if(index == 0){
                    ref.read(crudProvider.notifier).showBirth();
                    Get.to(() => ShowBirthPage(), transition: Transition.leftToRight);
                  }

                  if(index == 1){
                    ref.read(crudProvider.notifier).showDeath();
                    Get.to(() => ShowDeathPage(), transition: Transition.leftToRight);
                  }

                  if(index == 2){
                    ref.read(crudProvider.notifier).showDivorce();
                    Get.to(() => ShowDivorcePage(), transition: Transition.leftToRight);
                  }

                  if(index == 3){
                    ref.read(crudProvider.notifier).showMarriage();
                    Get.to(() => ShowMarriagePage(), transition: Transition.leftToRight);
                  }






                },
              ),
              ElevatedButton(
                child: const Text('Add'),
                onPressed: () {

                  Navigator.of(context).pop();


                  index == 0 ?  Get.to(() => BirthBibaran(), transition: Transition.leftToRight)
                      :  index == 1 ?  Get.to(() => DeathRegistrationPage(), transition: Transition.leftToRight)
                      : index == 2 ?   Get.to(() => CourtDetailPage(), transition: Transition.leftToRight)
                      :    Get.to(() => GroomDetailPage(), transition: Transition.leftToRight);













                },
              ),
            ],
          ),
          actions: [],


        );
      },
    );
  }
}
