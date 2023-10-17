

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:model/dummy_data.dart';
import 'package:model/models/location.dart';
import 'package:model/provider/crud_provider.dart';
import 'package:model/views/birth/mother_detail_page.dart';
import 'package:model/provider/test.dart';
import 'package:model/widgets/text_form_field.dart';

import '../../common/toasts.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../provider/validate_provider.dart';



class FatherDetailPage extends ConsumerStatefulWidget {

  Map fields;
  FatherDetailPage({required this.fields});

  @override
  ConsumerState<FatherDetailPage> createState() {
    return _CompleteFormState();
  }
}

class _CompleteFormState extends ConsumerState<FatherDetailPage> {


  Provincee provinceF =  Provincee(id: 0, en_names: "", np_name: "", province_no: 0);
  Districtt districtF =  Districtt(id: 0, en_name: "", np_name: "");
  Municipalityy municipalityF =  Municipalityy(id: 0, name_en: "", name_np: "");
  Wardd wardF =  Wardd(id: 0, address: "");

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


  final _formKey2 = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {

    final mode1 = ref.watch(modeProvider);


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
            title: const Text('Fathers Details')
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: FormBuilder(
        //    autovalidateMode: mode1,
              key: _formKey2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  gapH20,
                  Forms.textForm(
                      label: 'Father First Name',
                      hintText: 'father first name',
                      name: 'father_first_name',
                      isRequired: true,
                      isText: true,
                  ),
                  gapH14,
                  Forms.textForm(
                      label: 'Father Middle Name',
                      hintText: 'father middle name',
                      name: 'father_middle_name',
                      isText: true,
                     isRequired: false
                  ),
                  gapH14,
                  Forms.textForm(
                      label: 'Father Last Name',
                      hintText: 'father last name',
                      name: 'father_last_name',
                      isRequired: true,
                      isText: true,
                  ),
                  gapH14,
                  _buildCard(label:'Religion', name: 'father_religion', datas: religions ),
                  gapH14,
                  Forms.textForm(
                      label: 'Father Street Name',
                      hintText: 'father street name',
                      name: 'father_street_name',
                      isRequired: true,
                      isText: true,
                  ),
                  gapH14,
                  Forms.textForm(
                      label: 'Father Tole',
                      hintText: 'father tole',
                      name: 'father_tole',
                      isRequired: true,
                      isText: true,
                  ),
                  gapH14,
                  Forms.textForm(
                      label: 'House Number',
                      hintText: 'father house no',
                      name: 'father_house_no',
                      isRequired: true,
                      isText: true,
                      isNumber: true
                  ),
                  gapH14,
                  Forms.textForm(
                      label: 'Father Age',
                      hintText: 'father age',
                      name: 'father_age',
                      isRequired: true,
                      isText: true,
                      isNumber: true,
                  ),
                  gapH14,
                  Forms.textForm(
                      label: 'Father Birth Country',
                      hintText: 'father birth country',
                      name: 'father_birth_country',
                      isRequired: true,
                      isText: true,
                  ),
                  gapH14,
                  Forms.textForm(
                      label: 'Father CitizenShip Country',
                      hintText: 'father citizenship country',
                      name: 'father_citizenship_country',
                      isRequired: true,
                      isText: true,
                  ),
                  gapH14,
                  Forms.textForm(
                      label: 'Father Citizenship Number',
                      hintText: 'father citizenship number',
                      name: 'father_citizenship_no',
                      isRequired: true,
                      isText: true,
                      isNumber: true
                  ),
                  gapH14,
                  Forms.textForm(
                      label: 'Father Citizenship Date',
                      hintText: '(DD-MM-YYYY)',

                      name: 'father_citizenship_date',
                      isRequired: true,
                      isText: true,
                      isDate: true
                  ),
                  gapH14,
                  Forms.textForm(
                      label: 'Father Passport',
                      hintText: 'father passport',
                      name: 'father_passport',
                      isRequired: true,
                      isText: true,
                      isNumber: true
                  ),
                  gapH14,


                  _buildCard(label: 'Education Status:', name: 'father_education_status', datas:literacy_types),

                  gapH14,
                  Forms.textForm(
                      label: 'Father Occupation ',
                      hintText: 'father occupation',
                      name: 'father_occupation',
                      isRequired: true,
                      isText: true,
                  ),
                  gapH14,


                  _buildCard(label: 'मातृभाषा:', name: 'father_mothertongue', datas:matri ),


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
                            provinceF = data!;
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
                        enabled:   provinceF.en_names.isEmpty ? false : true ,


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
                                  "province" : provinceF.id
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
                            districtF = data!;
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

                        enabled:   districtF.np_name.isEmpty ? false : true ,


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
                                  "district" : districtF.id
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
                            municipalityF = data!;
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

                        enabled:   municipalityF.name_en.isEmpty ? false : true ,


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
                                  "municipality" : municipalityF.id
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
                            wardF = data!;
                          });
                        },
                      ),
                    ),
                  ),
                  gapH16,

                  ElevatedButton(

                    onPressed: () {

                      _formKey2.currentState!.save();





                      if (_formKey2.currentState!.validate()) {

                        final formData = _formKey2.currentState!.value;
                        final newData = Map.of(formData);
                        newData['father_ward_id'] = wardF.id;
                   //     ref.read(birthDataProvider.notifier).addBirthData(data: newData);
                    //    ref.read(crudProvider.notifier).addBirthData(data: newData, isLastPage: true);

                        widget.fields.addAll(newData);

                        //print(widget.fields);

                        Get.to(() => MotherDetailPage(fields: widget.fields,), transition: Transition.leftToRight);



                      } else {
                    //    ref.read(modeProvider.notifier).change();
                        Toasts.showFormFailure('केही फिल्डहरू भरिएका छैनन्');
                      }
                    },
                    child: const Text(
                      'To Mother Detail Page',
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
