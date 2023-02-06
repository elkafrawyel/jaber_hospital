part of 'PagesWImports.dart';

class AddPatientFirstPage extends StatelessWidget {
  const AddPatientFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        MyText(
            title: "Basic Info:",
            size: 12,
            fontWeight: FontWeight.bold,
            color: MyColors.primary),
        const SizedBox(height: 10),
        MyText(title: "Patient name", size: 12, fontWeight: FontWeight.bold),
        GenericTextField(
          hintColor:
              Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
          fieldTypes: FieldTypes.normal,
          fillColor: MyColors.textFields,
          hint: "Patient name",
          controller: SurAddPatientData().patientName,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.text,
          validate: (value) => value!.validateEmpty(context),
        ),
        MyText(
            title: "Patient file number",
            size: 12,
            fontWeight: FontWeight.bold),
        GenericTextField(
          hintColor:
              Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
          fieldTypes: FieldTypes.normal,
          fillColor: MyColors.textFields,
          hint: "Patient file number",
          controller: SurAddPatientData().patientFileNumber,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.number,
          validate: (value) => value!.validateEmpty(context),
        ),
        MyText(title: "Patient mobile", size: 12, fontWeight: FontWeight.bold),
        GenericTextField(
          hintColor:
              Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
          fieldTypes: FieldTypes.normal,
          fillColor: MyColors.textFields,
          hint: "Patient mobile",
          controller: SurAddPatientData().patientId,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.phone,
          validate: (value) => value!.validatePhone(context),
        ),
        MyText(title: "Patient age", size: 12, fontWeight: FontWeight.bold),
        GenericTextField(
          hintColor:
              Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
          fieldTypes: FieldTypes.normal,
          fillColor: MyColors.textFields,
          hint: "Patient age",
          controller: SurAddPatientData().patientAge,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.number,
          validate: (value) => value!.validateEmpty(context),
        ),
        MyText(title: "Patient weight", size: 12, fontWeight: FontWeight.bold),
        GenericTextField(
          hintColor:
              Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
          fieldTypes: FieldTypes.normal,
          fillColor: MyColors.textFields,
          hint: "Patient weight",
          controller: SurAddPatientData().patientWeight,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.number,
          onChange: (value) => SurAddPatientData().calculateBMI(),
          validate: (value) => value!.validateEmpty(context),
        ),
        MyText(title: "Patient height", size: 12, fontWeight: FontWeight.bold),
        GenericTextField(
          hintColor:
              Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
          fieldTypes: FieldTypes.normal,
          fillColor: MyColors.textFields,
          hint: "Patient height",
          controller: SurAddPatientData().patientHeight,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.number,
          onChange: (value) => SurAddPatientData().calculateBMI(),
          validate: (value) => value!.validateEmpty(context),
        ),
        MyText(title: "BMI", size: 12, fontWeight: FontWeight.bold),
        GenericTextField(
          hintColor:
              Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
          fieldTypes: FieldTypes.clickable,
          fillColor: MyColors.textFields,
          hint: "XX",
          controller: SurAddPatientData().BMI,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.done,
          type: TextInputType.number,
          validate: (value) => value!.validateEmpty(context),
        ),

        Row(
          children: [
            Expanded(
              child: DefaultButton(  
                title: "Previous",
                borderColor: MyColors.primary,
                color: MyColors.white,
                textColor: MyColors.primary,
                onTap: () =>SurAddPatientData().previousPage(),
              ),
            ),
            Expanded(
              child: DefaultButton(
                title: "Next",
                onTap: () =>SurAddPatientData().nextPage(),
              ),
            ),
          ],
        )
      ],
    );
  }
}
