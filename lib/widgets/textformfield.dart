import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {


  final TextEditingController controller;
  final String hintText;
  VoidCallback? onTap;
  final bool? obscureText;
  IconData? suffixIcon;



  TextFormFieldWidget({required this.controller, required this.hintText, this.onTap, this.obscureText, this.suffixIcon});



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          obscureText: obscureText ?? false,
          validator: hintText == "phone number" ? validatePhone : validateOthers,
          inputFormatters: [
            hintText == "phone number" ?  LengthLimitingTextInputFormatter(10) : LengthLimitingTextInputFormatter(20),
          ],
          controller: controller,
          keyboardType: hintText == "phone number" ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: hintText == "phone number" ? const Padding(padding: EdgeInsets.all(15), child: Text('+977')) : null,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            hintText: hintText,
              suffixIcon: hintText != "phone number" || obscureText == true ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: onTap,
                color: Colors.black,
              ) : null,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.green
              ),

            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.green
              ),

            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.red
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.red
              ),
            ),
          ),


        ),
        SizedBox(height: 20,)
      ],
    );
  }

String? validatePhone(String? value) {
  if(value!.isEmpty) {
    return 'field cant be empty';
  }

  else if (value.length < 10){

    return 'phone number must be 10 characters';


  }
  return null;
}

  String? validateOthers(String? value) {
    if(value!.isEmpty) {
      return 'field cant be empty';
    }
    return null;
  }
}
