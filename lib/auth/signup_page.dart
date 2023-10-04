


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:model/auth/login_page.dart';
import 'package:model/common/show_snack.dart';
import 'package:model/dashboard.dart';
import 'package:model/provider/auth_provider.dart';
import 'package:model/provider/normal_provider.dart';
import 'package:model/widgets/textformfield.dart';

class SignUpPage extends ConsumerWidget {

  final userNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final _form = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context, ref) {

    final auth = ref.watch(authProvider);
    final isVisible = ref.watch(visibleProvider);



    ref.listen(authProvider, (previous, next) {
      if(next.isError){
        CommonSnack.errrorSnack(context: context, msg: next.errText);
      }else if(next.isSuccess){
        Get.to(() => LoginPage(), transition: Transition.leftToRight );
        CommonSnack.successSnack(context: context, msg: 'successfully registered');
      }


    });

    return Scaffold(

      appBar: AppBar(
        title: Text("Sign Up", style: TextStyle(color: Colors.white),),
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
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 90.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    TextFormFieldWidget(controller: userNameController, hintText: "username"),
                    TextFormFieldWidget(controller: firstNameController, hintText: "first name"),
                    TextFormFieldWidget(controller: lastNameController, hintText: "last name"),
                    TextFormFieldWidget(controller: phoneController, hintText: "phone number"),

                    TextFormFieldWidget(
                        controller: passwordController,
                        hintText: "password",
                        obscureText: isVisible,
                        suffixIcon: isVisible ? Icons.visibility_off : Icons.visibility,
                        onTap: (){
                        ref.read(visibleProvider.notifier).visible();
                      },
                    ),

                    TextFormFieldWidget(
                      controller: confirmpasswordController,
                      hintText: "confirm password",
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
                              if(passwordController.text.trim() == confirmpasswordController.text.trim()){

                                ref.read(authProvider.notifier).userSignUp(
                                    phone_number: phoneController.text,
                                    password: passwordController.text,
                                    username: userNameController.text,
                                    last_name: lastNameController.text,
                                    first_name: firstNameController.text,
                                    confirm_password: confirmpasswordController.text

                                );


                              }
                              else {
                                CommonSnack.errrorSnack(context: context, msg: "Password doesnot match");
                              }


                            }




                          }, child: auth.isLoad ? Center(child: CircularProgressIndicator(color: Colors.green,))  :  Text("Signup", style: TextStyle(color: Colors.white),)
                      ),
                    ),

                  ],

                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}
