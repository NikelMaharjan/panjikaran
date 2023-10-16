import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:model/constants/colors.dart';
import 'package:model/constants/fontsizes.dart';
import 'package:model/constants/sizes.dart';
import 'package:model/provider/validate_provider.dart';
import 'package:model/widgets/date_form_widget.dart';




final dat = StateProvider<String?>((ref) => null);
class Forms{

  static pickImage ({
    required BuildContext context,
    required WidgetRef ref,
    required bool isWomen
  }) async{
    showDialog(context: context, builder: (context) => AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Select an Image'),
          IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.close))
        ],
      ),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black
            ),
            onPressed: (){
              Navigator.of(context).pop();
              if(isWomen){
                ref.read(imageProvider1.notifier).pickAnImage(false);
              }else{
                ref.read(imageProvider.notifier).pickAnImage(false);
              }

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Choose From Gallery'),
                IconButton(onPressed: (){
                  Navigator.of(context).pop();
                  if(isWomen){
                    ref.read(imageProvider1.notifier).pickAnImage(false);
                  }else{
                    ref.read(imageProvider.notifier).pickAnImage(false);
                  }
                }, icon: const Icon(Icons.photo_album_sharp)),
              ],
            )
        ),
        gapH20,
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black
            ),
            onPressed: (){
              Navigator.of(context).pop();
              if(isWomen){
                ref.read(imageProvider1.notifier).pickAnImage(true);
              }else{
                ref.read(imageProvider.notifier).pickAnImage(true);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Choose From Camera'),
                IconButton(onPressed: (){
                  Navigator.of(context).pop();
                  if(isWomen){
                    ref.read(imageProvider1.notifier).pickAnImage(true);
                  }else{
                    ref.read(imageProvider.notifier).pickAnImage(true);
                  }
                }, icon: const Icon(Icons.camera)),
              ],
            )
        ),


      ],
    ));
  }



  static Widget radioButton({required String label, required String name, required List<bool> info}){
    return   Column(
      children: [
        Consumer(
            builder: (context, ref, child) {
              return FormBuilderRadioGroup<bool>(
                decoration: InputDecoration(
                  labelText: label,
                  labelStyle: TextStyle(fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                      color: labelColor,
                      fontFamily: 'ABeeZee'),
                ),
                initialValue: null,
                name: name,
                onChanged: (val) {
                  ref.read(dat.notifier).state =val.toString();
                },
                validator: FormBuilderValidators.compose(
                    [FormBuilderValidators.required()]),
                options: info.map((lang) =>
                    FormBuilderFieldOption(
                      value: lang,
                      child: Text(lang.toString()),
                    ))
                    .toList(growable: false),
                controlAffinity: ControlAffinity.trailing,
              );
            }
        ),
      ],
    );
  }

  static Widget textForm({
    required String label,
    required String hintText,
  //  required TextEditingController controller,
    bool? isPass,
    bool? isEmail,
    bool? isText,
    bool? isRequired,
    bool? isDate,
    bool? isNumber,
    bool? isLast,
    bool? isTextArea,
    bool? isBirth,
    bool? initialValue,
    required String name
  }){
    return Container(
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: mediumWhite, width: 1.h)
      ),
      child: Container(
        margin: EdgeInsets.only(left: 16.w, bottom: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding:  EdgeInsets.only(top: 5.h),
                child:Text.rich(
                  TextSpan(
                      text: label,
                      style: TextStyles.labelTextStyle,
                      children: [
                        if(isRequired !=null)   TextSpan(
                            text: ' *',
                            style: TextStyles.starLabelTextStyle
                        )
                      ]
                  ),
                )
            ),
            Consumer(
                builder: (context, ref, child) {
                  final view =ref.watch(passView);
                  return FormBuilderTextField(
                    name: name,
                    validator: FormBuilderValidators.compose([
                      if(isRequired != false ) FormBuilderValidators.required(),
                      if(isEmail != null) FormBuilderValidators.email(),
                      if(isBirth != null) FormBuilderValidators.minLength(3),
                      if(isDate != null)FormBuilderValidators.minLength(10),
                      FormBuilderValidators.maxLength(40),
                    ]),
                    inputFormatters:
                    isDate != null ? [
                      FilteringTextInputFormatter(RegExp("[0-9/]"), allow: true),
                      LengthLimitingTextInputFormatter(10),
                      DateFormatter(),
                    ] : [],
                    valueTransformer: (val) {
                      if (isDate != null) {
                        final date = '${val!.substring(6, 10)}-${val.substring(
                            3, 5)}-${val.substring(0, 2)}';
                        return date;
                      }




                    },
                    keyboardType: isDate != null || isNumber != null ? TextInputType
                        .number :
                    isEmail != null ? TextInputType.emailAddress :
                    TextInputType.text,
                    textInputAction: isLast == true
                        ? TextInputAction.done
                        : TextInputAction.next,
                    cursorColor: blackColor,
                    obscureText: isPass != null ? view ? false : true: false,
                   // controller: controller,
                    maxLines: isTextArea != null ? 5 : 1,
                    style: TextStyles.textFormStyle,
                    decoration: InputDecoration(
                      hintText: hintText,
                      suffixIcon: isPass == true ? IconButton(
                          onPressed: () {
                            ref.read(passView.notifier).state = !ref.read(passView.notifier).state;
                          },
                          icon: Icon(view ? Icons.lock_open_sharp : Icons.lock )) : null,
                      hintStyle: TextStyle(fontSize: 12.sp,
                          color: Colors.grey.withOpacity(0.8),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 10),
                      errorStyle: TextStyle(height: 2.h, fontSize: 14.sp),
                      border: InputBorder.none,
                    ),
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}