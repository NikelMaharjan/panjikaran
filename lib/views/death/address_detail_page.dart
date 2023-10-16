
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:model/common/toasts.dart';
import 'package:model/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:model/views/death/parents_and_witness_detail_page.dart';

import '../../dummy_data.dart';
import '../../provider/validate_provider.dart';
import '../../widgets/text_form_field.dart';

class AddressDetailPage extends ConsumerStatefulWidget {

  Map fields;
  AddressDetailPage({required this.fields});

  @override
  ConsumerState<AddressDetailPage> createState() {
    return _CompleteFormState();
  }
}

class _CompleteFormState extends ConsumerState<AddressDetailPage> {


  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {

    final mode = ref.watch(modeProvider);
    return Scaffold(
      appBar: AppBar(

        automaticallyImplyLeading: true,
        title: Text("Address Details"),
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
                  label: 'Address',
                  hintText: 'address',
                  name: 'address',
                  isRequired: true,
                  isText: true,
                ),


                gapH10,
                Forms.textForm(
                    label: 'Death Place',
                    hintText: 'death place',
                    name: 'dead_place',
                    isRequired: true,
                    isText: true
                ),


                gapH10,

                Forms.textForm(
                  label: 'House Number',
                  hintText: 'house no',
                  name: 'house_no',
                  isRequired: true,
                  isText: true,
                  isNumber: true,
                ),
                gapH10,
                Forms.textForm(
                  label: 'Tole',
                  hintText: 'tole',
                  name: 'tole',
                  isBirth: true,
                  isRequired: true,
                  isNumber: true,
                ),
                gapH10,

                gapH10,
                Forms.textForm(
                    label: 'Citizenship Number',
                    hintText: 'citizenship no',
                    name: 'citizenship_no',
                    isRequired: true,
                    isText: true,
                    isNumber: true,
                ),







                gapH16,

                ElevatedButton(
                  onPressed: () {

                    _formKey.currentState!.save();

                    if (_formKey.currentState!.validate()) {
                      final formData = _formKey.currentState!.value;

                      final newData = Map.of(formData);

                      widget.fields.addAll(newData);

                      Get.to(()=> ParentsAndWitnessDetailPage(fields: widget.fields));



                    } else {
                      //    ref.read(modeProvider.notifier).change();
                      Toasts.showFormFailure('केही फिल्डहरू भरिएका छैनन्');
                    }




                  },
                  child: const Text(
                    'To Parents Detail Page',
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
