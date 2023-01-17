part of'PagesWImports.dart';


class AddPatientSecondPage extends StatelessWidget {
  const AddPatientSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        //generic form field
        GenericTextField(
          hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
          fieldTypes: FieldTypes.normal,
          fillColor: MyColors.textFields,
          hint: "Patient name",
          controller: SurAddPatientData().patientName,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.text,
          validate: (value) => value!.validateEmpty(context),
        ),
      ],
    );
  }
}