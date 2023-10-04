


import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:model/common/show_snack.dart';
import 'package:model/dashboard.dart';
import 'package:model/provider/auth_provider.dart';
import 'package:model/provider/normal_provider.dart';
import 'package:model/widgets/textformfield.dart';

class LoginPage extends ConsumerStatefulWidget {

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final auth = ref.watch(authProvider);
    final isVisible = ref.watch(visibleProvider);



    ref.listen(authProvider, (previous, next) {
      if(next.isError){
        CommonSnack.errrorSnack(context: context, msg: next.errText);
      }else if(next.isSuccess){
        Get.offAll(DashBoardPage());
        CommonSnack.successSnack(context: context, msg: "Successful login");
      }


    });

    return Scaffold(

      appBar: AppBar(
        title: Text("Login", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                TextFormFieldWidget(
                    controller: phoneController,
                    hintText: "phone number"
                ),

                TextFormFieldWidget(
                  controller: passwordController,
                  hintText: "password",
                  obscureText: isVisible,
                  suffixIcon: isVisible ? Icons.visibility_off : Icons.visibility,
                  onTap: (){
                  ref.read(visibleProvider.notifier).visible();
                },
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
                      onPressed: auth.isLoad ? null : (){
                        _form.currentState!.save();

                        if(_form.currentState!.validate()){
                          ref.read(authProvider.notifier).userLogin(phone_number: phoneController.text, password: passwordController.text);

                        }



                      }, child: auth.isLoad ? Center(child: CircularProgressIndicator(color: Colors.green,))  :  Text("Login", style: TextStyle(color: Colors.white),)
                  ),
                ),

              ],

            ),
          ),
        ),
      ),

    );
  }
}
