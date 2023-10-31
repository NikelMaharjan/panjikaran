

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:model/common/toasts.dart';
import 'package:model/dummy_data.dart';
import 'package:model/models/location.dart';
import 'package:model/provider/test.dart';
import 'package:model/widgets/text_form_field.dart';
import 'package:model/views/birth/witness_detail_page.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../provider/validate_provider.dart';




class MotherDetailPage extends ConsumerStatefulWidget {

  Map fields;
  MotherDetailPage({required this.fields});

  @override
  ConsumerState<MotherDetailPage> createState() {
    return _CompleteFormState();
  }
}

class _CompleteFormState extends ConsumerState<MotherDetailPage> {


  Provincee provinceM =  Provincee(id: 0, en_names: "", np_name: "", province_no: 0);
  Districtt districtM =  Districtt(id: 0, en_name: "", np_name: "");
  Municipalityy municipalityM =  Municipalityy(id: 0, name_en: "", name_np: "");
  Wardd wardM =  Wardd(id: 0, address: "");

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


  final _formKey3 = GlobalKey<FormBuilderState>();

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
            title: const Text('Mother Details')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: FormBuilder(
              //    autovalidateMode: mode,
              key: _formKey3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  gapH20,
                  Forms.textForm(
                    label: 'Mother First Name',
                    hintText: 'mother first name',
                    name: 'mother_first_name',
                    isRequired: true,
                    isText: true,
                  ),

                  gapH14,

                  Forms.textForm(
                    label: 'Mother Middle Name',
                    hintText: 'mother middle name',
                    name: 'mother_middle_name',
                    isText: true,
                    isRequired: false,
                  ),


                  gapH14,

                  Forms.textForm(
                    label: 'Mother Last Name',
                    hintText: 'mother last name',
                    name: 'mother_last_name',
                    isRequired: true,
                    isText: true,
                  ),


                  gapH14,

                  Forms.textForm(
                    label: 'Mother Street Name',
                    hintText: 'mother street name',
                    name: 'mother_street_name',
                    isRequired: true,
                    isText: true,
                  ),


                  gapH14,

                  Forms.textForm(
                    label: 'Mother Tole',
                    hintText: 'mother tole',
                    name: 'mother_tole',
                    isRequired: true,
                    isText: true,
                  ),
                  gapH14,

                  Forms.textForm(
                      label: 'Mother house no',
                      hintText: 'mother house no',
                      name: 'mother_house_no',
                      isRequired: true,
                      isText: true,
                      isNumber: true
                  ),
                  gapH14,

                  Forms.textForm(
                      label: 'Mother Age',
                      hintText: 'mother age',
                      name: 'mother_age',
                      isRequired: true,
                      isText: true,
                      isNumber: true
                  ),
                  gapH14,

                  Forms.textForm(
                    label: 'Mother Birth Country',
                    hintText: 'mother birth country',
                    name: 'mother_birth_country',
                    isRequired: true,
                    isText: true,
                  ),
                  gapH14,

                  Forms.textForm(
                    label: 'Mother CitizenShip Country',
                    hintText: 'mother citizenship country',
                    name: 'mother_citizenship_country',
                    isRequired: true,
                    isText: true,

                  ),
                  gapH14,

                  Forms.textForm(
                      label: 'Mother Citizenship Number',
                      hintText: 'mother citizenship number',
                      name: 'mother_citizenship_no',
                      isRequired: true,
                      isText: true,
                      isNumber: true
                  ),
                  gapH14,

                  Forms.textForm(
                      label: 'Mother Citizenship Date',
                      hintText: '(DD-MM-YYYY)',

                      name: 'mother_citizenship_date',
                      isRequired: true,
                      isText: true,
                      isDate: true
                  ),

                  gapH14,

                  Forms.textForm(
                      label: 'Mother Passport',
                      hintText: 'mother passport',
                      name: 'mother_passport',
                      isRequired: true,
                      isText: true,
                      isNumber: true
                  ),

                  gapH14,

                  _buildCard(label: 'Education Status:', name: 'mother_education_status', datas:literacy_types),



                  gapH14,

                  Forms.textForm(
                      label: 'Mother Occupation',
                      hintText: 'mother occupation',
                      name: 'mother_occupation',
                      isRequired: true,
                      isText: true,
                      isLast: true
                  ),



                  gapH14,

                  _buildCard(label:'Religion', name: 'mother_religion', datas: religions ),


                  gapH14,

                  _buildCard(label: 'मातृभाषा:', name: 'mother_mothertongue', datas:matri ),



                  gapH14,

                  Forms.textForm(
                    label: 'Marrried Registration No',
                    hintText: 'married registration no',
                    name: 'married_registration_no',
                    isRequired: true,
                    isText: true,
                    isNumber: true,
                  ),

                  gapH14,



                  Forms.textForm(
                      label: 'Married Date (AD)',
                      hintText: '(DD-MM-YYYY)',
                      name: 'married_date_ad',
                      isRequired: true,
                      isText: true,
                      isDate: true
                  ),

                  gapH14,


                  Forms.textForm(
                    label: 'Married Date (BS)',
                    hintText: '(DD-MM-YYYY)',
                    name: 'married_date_bs',
                    isRequired: true,
                    isText: true,
                    isDate: true,
                  ),

                  gapH14,

                  Forms.textForm(
                      label: 'Total Birth Child',
                      hintText: 'total birth child',
                      name: 'total_birth_child',
                      isRequired: true,
                      isText: true,
                      isNumber: true
                  ),




                  gapH14,

                  Forms.textForm(
                      label: 'Total Alive Child',
                      hintText: 'total alive child',
                      name: 'total_alive_child',
                      isRequired: true,
                      isText: true,
                      isNumber: true
                  ),







                  gapH14,



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
                            provinceM = data!;
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
                        enabled:   provinceM.en_names.isEmpty ? false : true ,


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
                                  "province" : provinceM.id
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
                            districtM = data!;
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

                        enabled:   districtM.np_name.isEmpty ? false : true ,


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
                                  "district" : districtM.id
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
                            municipalityM = data!;
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

                        enabled:   municipalityM.name_en.isEmpty ? false : true ,


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
                                  "municipality" : municipalityM.id
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
                            wardM = data!;
                          });
                        },
                      ),
                    ),
                  ),






                  gapH16,

                  ElevatedButton(

                    onPressed: () {

                      _formKey3.currentState!.save();




                      if (_formKey3.currentState!.validate()) {


                        final formData = _formKey3.currentState!.value;
                        final newData = Map.of(formData);
                        newData['mother_ward_id'] = wardM.id;

                        widget.fields.addAll(newData);



                        //  ref.read(birthDataProvider.notifier).addBirthData(data: newData);
                        Get.to(() => WitnessDetailPage(fields: widget.fields,), transition: Transition.leftToRight);


                      } else {
                        //    ref.read(modeProvider.notifier).change();
                        Toasts.showFormFailure('केही फिल्डहरू भरिएका छैनन्');
                      }
                    },
                    child: const Text(
                        'To Witness Detail Page'
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