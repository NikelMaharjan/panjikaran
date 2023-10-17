






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




class MarriageOfficeDetailPage extends ConsumerStatefulWidget {




  @override
  ConsumerState<MarriageOfficeDetailPage> createState() {
    return _CompleteFormState();
  }
}

class _CompleteFormState extends ConsumerState<MarriageOfficeDetailPage> {


  Provincee provinceG =  Provincee(id: 0, en_names: "", np_name: "", province_no: 0);
  Districtt districtG =  Districtt(id: 0, en_name: "", np_name: "");
  Municipalityy municipalityG =  Municipalityy(id: 0, name_en: "", name_np: "");
  Wardd wardG =  Wardd(id: 0, address: "");


  Provincee provinceB =  Provincee(id: 0, en_names: "", np_name: "", province_no: 0);
  Districtt districtB =  Districtt(id: 0, en_name: "", np_name: "");
  Municipalityy municipalityB =  Municipalityy(id: 0, name_en: "", name_np: "");
  Wardd wardB =  Wardd(id: 0, address: "");


  Provincee provinceM =  Provincee(id: 0, en_names: "", np_name: "", province_no: 0);
  Districtt districtM =  Districtt(id: 0, en_name: "", np_name: "");
  Municipalityy municipalityM =  Municipalityy(id: 0, name_en: "", name_np: "");
  Wardd wardM =  Wardd(id: 0, address: "");







  final _formKey4 = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {

    final crudData = ref.watch(crudProvider);

    final mode = ref.watch(modeProvider);

    //
    // ref.listen(crudProvider, (previous, next) {
    //   if(next.isError){
    //     CommonSnack.errrorSnack(context: context, msg: next.errText);
    //   }else if(next.isSuccess){
    //     CommonSnack.successSnack(context: context, msg: "Successful Added");
    //     Get.offAll(DartaMainPage());
    //
    //   }
    //
    // });

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

                  Text("Select Groom Location"),
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
                            provinceG = data!;
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
                        enabled:   provinceG.en_names.isEmpty ? false : true ,


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
                                  "province" : provinceG.id
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
                            districtG = data!;
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

                        enabled:   districtG.np_name.isEmpty ? false : true ,


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
                                  "district" : districtG.id
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
                            municipalityG = data!;
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

                        enabled:   municipalityG.name_en.isEmpty ? false : true ,


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
                                  "municipality" : municipalityG.id
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
                            wardG = data!;
                          });
                        },
                      ),
                    ),
                  ),

                  gapH16,

                  Text("Select Bride Location"),

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
                            provinceB = data!;
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
                        enabled:   provinceB.en_names.isEmpty ? false : true ,


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
                                  "province" : provinceB.id
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
                            districtB = data!;
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

                        enabled:   districtB.np_name.isEmpty ? false : true ,


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
                                  "district" : districtB.id
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
                            municipalityB = data!;
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

                        enabled:   municipalityB.name_en.isEmpty ? false : true ,


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
                                  "municipality" : municipalityB.id
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
                            wardB = data!;
                          });
                        },
                      ),
                    ),
                  ),

                  gapH16,

                  Text("Select Marriage Location"),

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



                    onPressed: crudData.isLoad ? null : () {

                      _formKey4.currentState!.save();
                      //     print(_formKey4.currentState!.value);




                      if (_formKey4.currentState!.validate()) {
                        final formData = _formKey4.currentState!.value;
                        final newData = Map.of(formData);

                        newData['groom_ward_id'] = wardG.id;
                        newData['bride_ward_id'] = wardB.id;
                        newData['groom_issued_district_id'] = districtG.id;
                        newData['bride_issued_district_id'] = districtB.id;
                        newData['married_ward_id'] = wardM.id;

                     //   widget.fields.addAll(newData);

                        //  logDev.log("data is ${widget.fields}");





                      } else {
                        //    ref.read(modeProvider.notifier).change();
                        Toasts.showFormFailure('केही फिल्डहरू भरिएका छैनन्');
                      }






                    },
                    child: crudData.isLoad ? Center(child: Center(child: CircularProgressIndicator(),),): const Text(
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
