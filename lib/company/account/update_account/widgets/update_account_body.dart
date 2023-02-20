import 'package:flutter/material.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../update_account_data.dart';
import 'package:tf_validator/tf_validator.dart';

class UpdateAccountBody extends StatefulWidget {
  const UpdateAccountBody({Key? key}) : super(key: key);

  @override
  State<UpdateAccountBody> createState() => _UpdateAccountBodyState();
}

class _UpdateAccountBodyState extends State<UpdateAccountBody> {
  UpdateAccountData _updateAccountData = UpdateAccountData();

  @override
  void initState() {
    // TODO: implement initState
    _updateAccountData.initScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _updateAccountData.formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        MyText(
          title: 'Name',
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: "Name",
          controller: _updateAccountData.name,
          fillColor: MyColors.textFields,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.name,
          validate: (value) => value!.validateEmpty(context),
        ),
        MyText(
          title: 'Email',
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: "Email",
          fillColor: MyColors.textFields,
          controller: _updateAccountData.email,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.emailAddress,
          validate: (value) => value!.validateEmail(context),
        ),
        MyText(
          title: 'Contact Person',
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: "Contact Person",
          fillColor: MyColors.textFields,
          controller: _updateAccountData.contactPerson,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.text,
          validate: (value) => value!.validateEmpty(context),
        ),
        MyText(
          title: 'Mobile Number',
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: "Mobile Number",
          fillColor: MyColors.textFields,
          controller: _updateAccountData.mobileNumber,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.phone,
          validate: (value) => value!.validateEmpty(context),
        ),
        MyText(
          title: 'Landline',
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: "Landline",
          fillColor: MyColors.textFields,
          controller: _updateAccountData.landline,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.phone,
          validate: (value) => value!.validateEmpty(context),
        ),
        MyText(
          title: 'Location',
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: "Location",
          fillColor: MyColors.textFields,
          controller: _updateAccountData.location,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.text,
          validate: (value) => value!.validateEmpty(context),
        ),
      ]),
    );
  }
}
