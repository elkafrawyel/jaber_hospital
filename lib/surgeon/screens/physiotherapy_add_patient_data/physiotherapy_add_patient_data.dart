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

class PhysiotherapyAddPatientData extends StatefulWidget {
  final Patient patient;

  const PhysiotherapyAddPatientData({Key? key, required this.patient}) : super(key: key);

  @override
  State<PhysiotherapyAddPatientData> createState() => _PhysiotherapyAddPatientDataState();
}

class _PhysiotherapyAddPatientDataState extends State<PhysiotherapyAddPatientData> {
  late TextEditingController BMI;
  late TextEditingController patientWeight;
  late TextEditingController patientHeight;
  late TextEditingController physicalLimitation;
  late TextEditingController stepCount;
  String? physicalFitness;
  String? cardiovascularFitness;
  String? lungEndurance;

  @override
  void initState() {
    super.initState();
    BMI = TextEditingController();
    patientWeight = TextEditingController(text: widget.patient.weight.toString());
    patientHeight = TextEditingController(text: widget.patient.height.toString());
    calculateBMI();
    physicalLimitation = TextEditingController();
    stepCount = TextEditingController();
  }

  @override
  dispose() {
    BMI.dispose();
    patientHeight.dispose();
    patientWeight.dispose();
    physicalLimitation.dispose();
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
                title: "Physical Limitation",
                size: 12,
                fontWeight: FontWeight.bold,
              ),
              GenericTextField(
                hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
                fieldTypes: FieldTypes.normal,
                fillColor: MyColors.textFields,
                hint: "Physical limitation notes",
                controller: physicalLimitation,
                margin: const EdgeInsets.symmetric(vertical: 10),
                action: TextInputAction.next,
                type: TextInputType.text,
                onChange: (value) => calculateBMI(),
                validate: (value) => value!.validateEmpty(context),
              ),

              MyText(
                title: "Average Step Count",
                size: 12,
                fontWeight: FontWeight.bold,
              ),

              GenericTextField(
                hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
                fieldTypes: FieldTypes.normal,
                fillColor: MyColors.textFields,
                hint: "Please enter the patient’s average step count",
                controller: stepCount,
                margin: const EdgeInsets.symmetric(vertical: 10),
                action: TextInputAction.next,
                type: TextInputType.text,
                onChange: (value) => calculateBMI(),
                validate: (value) => value!.validateEmpty(context),
              ),

              Divider(),
              MyText(
                title: "Physical Fitness:",
                size: 12,
                fontWeight: FontWeight.bold,
              ),
              Row(
                children: [
                  Radio(
                    value: 'Low',
                    groupValue: physicalFitness,
                    onChanged: (value) {
                      setState(
                        () {
                          physicalFitness = 'Low';
                        },
                      );
                    },
                  ),
                  MyText(
                    title: "Low",
                    size: 12,
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'Moderate',
                    groupValue: physicalFitness,
                    onChanged: (value) {
                      setState(
                        () {
                          physicalFitness = 'Moderate';
                        },
                      );
                    },
                  ),
                  MyText(
                    title: "Moderate",
                    size: 12,
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'High',
                    groupValue: physicalFitness,
                    onChanged: (value) {
                      setState(
                        () {
                          physicalFitness = 'High';
                        },
                      );
                    },
                  ),
                  MyText(
                    title: "High",
                    size: 12,
                  ),
                ],
              ),
              Divider(),
              MyText(
                title: "Cardiovascular Fitness:",
                size: 12,
                fontWeight: FontWeight.bold,
              ),
              Row(
                children: [
                  Radio(
                    value: 'Low',
                    groupValue: cardiovascularFitness,
                    onChanged: (value) {
                      setState(
                        () {
                          cardiovascularFitness = 'Low';
                        },
                      );
                    },
                  ),
                  MyText(
                    title: "Low",
                    size: 12,
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'Moderate',
                    groupValue: cardiovascularFitness,
                    onChanged: (value) {
                      setState(
                        () {
                          cardiovascularFitness = 'Moderate';
                        },
                      );
                    },
                  ),
                  MyText(
                    title: "Moderate",
                    size: 12,
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'High',
                    groupValue: cardiovascularFitness,
                    onChanged: (value) {
                      setState(
                        () {
                          cardiovascularFitness = 'High';
                        },
                      );
                    },
                  ),
                  MyText(
                    title: "High",
                    size: 12,
                  ),
                ],
              ),
              Divider(),
              MyText(
                title: "Lung endurance:",
                size: 12,
                fontWeight: FontWeight.bold,
              ),
              Row(
                children: [
                  Radio(
                    value: 'Low',
                    groupValue: lungEndurance,
                    onChanged: (value) {
                      setState(
                        () {
                          lungEndurance = 'Low';
                        },
                      );
                    },
                  ),
                  MyText(
                    title: "Low",
                    size: 12,
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'Moderate',
                    groupValue: lungEndurance,
                    onChanged: (value) {
                      setState(
                        () {
                          lungEndurance = 'Moderate';
                        },
                      );
                    },
                  ),
                  MyText(
                    title: "Moderate",
                    size: 12,
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'High',
                    groupValue: lungEndurance,
                    onChanged: (value) {
                      setState(
                        () {
                          lungEndurance = 'High';
                        },
                      );
                    },
                  ),
                  MyText(
                    title: "High",
                    size: 12,
                  ),
                ],
              ),
              Divider(),
              DefaultButton(
                title: "Add Physiotherapy Data",
                onTap: addPhysiotherapyData,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addPhysiotherapyData() async {
    final Map<String, dynamic> body = {
      "pythiscal_limitation": physicalLimitation.text,
      "avg_step_count": stepCount.text,
      "physical_fitness": physicalFitness,
      "cardiovascular": cardiovascularFitness,
      "lung_endurance": lungEndurance,
      // "feedback": "test",
      // "feedback_date": "test",
      // "follow_up_feedback": "test",
      // "diet_plan": "tets"
    };
    dynamic data = await GenericHttp<PatientDetailsModel>(context).callApi(
      name: ApiNames.patientPhysiotherapy + '?user_id=${widget.patient.id}',
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
