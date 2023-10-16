


import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:model/common/toasts.dart';
import 'package:model/models/location.dart';
import 'package:model/provider/test.dart';
import 'package:model/views/birth/office_detail_page.dart';
import 'package:model/widgets/text_form_field.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../provider/mode_provider.dart';
import 'father_detail_page.dart';



class WitnessDetailPage extends ConsumerStatefulWidget {

  Map fields;
  WitnessDetailPage({required this.fields});

  @override
  ConsumerState<WitnessDetailPage> createState() {
    return _CompleteFormState();
  }
}

class _CompleteFormState extends ConsumerState<WitnessDetailPage> {


  Provincee provinceW =  Provincee(id: 0, en_names: "", np_name: "", province_no: 0);
  Districtt districtW=  Districtt(id: 0, en_name: "", np_name: "");
  Municipalityy municipalityW =  Municipalityy(id: 0, name_en: "", name_np: "");
  Wardd wardW =  Wardd(id: 0, address: "");

  final dobController = TextEditingController();
  final nameController = TextEditingController();
  final pToleController = TextEditingController();
  final pWardController = TextEditingController();
  final sadakController = TextEditingController();
  final houseController = TextEditingController();
  final toleController = TextEditingController();
  final deshController = TextEditingController();
  final citizenshipNo = TextEditingController();
  final birth = TextEditingController();


  final _formKey5 = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {

    final mode = ref.watch(modeProvider);


    return WillPopScope(
      onWillPop: ()async{
        //  ref.read(bibahaProvider.notifier).remove(0);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            foregroundColor: blackColor,
            title: const Text('Witness Details')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: FormBuilder(
         //     autovalidateMode: mode,
              key: _formKey5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  gapH20,
                  Forms.textForm(
                      label: 'Witness Name English',
                      hintText: 'witness name english',
                      name: 'witness_full_name_en',
                      isRequired: true,
                      isText: true,
                  ),

                  gapH14,

                  Forms.textForm(
                      label: 'Witness Name Nepali',
                      hintText: 'witness name english',
                      name: 'witness_full_name_np',
                      isRequired: true,
                      isText: true,
                  ),


                  gapH14,

                  Forms.textForm(
                      label: 'Witness Street Name',
                      hintText: 'witness street name',
                      name: 'witness_street_name',
                      isRequired: true,
                      isText: true,
                  ),


                  gapH14,

                  Forms.textForm(
                      label: 'Witness Tole',
                      hintText: 'wintess tole',
                      name: 'witness_tole',
                      isRequired: true,
                      isText: true,
                  ),


                  gapH14,

                  Forms.textForm(
                      label: 'Witness House No',
                      hintText: 'witness house no',

                      name: 'witness_house_no',
                      isRequired: true,
                      isText: true,
                      isNumber: true
                  ),
                  gapH14,

                  Forms.textForm(
                      label: 'Witness Birth Country',
                      hintText: 'withness birth country',
                      name: 'witness_birth_country',
                      isRequired: true,
                      isText: true,
                  ),
                  gapH14,

                  Forms.textForm(
                      label: 'Witness Citizenship Country',
                      hintText: 'witness citizenship country',
                      name: 'witness_citizenship_country',
                      isRequired: true,
                      isText: true,
                  ),
                  gapH14,

                  Forms.textForm(
                      label: 'Witness Citizenship No',
                      hintText: 'witness citizenship no',
                      name: 'witness_citizenship_no',
                      isRequired: true,
                      isText: true,
                      isLast: true,
                      isNumber: true
                  ),
                  gapH14,

                  Forms.textForm(
                      label: 'Witness CitizenShip Date',
                      hintText: '(DD-MM-YYYY)',
                      name: 'witness_citizenship_date',
                      isRequired: true,
                      isText: true,
                      isLast: true,
                      isDate: true
                  ),



                  gapH14,



                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownSearch<Provincee>(
                        validator: dropDownValidation ,

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
                        enabled:   provinceW.en_names.isEmpty ? false : true ,

                        validator: dropDownValidation,


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






                  gapH16,

                  ElevatedButton(
                    onPressed: () {

                      _formKey5.currentState!.save();


                      if (_formKey5.currentState!.validate()) {

                        final formData = _formKey5.currentState!.value;
                        final newData = Map.of(formData);
                        newData['witness_ward'] = wardW.id;

                        widget.fields.addAll(newData);

                        Get.to(() => OfficeLocationPage(fields:widget.fields ,), transition: Transition.leftToRight);


                      } else {
                    //     ref.read(modeProvider.notifier).change();
                        Toasts.showFormFailure('केही फिल्डहरू भरिएका छैनन्');
                      }
                    },
                    child: const Text(
                      'To Office Detail Page',
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? dropDownValidation(val){
    if(val == null) return "Select one field";
    return null;
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
          items: datas
              .map((data) => DropdownMenuItem(
            alignment: AlignmentDirectional.bottomStart,
            value: data,
            child: Text(data),
          ))
              .toList(),
          valueTransformer: (val) => val?.toString(),
        ),
      ),
    );
  }
}
