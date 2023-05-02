import 'package:flutter/material.dart';

class DietitionAddPatientDietData extends StatefulWidget {
  final Patient patient;

  const DietitionAddPatientDietData({Key? key, this.patient}) : super(key: key);

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
  bool attempt_lose_notes = false;
  late TextEditingController dietation_feedback_decision;
  late TextEditingController dietation_feedback_decision_date;
  bool proteint_in_take = false;
  bool taking_supplements = false;
  bool fiber_in_take = false;
  bool physically_active = false;
  late TextEditingController diet_plan;
  late TextEditingController post_feedback;

  @override
  void initState() {
    super.initState();
    BMI = TextEditingController();
    patientWeight = TextEditingController(widget.patient.);
    patientHeight = TextEditingController();
    dietation_feedback_decision = TextEditingController();
  }

  @override
  dispose() {
    BMI.dispose();
    patientHeight.dispose();
    patientWeight.dispose();
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Diet Plan Data'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          MyText(
          title: "Patient weight (KG)",
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        GenericTextField(
          hintColor: Theme
              .of(context)
              .textTheme
              .subtitle1
              ?.color
              ?.withOpacity(.8),
          fieldTypes: FieldTypes.normal,
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
          hintColor: Theme
              .of(context)
              .textTheme
              .subtitle1
              ?.color
              ?.withOpacity(.8),
          fieldTypes: FieldTypes.normal,
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
          hintColor: Theme
              .of(context)
              .textTheme
              .subtitle1
              ?.color
              ?.withOpacity(.8),
          fieldTypes: FieldTypes.clickable,
          fillColor: MyColors.textFields,
          hint: "XX",
          controller: SurAddPatientData().BMI,
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
            Expanded(child: Row(
              children: [
                Checkbox(value: bulkEater, onChanged: (value) {
                  setState(() {
                    bulkEater = value;
                  });
                },),
                Text('Bulk Eater'),
              ],
            ),),
            Expanded(child: Row(
              children: [
                Checkbox(value: sweetEater, onChanged: (value) {
                  setState(() {
                    sweetEater = value;
                  });
                },),
                Text('Sweet Eater'),
              ],
            ),),

          ],
        ),
        Row(
          children: [
            Expanded(child: Row(
              children: [
                Checkbox(value: fizzy_drinks, onChanged: (value) {
                  setState(() {
                    fizzy_drinks = value;
                  });
                },),
                Text('Fizzy Drinks'),
              ],
            ),),
            Expanded(child: Row(
              children: [
                Checkbox(value: frequent_meals, onChanged: (value) {
                  setState(() {
                    frequent_meals = value;
                  });
                },),
                Text('Frequent Meals'),
              ],
            ),),

          ],
        ), Row(
        children: [
          Expanded(child: Row(
            children: [
              Checkbox(value: late_time, onChanged: (value) {
                setState(() {
                  late_time = value;
                });
              },),
              Text('Late Time'),
            ],
          ),),
          Expanded(child: Row(
            children: [
              Checkbox(value: nippler, onChanged: (value) {
                setState(() {
                  nippler = value;
                });
              },),
              Text('Nippler'),
            ],
          ),),
          Row(
            children: [
              Expanded(child: Row(
                children: [
                  Checkbox(value: junk_food, onChanged: (value) {
                    setState(() {
                      junk_food = value;
                    });
                  },),
                  Text('Junk Food'),
                ],
              ),),

            ],
          ),
        ],
      ),
      ),
    );
  }
}
