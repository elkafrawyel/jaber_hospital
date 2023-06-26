import 'package:flutter/material.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../../constants/MyColors.dart';
import '../../../utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import '../registerData.dart';

class CompanyForm extends StatefulWidget {
  const CompanyForm({super.key});

  @override
  State<CompanyForm> createState() => _CompanyFormState();
}

class _CompanyFormState extends State<CompanyForm> {
  final RegisterData registerData = RegisterData();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerData.doctorFormKey,
      child: Column(
        children: [
          GenericTextField(
            hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: MyColors.textFields,
            hint: "Company name",
            controller: registerData.companyName,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) {
              return value!.isEmpty ? "Company Name Is Required" : null;
            },
          ),
          GenericTextField(
            hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: MyColors.textFields,
            hint: "Company Email",
            controller: registerData.companyEmail,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) {
              return value!.isEmpty ? "Company Email Is Required" : null;
            },
          ),
          GenericTextField(
            hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.password,
            fillColor: MyColors.textFields,
            hint: "Password",
            margin: const EdgeInsets.symmetric(vertical: 10),
            controller: registerData.companyPassword,
            validate: (value) => value!.validatePassword(context),
            type: TextInputType.text,
            action: TextInputAction.next,
          ),
          GenericTextField(
            hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: MyColors.textFields,
            hint: "Contact person",
            margin: const EdgeInsets.symmetric(vertical: 10),
            controller: registerData.companyContactPerson,
            validate: (value) {
              return value!.isEmpty ? "Contact Person Is Required" : null;
            },
            type: TextInputType.text,
            action: TextInputAction.next,
          ),
          GenericTextField(
            hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: MyColors.textFields,
            hint: "Address",
            margin: const EdgeInsets.symmetric(vertical: 10),
            controller: registerData.companyAddress,
            validate: (value) {
              return value!.isEmpty ? "Address Is Required" : null;
            },
            type: TextInputType.text,
            action: TextInputAction.next,
          ),
          GenericTextField(
            hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: MyColors.textFields,
            hint: "Mobile",
            margin: const EdgeInsets.symmetric(vertical: 10),
            controller: registerData.companyMobile,
            validate: (value) {
              return value!.isEmpty ? "Mobile Is Required" : null;
            },
            type: TextInputType.text,
            action: TextInputAction.done,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
