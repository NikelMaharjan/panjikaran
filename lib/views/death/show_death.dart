


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:model/constants/colors.dart';
import 'package:model/models/common_state/common_state.dart';
import 'package:model/provider/crud_provider.dart';
import 'package:model/views/birth/birth_detail.dart';
import 'package:model/views/death/death_detail.dart';

class ShowDeathPage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ref) {

    final deathState = ref.watch(crudProvider);

    return Scaffold(
      appBar:  AppBar(
          elevation: 0,
          foregroundColor: blackColor,
          title: const Text('Death Registraion List')
      ),

      body: _buildBirthData(deathState, ref),
    );
  }

  _buildBirthData(CommonState deathState, WidgetRef ref) {
    if(deathState.isLoad){
      return Center(child: CircularProgressIndicator(),);
    }

    else if (deathState.death!.isEmpty){
      return Center(child: Text("Empty At the Moment"),);

    }

    else if(deathState.errText.isEmpty){

      return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: deathState.death!.length,
          itemBuilder: (context, index){
            return ListTile(
              onTap: (){

                Get.to(()=> DeathDetailPage(death: deathState.death![index]), transition: Transition.leftToRight);
              },
              trailing: IconButton(
                onPressed: (){
                  showDialog (
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                        title: const Text('Warning!'),
                        content: Text('Delete?'),
                        actions: [
                          TextButton(
                            child: const Text('Yes'),
                            onPressed: () {

                              Navigator.of(context).pop();

                              ref.read(crudProvider.notifier).deleteDeath(id: deathState.death![index].id);

                              //  ref.read(crudProvider.notifier).RemoveBirth(index);



                            },
                          ),
                          TextButton(
                            child: const Text('No',),
                            onPressed: () {

                              Navigator.of(context).pop();


                            },
                          ),
                        ],
                      );
                    },
                  );





                },
                icon: Icon(CupertinoIcons.delete_solid,color: Colors.red[200],) ,
              ),

              title:  Text(deathState.death![index].death_full_name_en),
              subtitle: Text(deathState.death![index].created_at.substring(0,10),style: TextStyle(color: Colors.grey),),
            );
          }
      );

    }

    else{
      return Center(child: Text(deathState.errText),);
    }

  }
}
