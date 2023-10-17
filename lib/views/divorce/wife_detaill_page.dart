
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:model/common/toasts.dart';
import 'package:model/dummy_data.dart';
import 'package:model/models/location.dart';
import 'package:model/provider/test.dart';
import 'package:model/provider/crud_provider.dart';
import 'package:model/provider/validate_provider.dart';
import 'package:model/views/birth/father_detail_page.dart';
import 'package:model/views/divorce/court_detail_page.dart';
import 'package:model/views/divorce/witness_detail_page.dart';
import 'package:model/widgets/text_form_field.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import 'package:get/get.dart';



class WifeDetailPage extends ConsumerStatefulWidget {


  Map fields;

  WifeDetailPage({required this.fields});

  @override
  ConsumerState<WifeDetailPage> createState() {
    return _CompleteFormState();
  }
}

class _CompleteFormState extends ConsumerState<WifeDetailPage> {




  final _formKey1 = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {


    final d   = ref.watch(dat);
    final mode = ref.watch(modeProvider);
    return Scaffold(

      appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          foregroundColor: blackColor,
          title: const Text('Wife Details')
      ),


      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: FormBuilder(
            //   autovalidateMode: mode,
            key: _formKey1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                gapH20,

                Forms.textForm(
                    label: 'Full Name (EN)',
                    hintText: 'english name',
                    name: 'wife_full_name_ep',
                    isText: true,
                    isRequired:  true
                ),

                gapH10,

                Forms.textForm(
                    label: 'Full Name (NP)',
                    hintText: 'nepali name',
                    name: 'wife_full_name_np',
                    isText: true,
                    isRequired:  true,
                ),


                gapH10,


                Forms.textForm(
                    label: 'Birth Date',
                    hintText: '(DD-MM-YYYY)',
                    name: 'wife_birth_date',
                    isRequired: true,
                    isDate: true,
                ),

                gapH10,


                Forms.textForm(
                    label: 'Birth Country',
                    hintText: 'birth country',
                    name: 'wife_birth_country',
                    isText: true,
                    isRequired:  true
                ),



                gapH10,

                Forms.textForm(
                    label: 'Citizenship country',
                    hintText: 'citizenship country',
                    name: 'wife_citizenship_country',
                    isText: true,
                    isRequired:  true
                ),

                gapH10,

                Forms.textForm(
                    label: 'Citizenship Number',
                    hintText: 'citizenship number',
                    name: 'wife_citizenship_no',
                    isText: true,
                    isNumber: true,
                    isRequired:  true
                ),


                gapH10,

                Forms.textForm(
                    label: 'Citizenship Date',
                    hintText: '(DD-MM-YYYY)',
                    name: 'wife_citizenship_date',
                    isRequired: true,
                    isDate: true,
                ),

                gapH10,






                _buildCard(label:'Religion', name: 'wife_religion', datas: religions ),

                gapH10,


                Forms.textForm(
                    label: 'Street Name',
                    hintText: 'street name',
                    name: 'wife_street_name',
                    isText: true,
                    isRequired:  true
                ),


                gapH10,
                Forms.textForm(
                    label: 'Tole Name',
                    hintText: 'tole name',
                    name: 'wife_tole',
                    isText: true,
                    isRequired:  true
                ),


                gapH10,
                Forms.textForm(
                    label: 'House Number',
                    hintText: 'house number',
                    name: 'wife_house_no',
                    isText: true,
                    isRequired:  true,
                    isNumber: true
                ),

                _buildCard(label:'Education', name: 'wife_education_status', datas: literacy_types ),

                gapH10,



                Forms.textForm(
                    label: 'Mother Tounge',
                    hintText: 'mother tongue',
                    name: 'wife_mother_tongue',
                    isText: true,
                    isRequired:  true
                ),
                gapH10,



                Forms.textForm(
                    label: 'Gradnfather Name (EN)',
                    hintText: 'english name',
                    name: 'wife_grand_father_en',
                    isText: true,
                    isRequired:  true
                ),
                gapH10,



                Forms.textForm(
                    label: 'Gradnfather Name (NP)',
                    hintText: 'nepali name',
                    name: 'wife_grand_father_np',
                    isText: true,
                    isRequired:  true
                ),
                gapH10,



                Forms.textForm(
                    label: 'Father Name (EN)',
                    hintText: 'english name',
                    name: 'wife_father_name_en',
                    isText: true,
                    isRequired:  true
                ),
                gapH10,



                Forms.textForm(
                    label: 'Father Name (NP)',
                    hintText: 'nepali name',
                    name: 'wife_father_name_np',
                    isText: true,
                    isRequired:  true
                ),

                gapH10,



                Forms.textForm(
                    label: 'Mother Name (EN)',
                    hintText: 'english name',
                    name: 'wife_mother_name_en',
                    isText: true,
                    isRequired:  true
                ),

                gapH10,



                Forms.textForm(
                    label: 'Mother Name (NP)',
                    hintText: 'nepali name',
                    name: 'wife_mother_name_np',
                    isText: true,
                    isRequired:  true
                ),

                gapH10,



                Forms.textForm(
                    label: 'Address',
                    hintText: 'address',
                    name: 'wife_address',
                    isText: true,
                    isRequired:  true,
                    isLast: true
                ),









                gapH14,

                ElevatedButton(


                  onPressed: () {

                    _formKey1.currentState!.save();




                    if (_formKey1.currentState!.validate()) {

                      final formData = _formKey1.currentState!.value;

                      final newData = Map.of(formData);

                      widget.fields.addAll(newData);



                      Get.to(() => WitnessDetailPage(fields: widget.fields,), transition: Transition.leftToRight);

                    } else {
                      //    ref.read(modeProvider.notifier).change();
                      Toasts.showFormFailure('केही फिल्डहरू भरिएका छैनन्');
                    }
                  },
                  child:  Text(
                    'To Witness Detail Page',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _buildColumn(AutovalidateMode? mode, District father, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapH10,
        Text.rich(
          TextSpan(
            text: label,
            //   style: TextStyles.labelTextStyle,
          ),
        ),
        gapH10,
        Card(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child:
                DropdownSearch<District>(
                  validator:   _val,
                  // asyncItems: (String filter) async {
                  //   final response = await ref.read(singleDistrictService);
                  //   return response;
                  // },
                  autoValidateMode: mode,
                  dropdownDecoratorProps:  _buildDropDownDecoratorProps(father.np_name.isEmpty,label,),
                  onChanged: (District? data) {
                    //      ref.read(pdistrict.notifier).state = data!;
                  },
                )
            )
        ),
      ],
    );
  }

  Card _buildCard({required String name, required String label, required List<String> datas}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
        child: FormBuilderDropdown<String>(
          name: name,
          decoration: InputDecoration(
            isDense: true,
            hintText: label,
          ),
          validator:
          FormBuilderValidators.compose([FormBuilderValidators.required()]),
          items: datas.map((data) => DropdownMenuItem(
            alignment: AlignmentDirectional.bottomStart,
            value: data,
            child: Text(data.toString()),
          )).toList(),
          valueTransformer: (val) => val?.toString(),
        ),
      ),
    );
  }

  DropDownDecoratorProps _buildDropDownDecoratorProps(bool some, String label) {
    return DropDownDecoratorProps(
        textAlign: TextAlign.start,
        baseStyle: TextStyle(fontSize: 16.sp),
        dropdownSearchDecoration: some ? InputDecoration(
            label: Text(label,)
        ) : const InputDecoration(border: InputBorder.none)
    );
  }

  String? dropDownValidation(val){
    if(val == null) return "Select one field";
    return null;
  }

  String? _val(val) {
    if (val == null) {
      return 'Field can\'t be empty';
    }
    return null;
  }
}
