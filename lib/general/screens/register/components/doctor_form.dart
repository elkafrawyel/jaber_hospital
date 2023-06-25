import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../../constants/MyColors.dart';
import '../../../utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import '../../../utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../registerData.dart';

class DoctorRegisterForm extends StatelessWidget {
  DoctorRegisterForm({super.key});

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
            hint: "First name",
            controller: registerData.doctorFirstName,
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
            hint: "Last name",
            controller: registerData.doctorLastName,
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
            controller: registerData.doctorEmail,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) {
              return value!.isEmpty ? "Email Is Required" : null;
            },
          ),
          GenericTextField(
            hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.password,
            fillColor: MyColors.textFields,
            hint: "Password",
            margin: const EdgeInsets.symmetric(vertical: 10),
            controller: registerData.doctorPassword,
            validate: (value) => value!.validatePassword(context),
            type: TextInputType.text,
            action: TextInputAction.done,
          ),
          SizedBox(height: 10),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: registerData.doctorGenderMaleBloc,
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: RadioListTile.adaptive(
                      value: true,
                      title: Text('Male'),
                      groupValue: state.data,
                      onChanged: (value) {
                        registerData.doctorGenderMaleBloc.onUpdateData(true);
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile.adaptive(
                      value: false,
                      title: Text('Female'),
                      groupValue: state.data,
                      onChanged: (value) {
                        registerData.doctorGenderMaleBloc.onUpdateData(false);
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
