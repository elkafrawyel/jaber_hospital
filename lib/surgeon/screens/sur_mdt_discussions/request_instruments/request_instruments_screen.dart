import 'package:base_flutter/surgeon/models/patient_details_model.dart';
import 'package:flutter/material.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../../general/widgets/GenScaffold.dart';

class RequestInstrumentsScreen extends StatefulWidget {
  const RequestInstrumentsScreen({Key? key, required this.patient}) : super(key: key);
  final Patient patient;

  @override
  State<RequestInstrumentsScreen> createState() => _RequestInstrumentsScreenState();
}

class _RequestInstrumentsScreenState extends State<RequestInstrumentsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: GeneralScaffold(
          back: true,
          title: "Request Instruments",
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                MyText(
                  title: 'Patient Name',
                  size: 10,
                  fontWeight: FontWeight.bold,
                ),
                GenericTextField(
                  hintColor:
                  Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                  fieldTypes: FieldTypes.normal,
                  fillColor:  MyColors.textFields,
                  hint: "الاسم",
                  controller: nameController,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.next,
                  type: TextInputType.text,
                  validate: (value) => value!.validateEmpty(context),
                ),
                MyText(
                  title: 'Patient Mobile Number',
                  size: 10,
                  fontWeight: FontWeight.bold,
                ),
                GenericTextField(
                  hintColor:
                  Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                  fieldTypes: FieldTypes.disable,
                  fillColor: MyColors.textFields,
                  hint: "Patient Mobile Number",
                  controller: phoneController,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.next,
                  type: TextInputType.text,
                  validate: (value) => value!.validateEmpty(context),
                ),
                MyText(
                  title: 'Date',
                  size: 10,
                  fontWeight: FontWeight.bold,
                ),
                GenericTextField(
                  hintColor:
                  Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                  fieldTypes: FieldTypes.disable,
                  fillColor: MyColors.textFields,
                  hint: "Date",
                  controller: dateController,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.next,
                  type: TextInputType.text,
                  validate: (value) => value!.validateEmpty(context),
                ),
                MyText(
                  title: 'Company',
                  size: 10,
                  fontWeight: FontWeight.bold,
                ),

              ],
            ),
          )),
    );
  }
}
