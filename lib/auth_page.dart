

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/auth/login_page.dart';
import 'package:model/auth/signup_page.dart';

class AuthPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        title: Text("Digital Palika", style: TextStyle(color: Colors.white),),
      ),

      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Let's add your first account!", style: TextStyle(fontSize: 20, letterSpacing: 2),),

            SizedBox(height: 20,),



            Container(
              width: 180,
              child: ElevatedButton(



                 style: ElevatedButton.styleFrom(

                   backgroundColor: Colors.green,
                     shape: const RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(2)),
                     )
                 ),
                  onPressed: (){

                   Get.to(()=> LoginPage(), transition: Transition.leftToRight);


                  }, child: Text("Add Account", style: TextStyle(color: Colors.white),)
              ),
            ),

            Container(
              width: 180,
              child: ElevatedButton(



                  style: ElevatedButton.styleFrom(

                      backgroundColor: Colors.green,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      )
                  ),
                  onPressed: (){

                    Get.to(()=> SignUpPage(), transition: Transition.leftToRight);


                  }, child: Text("Create Account", style: TextStyle(color: Colors.white),)
              ),
            ),










          ],
        ),
      ),


    );
  }
}
