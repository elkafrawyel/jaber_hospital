import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../../constants/MyColors.dart';
import '../../../utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import '../../../utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../registerData.dart';

class PatientForm extends StatelessWidget {
  PatientForm({super.key});

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
            hint: "First name (English)",
            controller: registerData.patientFirstNameEn,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) {
              return value!.isEmpty ? "First Name Is Required" : null;
            },
          ),
          GenericTextField(
            hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: MyColors.textFields,
            hint: "Last name (English)",
            controller: registerData.patientLastNameEn,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) {
              return value!.isEmpty ? "Last Name Is Required" : null;
            },
          ),
          GenericTextField(
            hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: MyColors.textFields,
            hint: "First name (Arabic)",
            controller: registerData.patientFirstNameAr,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) {
              return value!.isEmpty ? "First Name Is Required" : null;
            },
          ),
          GenericTextField(
            hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: MyColors.textFields,
            hint: "Last name (Arabic)",
            controller: registerData.patientLastNameAr,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) {
              return value!.isEmpty ? "Last Name Is Required" : null;
            },
          ),
          GenericTextField(
            hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: MyColors.textFields,
            hint: "Email",
            controller: registerData.patientEmail,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) {
              return value!.isEmpty ? "Email Is Required" : null;
            },
          ),
          GenericTextField(
            hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: MyColors.textFields,
            hint: "File number ex:(AB-1000100)",
            controller: registerData.patientFileNumber,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) {
              return value!.isEmpty ? "File number is required" : null;
            },
          ),
          GenericTextField(
            hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: MyColors.textFields,
            hint: "Age",
            controller: registerData.patientAge,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) {
              return value!.isEmpty ? "Age Is Required" : null;
            },
          ),
          GenericTextField(
            hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: MyColors.textFields,
            hint: "Weight",
            controller: registerData.patientWeight,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) {
              return value!.isEmpty ? "Weight Is Required" : null;
            },
          ),
          GenericTextField(
            hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: MyColors.textFields,
            hint: "Height",
            controller: registerData.patientHeight,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) {
              return value!.isEmpty ? "Height Is Required" : null;
            },
          ),
          GenericTextField(
            hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.normal,
            fillColor: MyColors.textFields,
            hint: "Mobile",
            controller: registerData.patientMobile,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) {
              return value!.isEmpty ? "Mobile Is Required" : null;
            },
          ),
          GenericTextField(
            hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.password,
            fillColor: MyColors.textFields,
            hint: "Password",
            margin: const EdgeInsets.symmetric(vertical: 10),
            controller: registerData.patientPassword,
            validate: (value) => value!.validatePassword(context),
            type: TextInputType.text,
            action: TextInputAction.done,
          ),
          SizedBox(height: 10),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: registerData.patientGenderMaleBloc,
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: RadioListTile.adaptive(
                      value: true,
                      title: Text('Male'),
                      groupValue: state.data,
                      onChanged: (value) {
                        registerData.patientGenderMaleBloc.onUpdateData(true);
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile.adaptive(
                      value: false,
                      title: Text('Female'),
                      groupValue: state.data,
                      onChanged: (value) {
                        registerData.patientGenderMaleBloc.onUpdateData(false);
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
