
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
import 'package:model/views/divorce/husband_detail_page.dart';
import 'package:model/widgets/text_form_field.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import 'package:get/get.dart';



class CourtDetailPage extends ConsumerStatefulWidget {

  @override
  ConsumerState<CourtDetailPage> createState() {
    return _CompleteFormState();
  }
}

class _CompleteFormState extends ConsumerState<CourtDetailPage> {




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
          title: const Text('Court Details')
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
                _buildCard(label:'Court Type', name: 'court_type', datas: [
                  'DC','SC','AC',
                ]
                ),
                gapH10,
                Forms.textForm(
                  label: 'Court Decision Number',
                  hintText: 'court decision number',
                  name: 'court_decission_date',
                  isRequired: true,
                  isText: true,
                  isNumber: true
                ),
                gapH10,


                Forms.textForm(
                    label: 'Court Decision Date',
                    hintText: '(DD-MM-YYYY)',
                    name: 'court_decision_date',
                    isRequired: true,
                    isDate: true,
                ),
                gapH10,
                Forms.textForm(
                    label: 'Married Date (BS)',
                    hintText: '(DD-MM-YYYY)',
                    name: 'married_date_bs',
                    isRequired: true,
                    isDate: true,
                ),

                gapH10,
                Forms.textForm(
                    label: 'Married Date (AD)',
                    hintText: '(DD-MM-YYYY)',
                    name: 'married_date_ad',
                    isRequired: true,
                    isDate: true,
                ),

                gapH10,
                Forms.textForm(
                    label: 'Married Registration Number',
                    hintText: 'married registration number',
                    name: 'married_registration_no',
                    isText: true,
                    isRequired:  true,
                    isNumber: true
                ),
                gapH10,

                _buildCard(label:'Children With', name: 'children_with', datas: [
                  'FM','O',
                ] ),

                gapH14,

                ElevatedButton(


                  onPressed: () {

                    _formKey1.currentState!.save();




                    if (_formKey1.currentState!.validate()) {
                      final formData = _formKey1.currentState!.value;
                      final newData = Map.of(formData);
                      Get.to(() => HusbandDetailPage(fields: newData,), transition: Transition.leftToRight);

                    } else {
                      //    ref.read(modeProvider.notifier).change();
                      Toasts.showFormFailure('केही फिल्डहरू भरिएका छैनन्');
                    }
                  },
                  child:  Text(
                    'To Husband Detail Page',
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
