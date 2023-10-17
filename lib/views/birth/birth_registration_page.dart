
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
import 'package:model/widgets/text_form_field.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import 'package:get/get.dart';



class BirthBibaran extends ConsumerStatefulWidget {

  @override
  ConsumerState<BirthBibaran> createState() {
    return _CompleteFormState();
  }
}

class _CompleteFormState extends ConsumerState<BirthBibaran> {

  Provincee province =  Provincee(id: 0, en_names: "", np_name: "", province_no: 0);
  Districtt district =  Districtt(id: 0, en_name: "", np_name: "");
  Municipalityy municipality =  Municipalityy(id: 0, name_en: "", name_np: "");
  Wardd ward =  Wardd(id: 0, address: "");



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
          title: const Text('Personal Details')
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
                    label: 'English Name',
                    hintText: 'पुरा नाम लेख्नुहोश',
                    name: 'name_en',
                    isRequired: true,
                    isText: true,

                ),
                gapH10,
                Forms.textForm(
                    label: 'Nepali Name',
                    hintText: 'पुरा नाम लेख्नुहोश',
                    name: 'name_np',
                    isRequired: true,
                    isText: true,
                ),
                gapH10,
                _buildCard(label:'Birth Place', name: 'birth_place', datas: [
                  'house','hospital','other',
                ] ),
                gapH14,
                _buildCard(label:'Birth Assistant', name: 'birth_assistant', datas:[
                  'family','nurse','health' ,'worker','doctor','other'
                ]),
                gapH14,
                _buildCard(label:'Gender', name: 'gender', datas:[
                  'male', 'female', 'other'
                ] ),
                gapH14,
                _buildCard(label:'Birth Type', name: 'birth_type', datas:[
                  'one','twins','more than three'
                ] ),
                gapH10,





                Forms.textForm(
                    label: 'Nepali Date',
                    hintText: '(DD-MM-YYYY)',
                    name: 'birth_date_np',
                    isRequired: true,
                    isDate: true,
                    isLast:true
                ),
                gapH10,
                Forms.textForm(
                    label: 'English Date',
                    hintText: '(DD-MM-YYYY)',
                    name: 'birth_date_en',
                    isRequired: true,
                    isDate: true,
                    isLast:true
                ),
                gapH10,
                _buildCard(label:'Ethinicity', name: 'ethnicity', datas: ehthnic_groups ),
                gapH10,
                Forms.radioButton(
                    label: 'अपाङ्गता:  छ ?:',
                    name: 'is_disable',
                    info: [
                      true,
                      false
                    ]),
                gapH16,
                if(d == 'true') Forms.textForm(
                    label: 'Disability Detail:',
                    hintText: 'disability detail`',
                    name: 'details_disability',
                    isText: true,
                    isRequired: true
                ),
                gapH10,
                Forms.textForm(
                    label: 'Foreign Address English',
                    hintText: 'foreign address english',
                    name: 'foreign_address_en',
                    isText: true,
                    isRequired:  false
                ),
                gapH10,
                Forms.textForm(
                    label: 'Foreign Address Nepali',
                    hintText: 'विदेशी_ठेगाना',
                    name: 'foreign_address_np',
                    isText: true,
                    isRequired:  false,
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
                              province = data!;
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
                          enabled:   province.en_names.isEmpty ? false : true ,


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
                                  "province" : province.id
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
                              district = data!;
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

                          enabled:   district.np_name.isEmpty ? false : true ,


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
                                    "district" : district.id
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
                              municipality = data!;
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

                          enabled:   municipality.name_en.isEmpty ? false : true ,


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
                                    "municipality" : municipality.id
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
                              ward = data!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                gapH10,
                Forms.textForm(
                    label: 'GrandFather First Name',
                    hintText: 'grandfather first name',
                    name: 'grandfather_first_name',
                    isText: true,
                    isRequired:  true
                ),
                gapH10,
                Forms.textForm(
                    label: 'GrandFather Middle Name',
                    hintText: 'grandfather middle name',
                    name: 'grandfather_middle_name',
                    isText: true,
                    isRequired: false
                ),
                gapH10,
                Forms.textForm(
                    label: 'GrandFather Last Name',
                    hintText: 'grandfather last name',
                    name: 'grandfather_last_name',
                    isText: true,
                    isRequired: true,
                    isLast: true
                ),
                gapH14,

                ElevatedButton(


                  onPressed: () {

                    _formKey1.currentState!.save();


                    if (_formKey1.currentState!.validate()) {
                      final formData = _formKey1.currentState!.value;
                      final newData = Map.of(formData);
                      newData['ward_id'] = ward.id;


                      //
                     //  final formatDate1 = DateFormat('yyyy-MM-dd').format(formData['birth_date_np']);
                      //
                   //

                     // newData['birth_date_np'].toString().substring(0,2);



                     // print(newData['birth_date_np']);
                    // ref.read(birthDataProvider.notifier).addBirthData(data: newData);
                  //   ref.read(crudProvider.notifier).addBirthData(data: newData);
                   Get.to(() => FatherDetailPage(fields: newData,), transition: Transition.leftToRight);

                    } else {
                 //    ref.read(modeProvider.notifier).change();
                      Toasts.showFormFailure('केही फिल्डहरू भरिएका छैनन्');
                    }
                  },
                  child:  Text(
                    'To Father Detail Page',
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
          items: datas
              .map((data) => DropdownMenuItem(
            alignment: AlignmentDirectional.bottomStart,
            value: data,
            child: Text(data.toString()),
          ))
              .toList(),
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
