






import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:model/common/toasts.dart';
import 'package:model/models/location.dart';
import 'package:model/provider/test.dart';
import 'package:model/provider/crud_provider.dart';
import 'package:model/views/darta_main_page.dart';
import 'package:model/widgets/text_form_field.dart';

import '../../common/show_snack.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import 'dart:developer' as logDev;

import '../../provider/validate_provider.dart';




class DivorceOfficeLocationPage extends ConsumerStatefulWidget {



  @override
  ConsumerState<DivorceOfficeLocationPage> createState() {
    return _CompleteFormState();
  }
}

class _CompleteFormState extends ConsumerState<DivorceOfficeLocationPage> {


  Provincee provinceO =  Provincee(id: 0, en_names: "", np_name: "", province_no: 0);
  Districtt districtO=  Districtt(id: 0, en_name: "", np_name: "");
  Municipalityy municipalityO =  Municipalityy(id: 0, name_en: "", name_np: "");
  Wardd wardO =  Wardd(id: 0, address: "");


  Provincee provinceH =  Provincee(id: 0, en_names: "", np_name: "", province_no: 0);
  Districtt districtH=  Districtt(id: 0, en_name: "", np_name: "");
  Municipalityy municipalityH =  Municipalityy(id: 0, name_en: "", name_np: "");
  Wardd wardH =  Wardd(id: 0, address: "");




  Provincee provinceW =  Provincee(id: 0, en_names: "", np_name: "", province_no: 0);
  Districtt districtW=  Districtt(id: 0, en_name: "", np_name: "");
  Municipalityy municipalityW =  Municipalityy(id: 0, name_en: "", name_np: "");
  Wardd wardW =  Wardd(id: 0, address: "");

  Provincee provinceWw =  Provincee(id: 0, en_names: "", np_name: "", province_no: 0);
  Districtt districtWw=  Districtt(id: 0, en_name: "", np_name: "");
  Municipalityy municipalityWw =  Municipalityy(id: 0, name_en: "", name_np: "");
  Wardd wardWw =  Wardd(id: 0, address: "");





  final _formKey4 = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {

    final crudData = ref.watch(crudProvider);

    final mode = ref.watch(modeProvider);


    ref.listen(crudProvider, (previous, next) {
      if(next.isError){
        CommonSnack.errrorSnack(context: context, msg: next.errText);
      }else if(next.isSuccess){
        CommonSnack.successSnack(context: context, msg: "Successful Added");
        Get.offAll(DartaMainPage());

      }

    });

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
            title: const Text('Office Location')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: FormBuilder(
              //      autovalidateMode: mode,
              key: _formKey4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  gapH20,

                  Text("Select Office Location"),
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
                            provinceO = data!;
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
                        enabled:   provinceO.en_names.isEmpty ? false : true ,


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
                                  "province" : provinceO.id
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
                            districtO = data!;
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

                        enabled:   districtO.np_name.isEmpty ? false : true ,


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
                                  "district" : districtO.id
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
                            municipalityO = data!;
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

                        enabled:   municipalityO.name_en.isEmpty ? false : true ,


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
                                  "municipality" : municipalityO.id
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
                            wardO = data!;
                          });
                        },
                      ),
                    ),
                  ),

                  gapH16,

                  Text("Select Husband Location"),

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
                            provinceH = data!;
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
                        enabled:   provinceH.en_names.isEmpty ? false : true ,


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
                                  "province" : provinceH.id
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
                            districtH = data!;
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

                        enabled:   districtH.np_name.isEmpty ? false : true ,


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
                                  "district" : districtH.id
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
                            municipalityH = data!;
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

                        enabled:   municipalityH.name_en.isEmpty ? false : true ,


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
                                  "municipality" : municipalityH.id
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
                            wardH = data!;
                          });
                        },
                      ),
                    ),
                  ),


                  gapH16,

                  Text("Select Wife Location"),

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

                  gapH16,

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
                            provinceWw = data!;
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
                        enabled:   provinceWw.en_names.isEmpty ? false : true ,


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
                                  "province" : provinceWw.id
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
                            districtWw = data!;
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

                        enabled:   districtWw.np_name.isEmpty ? false : true ,


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
                                  "district" : districtWw.id
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
                            municipalityWw = data!;
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

                        enabled:   municipalityWw.name_en.isEmpty ? false : true ,


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
                                  "municipality" : municipalityWw.id
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
                            wardWw = data!;
                          });
                        },
                      ),
                    ),
                  ),



                  gapH16,

                  ElevatedButton(



                    onPressed:  () {

                      _formKey4.currentState!.save();
                      //     print(_formKey4.currentState!.value);


                      final formData = _formKey4.currentState!.value;
                      final newData = Map.of(formData);

                      newData['office_ward_id'] = wardO.id;
                      newData['husband_ward_id'] = wardH.id;
                      newData['wife_ward_id'] = wardW.id;
                      newData['witness_ward_id'] = wardWw.id;
                      newData['husband_issued_district_id'] = districtWw.id;



                    },
                    child: const Text(
                      'SUBMIT',
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
