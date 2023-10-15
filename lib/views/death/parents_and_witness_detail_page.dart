
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:model/constants/colors.dart';
import 'package:model/constants/sizes.dart';
import 'package:model/models/location.dart';
import 'package:model/views/death/death_office_location_page.dart';

import '../../dummy_data.dart';
import '../../provider/validate_provider.dart';
import '../../widgets/text_form_field.dart';

class ParentsAndWitnessDetailPage extends ConsumerStatefulWidget {

  Map fields;
  ParentsAndWitnessDetailPage({required this.fields});

  @override
  ConsumerState<ParentsAndWitnessDetailPage> createState() {
    return _CompleteFormState();
  }
}

class _CompleteFormState extends ConsumerState<ParentsAndWitnessDetailPage> {


  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {

    Provincee provinceW =  Provincee(id: 0, en_names: "", np_name: "", province_no: 0);
    Districtt districtW =  Districtt(id: 0, en_name: "", np_name: "");
    Municipalityy municipalityW =  Municipalityy(id: 0, name_en: "", name_np: "");
    Wardd wardW =  Wardd(id: 0, address: "");

    final mode = ref.watch(modeProvider);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          foregroundColor: blackColor,
          title: const Text('Parents And Witness Details')
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: FormBuilder(
            //  autovalidateMode: mode,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                gapH20,
                Forms.textForm(
                  label: 'GrandFather Full Name (EN)',
                  hintText: 'english name',
                  name: 'grandfather_full_name_en',
                  isRequired: true,
                  isText: true,
                ),


                gapH10,
                Forms.textForm(
                    label: 'GranFather Full Name (NP)',
                    hintText: 'nepali name',
                    name: 'grandfather_full_name_np',
                    isRequired: true,
                    isText: true
                ),

                gapH10,

                Forms.textForm(
                  label: 'Father Full Name (EN)',
                  hintText: 'english name',
                  name: 'father_full_name_en',
                  isRequired: true,
                  isText: true,
                ),


                gapH10,
                Forms.textForm(
                    label: 'Father Full Name (NP)',
                    hintText: 'nepali name',
                    name: 'father_full_name_np',
                    isRequired: true,
                    isText: true
                ),

                gapH10,

                Forms.textForm(
                  label: 'Mother Full Name (EN)',
                  hintText: 'english name',
                  name: 'mother_full_name_en',
                  isRequired: true,
                  isText: true,
                ),


                gapH10,
                Forms.textForm(
                    label: 'Mother Full Name (NP)',
                    hintText: 'nepali name',
                    name: 'mother_full_name_np',
                    isRequired: true,
                    isText: true
                ),

                gapH10,

                Forms.textForm(
                  label: 'Witness Full Name (EN)',
                  hintText: 'english name',
                  name: 'witness_full_name_en',
                  isRequired: true,
                  isText: true,
                ),


                gapH10,
                Forms.textForm(
                    label: 'Witness Full Name (NP)',
                    hintText: 'nepali name',
                    name: 'witness_full_name_np',
                    isRequired: true,
                    isText: true
                ),


                gapH10,
                Forms.textForm(
                    label: 'Witness Citizenship Country',
                    hintText: 'nepali name',
                    name: 'witness_citizenship_country',
                    isRequired: true,
                    isText: true
                ),




                gapH10,

                Forms.textForm(
                  label: 'Witness Citizenship Number',
                  hintText: 'house no',
                  name: 'witness_citizenship_no',
                  isRequired: true,
                  isText: true,
                  isNumber: true,
                ),

                gapH10,
                Forms.textForm(
                    label: 'Witness Citizenship Date',
                    hintText: '(DD-MM-YYYY)',
                    name: 'witness_citizenship_date',
                    isRequired: true,
                    isDate: true
                ),
                gapH10,

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Select Witness Location"),

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







                gapH16,

                ElevatedButton(
                  onPressed: () {

                    _formKey.currentState!.save();


                    final formData = _formKey.currentState!.value;
                    final newData = Map.of(formData);

                    newData['witness_ward_id'] = wardW.id;

                    widget.fields.addAll(newData);



                    Get.to(() => DeathOfficeLocationPage(fields: widget.fields));





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
