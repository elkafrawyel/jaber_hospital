import 'package:flutter/material.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../PsychologistHomeData.dart';


class BuildPsychologyHomeSearchPatient extends StatelessWidget {
  const BuildPsychologyHomeSearchPatient({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "search",
      child: GenericTextField(
        hintColor:
            Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.5),
        fieldTypes: FieldTypes.clickable,
        fillColor: MyColors.white,
        hint: "Search Patients",
        controller: PsychologistHomeData().search,
        prefixIcon: Icon(Icons.search),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        margin: const EdgeInsets.only(bottom: 20),
        action: TextInputAction.search,
        type: TextInputType.text,
        // onTab: () => Nav.navigateTo(SurHomePatient(), navigatorType: NavigatorType.push),
        validate: (value) => value!.noValidate(),
      ),
    );
  }
}
