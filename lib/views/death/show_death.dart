


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:model/constants/colors.dart';
import 'package:model/models/common_state/common_state.dart';
import 'package:model/provider/crud_provider.dart';
import 'package:model/views/birth/birth_detail.dart';

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

      body: _buildBirthData(deathState),
    );
  }

  _buildBirthData(CommonState deathState) {
    if(deathState.isLoad){
      return Center(child: CircularProgressIndicator(),);
    }

    else if(deathState.errText.isEmpty){

      return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: deathState.death!.length,
          itemBuilder: (context, index){
            return ListTile(
              onTap: (){
              },
              title:  Text(deathState.death![index].death_full_name_en),
              subtitle: Text(deathState.death![index].created_at.substring(0,10)),
            );
          }
      );

    }

    else{
      return Center(child: Text(deathState.errText),);
    }

  }
}
