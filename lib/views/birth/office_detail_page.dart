






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
import 'package:model/views/birth/show_birth.dart';
import 'package:model/views/darta_main_page.dart';
import 'package:model/widgets/text_form_field.dart';

import '../../common/show_snack.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import 'dart:developer' as logDev;

import '../../provider/validate_provider.dart';




class OfficeLocationPage extends ConsumerStatefulWidget {

  Map fields;
  OfficeLocationPage({required this.fields});

  @override
  ConsumerState<OfficeLocationPage> createState() {
    return _CompleteFormState();
  }
}

class _CompleteFormState extends ConsumerState<OfficeLocationPage> {


  Provincee provinceO =  Provincee(id: 0, en_names: "", np_name: "", province_no: 0);
  Districtt districtO=  Districtt(id: 0, en_name: "", np_name: "");
  Municipalityy municipalityO =  Municipalityy(id: 0, name_en: "", name_np: "");
  Wardd wardO =  Wardd(id: 0, address: "");


  Provincee provinceM =  Provincee(id: 0, en_names: "", np_name: "", province_no: 0);
  Districtt districtM=  Districtt(id: 0, en_name: "", np_name: "");




  Provincee provinceF =  Provincee(id: 0, en_names: "", np_name: "", province_no: 0);
  Districtt districtF=  Districtt(id: 0, en_name: "", np_name: "");





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

      //  ref.read(crudProvider.notifier).showBirth();

      //  Get.offAll(ShowBirthPage());
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

                  Text("Select Father Issued District"),

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
                        validator: dropDownValidation,
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

                  gapH16,

                  Text("Select Mother Issued District"),

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

                  gapH16,

                  ElevatedButton(



                    onPressed:  crudData.isLoad ? null :() {

                      _formKey4.currentState!.save();
                      //     print(_formKey4.currentState!.value);







                      if (_formKey4.currentState!.validate()) {


                        final formData = _formKey4.currentState!.value;
                        final newData = Map.of(formData);

                        newData['office_ward_id'] = wardO.id;
                        newData['father_issued_district'] = districtF.id;
                        newData['mother_issued_district'] = districtM.id;

                        widget.fields.addAll(newData);

                        //  logDev.log("data is ${widget.fields}");



                        ref.read(crudProvider.notifier).postBirth(data: widget.fields);


                      } else {
                        //    ref.read(modeProvider.notifier).change();
                        Toasts.showFormFailure('केही फिल्डहरू भरिएका छैनन्');
                      }
                    },
                    child: crudData.isLoad ? Center(child: CircularProgressIndicator(),) : const Text(
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