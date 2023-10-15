
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/sizes.dart';



class DateFormWidgets extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;

  const DateFormWidgets({super.key,
    required this.label,
    required this.hint,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding:  const EdgeInsets.only(top: 8),
            child: Text.rich(
              TextSpan(
                  text: label,
                  style:  TextStyle(fontSize: 13.sp, color: const Color(0xFF6B6B6B).withOpacity(0.8),  fontFamily: 'Poppins', fontWeight: FontWeight.w600, letterSpacing: 1),
                  children: [
                    TextSpan(
                        text: '*',
                    //    style: starLabelTextStyle
                    )
                  ]
              ),
            )
        ),
        gapH7,
        Card(
          elevation: 5,
          child: TextFormField(
            textInputAction: TextInputAction.next,
            validator: (val){
              if(val!.isEmpty){
                return 'please provide date';
              }else if(val.length != 10){
                return 'please provide valid date';
              }
              return null;
            },
            keyboardType: TextInputType.datetime,
            inputFormatters: [
              FilteringTextInputFormatter(RegExp("[0-9/]"), allow: true),
              LengthLimitingTextInputFormatter(10),
              DateFormatter(),
            ],
            cursorColor: Colors.black,
            controller: controller,
          //  style: textFormStyle,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              errorStyle: const TextStyle(fontSize: 14),
              errorBorder:  InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(fontSize: 12, color: Colors.grey.withOpacity(0.8),
                  fontFamily: 'Poppins', fontWeight: FontWeight.w600, letterSpacing: 1),
              border: const OutlineInputBorder(

              ),
            ),
          ),
        ),
      ],
    );

  }
}





class DateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue prevText, TextEditingValue currText) {
    int selectionIndex;

    // Get the previous and current input strings
    String pText = prevText.text;
    String cText = currText.text;
    // Abbreviate lengths
    int cLen = cText.length;
    int pLen = pText.length;

    if (cLen == 1) {
      // Can only be 0, 1, 2 or 3
      if (int.parse(cText) > 3)
      {
        // Remove char
        cText = '';
      }
    } else if (cLen == 2 && pLen == 1) {
      // Days cannot be greater than 31
      int dd = int.parse(cText.substring(0, 2));
      if (dd == 0 || dd > 31) {
        // Remove char
        cText = cText.substring(0, 1);
      } else {
        // Add a / char
        cText += '/';
      }
    } else if (cLen == 4) {
      // Can only be 0 or 1
      if (int.parse(cText.substring(3, 4)) > 1) {
        // Remove char
        cText = cText.substring(0, 3);
      }
    } else if (cLen == 5 && pLen == 4) {
      // Month cannot be greater than 12
      int mm = int.parse(cText.substring(3, 5));
      if (mm == 0 || mm > 12) {
        // Remove char
        cText = cText.substring(0, 4);
      } else {
        // Add a / char
        cText += '/';
      }
    } else if ((cLen == 3 && pLen == 4) || (cLen == 6 && pLen == 7)) {
      // Remove / char
      cText = cText.substring(0, cText.length - 1);
    } else if (cLen == 3 && pLen == 2) {
      if (int.parse(cText.substring(2, 3)) > 1) {
        // Replace char
        cText = '${cText.substring(0, 2)}/';
      } else {
        // Insert / char
        cText =
        '${cText.substring(0, pLen)}/${cText.substring(pLen, pLen + 1)}';
      }
    } else if (cLen == 6 && pLen == 5) {
      // Can only be 1 or 2 - if so insert a / char
      int y1 = int.parse(cText.substring(5, 6));
      if (y1 < 1 || y1 > 2) {
        // Replace char
        cText = '${cText.substring(0, 5)}/';
      } else {
        // Insert / char
        cText = '${cText.substring(0, 5)}/${cText.substring(5, 6)}';
      }
    } else if (cLen == 7) {
      // Can only be 1 or 2
      int y1 = int.parse(cText.substring(6, 7));
      if (y1 < 1 || y1 > 2) {
        // Remove char
        cText = cText.substring(0, 6);
      }
    } else if (cLen == 8) {
      // Can only be 19 or 20
      int y2 = int.parse(cText.substring(6, 8));
      if (y2 < 19 || y2 > 20) {
        // Remove char
        cText = cText.substring(0, 7);
      }
    }

    selectionIndex = cText.length;
    return TextEditingValue(
      text: cText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}