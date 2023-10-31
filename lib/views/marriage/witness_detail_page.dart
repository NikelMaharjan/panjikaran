
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:model/common/toasts.dart';
import 'package:model/dummy_data.dart';
import 'package:model/models/location.dart';
import 'package:model/provider/test.dart';
import 'package:model/provider/crud_provider.dart';
import 'package:model/provider/validate_provider.dart';
import 'package:model/views/divorce/court_detail_page.dart';
import 'package:model/views/divorce/witness_detail_page.dart';
import 'package:model/views/marriage/marriage_office_detail_page.dart';
import 'package:model/views/marriage/marriage_detail_page.dart';
import 'package:model/widgets/text_form_field.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import 'package:get/get.dart';



class MarriageWitnessDetailPage extends ConsumerStatefulWidget {


  Map<String, dynamic> fields;

  MarriageWitnessDetailPage({required this.fields});




  @override
  ConsumerState<MarriageWitnessDetailPage> createState() {
    return _CompleteFormState();
  }
}

class _CompleteFormState extends ConsumerState<MarriageWitnessDetailPage> {


  Provincee provinceW =  Provincee(id: 0, en_names: "", np_name: "", province_no: 0);
  Districtt districtW=  Districtt(id: 0, en_name: "", np_name: "");
  Municipalityy municipalityW =  Municipalityy(id: 0, name_en: "", name_np: "");
  Wardd wardW =  Wardd(id: 0, address: "");




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
          title: const Text('Witness Details')
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
                    name: 'witness_full_name_en',
                    isText: true,
                    isRequired:  true
                ),

                gapH10,

                Forms.textForm(
                  label: 'Full Name (NP)',
                  hintText: 'nepali name',
                  name: 'witness_full_name_np',
                  isText: true,
                  isRequired:  true,
                ),


                gapH10,












                gapH10,
                Forms.textForm(
                  label: 'Street Name',
                  hintText: 'street name',
                  name: 'witness_street_name',
                  isText: true,
                  isRequired:  true,
                ),



                gapH10,
                Forms.textForm(
                    label: 'Tole Name',
                    hintText: 'tole name',
                    name: 'witness_tole',
                    isText: true,
                    isRequired:  true
                ),


                gapH10,
                Forms.textForm(
                    label: 'House Number',
                    hintText: 'house number',
                    name: 'witness_house_no',
                    isText: true,
                    isRequired:  true,
                    isNumber: true
                ),


                gapH10,
                Forms.textForm(
                  label: 'Birth Country',
                  hintText: 'birth country',
                  name: 'witness_birth_country',
                  isText: true,
                  isRequired:  true,
                ),


                gapH10,
                Forms.textForm(
                  label: 'Citizenship Country',
                  hintText: 'citizenship country',
                  name: 'witness_citizenship_country',
                  isText: true,
                  isRequired:  true,
                ),


                gapH10,
                Forms.textForm(
                    label: 'Citizenship Number',
                    hintText: 'citizenship number',
                    name: 'witness_citizenship_no',
                    isText: true,
                    isRequired:  true,
                    isNumber: true
                ),


                gapH10,


                Forms.textForm(
                  label: 'Citizenship Date',
                  hintText: '(DD-MM-YYYY)',
                  name: 'witness_citizenship_date',
                  isRequired: true,
                  isDate: true,
                ),

                gapH10,

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Select Location"),
                    gapH10,

                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownSearch<Provincee>(
                          validator: dropDownValidation,

                          dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  label: Text("Province")
                              )
                          ),

                          asyncItems: (String filter) async {


                            try{

                              var response = await Dio().get("https://panjikaran.digitalpalika.org/api/v1/provinces");
                              final data = (response.data['results'] as List).map((e) => Provincee.fromJson(e)).toList();
                              return data;

                            }
                            on DioException catch (err) {
                              throw "Something went wrong";

                            }

                          },
                          onChanged: (Provincee? data) {
                            setState(() {
                              provinceW = data!;
                            });
                          },
                        ),
                      ),
                    ),

                    gapH10,

                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownSearch<Districtt>(
                          validator: dropDownValidation,
                          enabled:   provinceW.en_names.isEmpty ? false : true ,


                          dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  label: Text("District")
                              )
                          ),

                          asyncItems: (String filter) async {


                            try{

                              var response = await Dio().get(
                                  "https://panjikaran.digitalpalika.org/api/v1/districts",
                                  queryParameters: {
                                    "province" : provinceW.id
                                  }
                              );
                              final data = (response.data['results'] as List).map((e) => Districtt.fromJson(e)).toList();
                              return data;

                            }
                            on DioException catch (err) {
                              throw "Something went wrong";

                            }

                          },
                          onChanged: (Districtt? data) {
                            setState(() {
                              districtW = data!;
                            });
                          },
                        ),
                      ),
                    ),

                    gapH10,

                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownSearch<Municipalityy>(
                          validator: dropDownValidation,

                          enabled:   districtW.np_name.isEmpty ? false : true ,


                          dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  label: Text("Municipality")
                              )
                          ),

                          asyncItems: (String filter) async {


                            try{

                              var response = await Dio().get(
                                  "https://panjikaran.digitalpalika.org/api/v1/muncipalities",
                                  queryParameters: {
                                    "district" : districtW.id
                                  }
                              );
                              final data = (response.data['results'] as List).map((e) => Municipalityy.fromJson(e)).toList();
                              return data;

                            }
                            on DioException catch (err) {
                              throw "Something went wrong";

                            }

                          },
                          onChanged: (Municipalityy? data) {
                            setState(() {
                              municipalityW = data!;
                            });
                          },
                        ),
                      ),
                    ),

                    gapH10,

                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownSearch<Wardd>(
                          validator: dropDownValidation,

                          enabled:   municipalityW.name_en.isEmpty ? false : true ,


                          dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  label: Text("Ward")
                              )
                          ),

                          asyncItems: (String filter) async {


                            try{

                              var response = await Dio().get(
                                  "https://panjikaran.digitalpalika.org/api/v1/wards",
                                  queryParameters: {
                                    "municipality" : municipalityW.id
                                  }
                              );
                              final data = (response.data['results'] as List).map((e) => Wardd.fromJson(e)).toList();
                              return data;

                            }
                            on DioException catch (err) {
                              throw "Something went wrong";

                            }

                          },
                          onChanged: (Wardd? data) {
                            setState(() {
                              wardW = data!;
                            });
                          },
                        ),
                      ),
                    ),

                  ],
                ),


                gapH10,



                FormBuilderImagePicker(
                  validator: FormBuilderValidators.required(errorText: "required"),
                  name: 'witness_photo',
                  decoration: const InputDecoration(labelText: 'Add Photo'),
                  maxImages: 1,


                ),





                gapH14,

                ElevatedButton(


                  onPressed: () {

                    _formKey1.currentState!.save();


                    if (_formKey1.currentState!.validate()) {

                      final formData = _formKey1.currentState!.value;

                      final newData = Map.of(formData);

                      newData['witness_ward_id'] = wardW.id;

                      newData.update('witness_photo', (value) => newData['witness_photo'][0]);


                      widget.fields.addAll(newData);

                      Get.to(() => MarriageDetailPage(fields: widget.fields,), transition: Transition.leftToRight);

                    } else {
                      //    ref.read(modeProvider.notifier).change();
                      Toasts.showFormFailure('केही फिल्डहरू भरिएका छैनन्');
                    }
                  },
                  child:  Text(
                    'To Marriage Detail Page',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Column _buildColumn(AutovalidateMode? mode, District father, String label) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       gapH10,
  //       Text.rich(
  //         TextSpan(
  //           text: label,
  //           //   style: TextStyles.labelTextStyle,
  //         ),
  //       ),
  //       gapH10,
  //       Card(
  //           child: Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 10),
  //               child:
  //               DropdownSearch<District>(
  //                 validator:   _val,
  //                 // asyncItems: (String filter) async {
  //                 //   final response = await ref.read(singleDistrictService);
  //                 //   return response;
  //                 // },
  //                 autoValidateMode: mode,
  //                 dropdownDecoratorProps:  _buildDropDownDecoratorProps(father.np_name.isEmpty,label,),
  //                 onChanged: (District? data) {
  //                   //      ref.read(pdistrict.notifier).state = data!;
  //                 },
  //               )
  //           )
  //       ),
  //     ],
  //   );
  // }

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
