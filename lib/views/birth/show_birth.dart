


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:model/constants/colors.dart';
import 'package:model/models/common_state/common_state.dart';
import 'package:model/provider/crud_provider.dart';
import 'package:model/views/birth/birth_detail.dart';

class ShowBirthPage extends ConsumerWidget {
  const ShowBirthPage({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final birthState = ref.watch(crudProvider);

    return Scaffold(
      appBar:  AppBar(
          elevation: 0,
          foregroundColor: blackColor,
          title: const Text('Birth Registraion List')
      ),

      body: _buildBirthData(birthState),
    );
  }

  _buildBirthData(CommonState birthState) {
    if(birthState.isLoad){
      return Center(child: CircularProgressIndicator(),);
    }

    else if(birthState.errText.isEmpty){

      return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: birthState.birth!.length,
          itemBuilder: (context, index){
            return ListTile(
              onTap: (){
                Get.to(() => BirthDetailPage(birth: birthState.birth![index],), transition: Transition.leftToRight);
              },
              title:  Text(birthState.birth![index].name_en),
              subtitle: Text(birthState.birth![index].created_at.substring(0,10)),
            );
          }
      );

    }

    else{
      return Center(child: Text(birthState.errText),);
    }

  }
}
