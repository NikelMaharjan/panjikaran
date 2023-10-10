


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive_flutter/adapters.dart';

import 'otp_page.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // final token = Hive.box<String?>('token');
    // final ok  = token.get('token');

    final phone = Hive.box<String?>('phone_number');
    final phonenumber  = phone.get('phone_number');

    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(

              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green[300],
                  child: Icon(CupertinoIcons.person),
                ),
                trailing: Icon(Icons.navigate_next),
                onTap: (){
                  Get.to(() => OtpPage(), transition: Transition.leftToRight);
                },
                title: Text(phonenumber!),
                // subtitle: Text(ok!),
              ),
            )
          ],
        ),
      ),
    );
  }
}
