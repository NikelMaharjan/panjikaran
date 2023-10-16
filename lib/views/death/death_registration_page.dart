
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:model/common/toasts.dart';
import 'package:model/constants/colors.dart';
import 'package:model/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:model/views/death/address_detail_page.dart';

import '../../dummy_data.dart';
import '../../provider/validate_provider.dart';
import '../../widgets/text_form_field.dart';

class DeathRegistrationPage extends ConsumerStatefulWidget {

  @override
  ConsumerState<DeathRegistrationPage> createState() {
    return _CompleteFormState();
  }
}

class _CompleteFormState extends ConsumerState<DeathRegistrationPage> {


  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {

    final mode = ref.watch(modeProvider);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          foregroundColor: blackColor,
          title: const Text('Death Personal Details')

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: FormBuilder(
            autovalidateMode: mode,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                gapH20,
                Forms.textForm(
                  label: 'Death Full Name (EN)',
                  hintText: 'english name',
                  name: 'death_full_name_en',
                  isRequired: true,
                  isText: true,
                ),

                gapH10,

                Forms.textForm(
                  label: 'Death Full Name (NP)',
                  hintText: 'nepali name',
                  name: 'death_full_name_np',
                  isRequired: true,
                  isText: true,
                ),
                gapH10,
                Forms.textForm(
                  label: 'Birth Registration Number',
                  hintText: 'birth registration no',
                  name: 'birth_registration_no',
                  isBirth: true,
                  isRequired: true,
                  isNumber: true,
                ),
                gapH10,
                Forms.textForm(
                    label: 'Birth Date Nepali',
                    hintText: '(DD-MM-YYYY)',
                    name: 'birth_date_bs',
                    isRequired: true,
                    isDate: true
                ),

                gapH10,
                Forms.textForm(
                    label: 'Birth Date English',
                    hintText: '(DD-MM-YYYY)',
                    name: 'birth_date_ad',
                    isRequired: true,
                    isDate: true
                ),
                gapH10,
                Forms.textForm(
                    label: 'Death Date English',
                    hintText: '(DD-MM-YYYY)',
                    name: 'dead_date_ad',
                    isRequired: true,
                    isDate: true
                ),
                gapH10,
                Forms.textForm(
                    label: 'Death Date English',
                    hintText: '(DD-MM-YYYY)',
                    name: 'dead_date_bs',
                    isRequired: true,
                    isLast: true,
                    isDate: true
                ),

                gapH10,
                Forms.textForm(
                  label: 'Death Reason',
                  hintText: 'death reason',
                  name: 'dead_reason',
                  isBirth: true,
                  isRequired: true,
                  isLast: true

                ),



                gapH14,
                _buildCard(label:'Cast', name: 'cast', datas: ehthnic_groups ),
                gapH14,
                _buildCard(label: 'Religion', name: 'religion', datas:religions ),
                gapH14,
                _buildCard(label: 'Mothertounge', name: 'mother_tongue', datas:matri ),




                gapH16,

                ElevatedButton(
                  onPressed: () {

                    _formKey.currentState!.save();


                    if (_formKey.currentState!.validate()) {
                      final formData = _formKey.currentState!.value;
                      final newData = Map.of(formData);
                      Get.to(() => AddressDetailPage(fields: newData), transition: Transition.leftToRight);



                    } else {
                      //    ref.read(modeProvider.notifier).change();
                      Toasts.showFormFailure('केही फिल्डहरू भरिएका छैनन्');
                    }







                  },
                  child: const Text(
                    'To Address Detail Page',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
            child: Text(data),
          ))
              .toList(),
          valueTransformer: (val) => val?.toString(),
        ),
      ),
    );
  }
}
