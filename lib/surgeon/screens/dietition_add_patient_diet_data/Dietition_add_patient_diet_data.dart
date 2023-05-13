import 'package:base_flutter/general/utilities/http/dio/modals/LoadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/http/dio/http/GenericHttp.dart';
import '../../../general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/ApiNames.dart';
import '../../models/patient_details_model.dart';

class DietitionAddPatientDietData extends StatefulWidget {
  final Patient patient;

  const DietitionAddPatientDietData({Key? key, required this.patient}) : super(key: key);

  @override
  State<DietitionAddPatientDietData> createState() => _DietitionAddPatientDietDataState();
}

class _DietitionAddPatientDietDataState extends State<DietitionAddPatientDietData> {
  late TextEditingController BMI;
  late TextEditingController patientWeight;
  late TextEditingController patientHeight;
  bool bulkEater = false;
  bool sweetEater = false;
  bool fizzy_drinks = false;
  bool frequent_meals = false;
  bool late_time = false;
  bool nippler = false;
  bool junk_food = false;
  bool iron = false;
  bool vit_b12 = false;
  bool vit_d = false;
  bool protein = false;
  late TextEditingController attempt_lose_notes;

  @override
  void initState() {
    super.initState();
    BMI = TextEditingController();
    patientWeight = TextEditingController(text: widget.patient.weight.toString());
    patientHeight = TextEditingController(text: widget.patient.height.toString());
    attempt_lose_notes = TextEditingController();
    calculateBMI();
  }

  @override
  dispose() {
    BMI.dispose();
    patientHeight.dispose();
    patientWeight.dispose();
    attempt_lose_notes.dispose();
    super.dispose();
  }

  void calculateBMI() {
    if (patientWeight.text.isNotEmpty && patientHeight.text.isNotEmpty) {
      double weight = double.parse(patientWeight.text);
      double height = double.parse(patientHeight.text);
      double bmi = ((weight / height) / height) * 10000;
      BMI.text = bmi.toStringAsFixed(2);
    } else {
      BMI.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Diet Plan Data'),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                title: "Patient weight (KG)",
                size: 12,
                fontWeight: FontWeight.bold,
              ),
              GenericTextField(
                hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
                fieldTypes: FieldTypes.clickable,
                fillColor: MyColors.textFields,
                hint: "Patient weight (KG)",
                controller: patientWeight,
                margin: const EdgeInsets.symmetric(vertical: 10),
                action: TextInputAction.next,
                type: TextInputType.number,
                onChange: (value) => calculateBMI(),
                validate: (value) => value!.validateEmpty(context),
              ),
              MyText(
                title: "Patient height (CM)",
                size: 12,
                fontWeight: FontWeight.bold,
              ),
              GenericTextField(
                hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
                fieldTypes: FieldTypes.clickable,
                fillColor: MyColors.textFields,
                hint: "Patient height (CM)",
                controller: patientHeight,
                margin: const EdgeInsets.symmetric(vertical: 10),
                action: TextInputAction.next,
                type: TextInputType.number,
                onChange: (value) => calculateBMI(),
                validate: (value) => value!.validateEmpty(context),
              ),
              MyText(
                title: "BMI",
                size: 12,
                fontWeight: FontWeight.bold,
              ),
              //automatically set
              GenericTextField(
                hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
                fieldTypes: FieldTypes.clickable,
                fillColor: MyColors.textFields,
                hint: "XX",
                controller: BMI,
                margin: const EdgeInsets.symmetric(vertical: 10),
                action: TextInputAction.done,
                type: TextInputType.number,
                validate: (value) => value!.validateEmpty(context),
              ),
              MyText(
                title: "Eating Habits:",
                size: 12,
                fontWeight: FontWeight.bold,
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: bulkEater,
                          onChanged: (value) {
                            setState(() {
                              bulkEater = value ?? false;
                            });
                          },
                        ),
                        MyText(
                          title: 'Bulk Eater',
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: sweetEater,
                          onChanged: (value) {
                            setState(() {
                              sweetEater = value ?? false;
                            });
                          },
                        ),
                        MyText(
                          title: 'Sweet Eater',
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: fizzy_drinks,
                          onChanged: (value) {
                            setState(() {
                              fizzy_drinks = value ?? false;
                            });
                          },
                        ),
                        MyText(
                          title: 'Fizzy Drinks',
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: frequent_meals,
                          onChanged: (value) {
                            setState(() {
                              frequent_meals = value ?? false;
                            });
                          },
                        ),
                        MyText(
                          title: 'Frequent Meals',
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(children: [
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: late_time,
                        onChanged: (value) {
                          setState(() {
                            late_time = value ?? false;
                          });
                        },
                      ),
                      MyText(
                        title: 'Late Time',
                        size: 12,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: nippler,
                        onChanged: (value) {
                          setState(() {
                            nippler = value ?? false;
                          });
                        },
                      ),
                      MyText(
                        title: 'Nippler',
                        size: 12,
                      ),
                    ],
                  ),
                ),
              ]),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: junk_food,
                          onChanged: (value) {
                            setState(() {
                              junk_food = value ?? false;
                            });
                          },
                        ),
                        MyText(
                          title: 'Junk Food',
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              MyText(
                title: "Supplements Started:",
                size: 12,
                fontWeight: FontWeight.bold,
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: iron,
                          onChanged: (value) {
                            setState(() {
                              iron = value ?? false;
                            });
                          },
                        ),
                        MyText(
                          title: 'Iron',
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: vit_b12,
                          onChanged: (value) {
                            setState(() {
                              vit_b12 = value ?? false;
                            });
                          },
                        ),
                        MyText(
                          title: 'Vitamin B12',
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: vit_d,
                          onChanged: (value) {
                            setState(() {
                              vit_d = value ?? false;
                            });
                          },
                        ),
                        MyText(
                          title: 'Vitamin D',
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: protein,
                          onChanged: (value) {
                            setState(() {
                              protein = value ?? false;
                            });
                          },
                        ),
                        MyText(
                          title: 'Protein',
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              MyText(
                title: "Attempts to lose weight",
                size: 12,
                fontWeight: FontWeight.bold,
              ),
              GenericTextField(
                hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
                fieldTypes: FieldTypes.normal,
                fillColor: MyColors.textFields,
                hint: "Attempts to lose weigh",
                controller: attempt_lose_notes,
                margin: const EdgeInsets.symmetric(vertical: 10),
                action: TextInputAction.next,
                type: TextInputType.text,
                onChange: (value) => calculateBMI(),
                validate: (value) => value!.validateEmpty(context),
              ),

              DefaultButton(
                title: "Add Diet Plan Date",
                onTap: addDietPlanData,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addDietPlanData() async {
    final Map<String, dynamic> body = {
      'bulk_eater': bulkEater,
      'sweet_eater': sweetEater,
      'fizzy_drinks': fizzy_drinks,
      'frequent_meals': frequent_meals,
      'late_time': late_time,
      'nippler': nippler,
      'junk_food': junk_food,
      'iron': iron,
      'vit_b12': vit_b12,
      'vit_d': vit_d,
      'protein': protein,
      'attempt_lose_notes': attempt_lose_notes.text,
    };
    dynamic data = await GenericHttp<PatientDetailsModel>(context).callApi(
      name: ApiNames.patientDietation + '?user_id=${widget.patient.id}',
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
      returnDataFun: (data) => data,
      jsonBody: body,
      showLoader: true,
    );
    if (data != null) {
      Navigator.pop(context, true);
      CustomToast.showSnackBar(context, data["message"]["message_en"]);

    }
  }
}
