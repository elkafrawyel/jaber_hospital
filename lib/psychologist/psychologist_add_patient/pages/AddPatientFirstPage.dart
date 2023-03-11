part of 'PagesWImports.dart';

class AddPatientFirstPage extends StatelessWidget {
  const AddPatientFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        Form(
          key: PsychologistAddPatientData().formKey1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                  title: "Basic Info:",
                  size: 12,
                  fontWeight: FontWeight.bold,
                  color: MyColors.primary),
              const SizedBox(height: 10),
              MyText(title: "Gender", size: 12, fontWeight: FontWeight.bold),
              BlocBuilder<GenericBloc<String>, GenericState<String>>(
                bloc: PsychologistAddPatientData().patientGenderCubit,
                builder: (context, state) {
                  return Row(
                    children: [
                      Radio(
                          value: "male",
                          groupValue: state.data,
                          onChanged: (value) => PsychologistAddPatientData().patientGenderCubit.onUpdateData(value!)),
                      MyText(title: "Male", size: 10),
                      const SizedBox(width: 50),
                      Radio(
                        value: "female",
                        groupValue: state.data,
                        onChanged: (value) => PsychologistAddPatientData().patientGenderCubit.onUpdateData(value!),
                      ),
                      MyText(title: "Female", size: 10),
                    ],
                  );
                },
              ),
              MyText(
                  title: "Patient name (Arabic)",
                  size: 12,
                  fontWeight: FontWeight.bold),
              GenericTextField(
                hintColor:
                    Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                fieldTypes: FieldTypes.normal,
                fillColor: MyColors.textFields,
                hint: "Patient name (Arabic)",
                controller: PsychologistAddPatientData().patientNameAr,
                margin: const EdgeInsets.symmetric(vertical: 10),
                action: TextInputAction.next,
                type: TextInputType.text,
                validate: (value) => value!.validateEmpty(context),
              ),
              MyText(
                  title: "Patient name (English)",
                  size: 12,
                  fontWeight: FontWeight.bold),
              GenericTextField(
                hintColor:
                    Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                fieldTypes: FieldTypes.normal,
                fillColor: MyColors.textFields,
                hint: "Patient name (English)",
                controller: PsychologistAddPatientData().patientNameEn,
                margin: const EdgeInsets.symmetric(vertical: 10),
                action: TextInputAction.next,
                type: TextInputType.text,
                validate: (value) => value!.validateEmpty(context),
              ),
              MyText(
                  title: "Patient ID",
                  size: 12,
                  fontWeight: FontWeight.bold),
              GenericTextField(
                hintColor:
                    Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                fieldTypes: FieldTypes.normal,
                fillColor: MyColors.textFields,
                hint: "Patient ID",
                controller: PsychologistAddPatientData().patientId,
                margin: const EdgeInsets.symmetric(vertical: 10),
                action: TextInputAction.next,
                type: TextInputType.number,
                validate: (value) {
                  if (value!.validateEmpty(context) != null) {
                    return value.validateEmpty(context);
                  } else if (value.length != 12) {
                    return "ID must be 12 digit";
                  }
                },
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
                controller: PsychologistAddPatientData().patientFileNumber,
                margin: const EdgeInsets.symmetric(vertical: 10),
                action: TextInputAction.next,
                type: TextInputType.number,
                validate: (value) => value!.validateEmpty(context),
              ),
              MyText(
                  title: "Patient Email", size: 12, fontWeight: FontWeight.bold),
              GenericTextField(
                hintColor:
                    Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                fieldTypes: FieldTypes.normal,
                fillColor: MyColors.textFields,
                hint: "Patient Email",
                controller: PsychologistAddPatientData().patientEmail,
                margin: const EdgeInsets.symmetric(vertical: 10),
                action: TextInputAction.next,
                type: TextInputType.emailAddress,
                validate: (value) => value!.validateEmail(context),
              ),
              MyText(
                  title: "Patient mobile 1", size: 12, fontWeight: FontWeight.bold),
              GenericTextField(
                hintColor:
                    Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                fieldTypes: FieldTypes.normal,
                fillColor: MyColors.textFields,
                hint: "Patient mobile 1",
                controller: PsychologistAddPatientData().patientMobile1,
                margin: const EdgeInsets.symmetric(vertical: 10),
                action: TextInputAction.next,
                type: TextInputType.phone,
                validate: (value) => value!.validatePhone(context),
              ),
              MyText(
                  title: "Patient mobile 2", size: 12, fontWeight: FontWeight.bold),
              GenericTextField(
                hintColor:
                    Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                fieldTypes: FieldTypes.normal,
                fillColor: MyColors.textFields,
                hint: "Patient mobile 2",
                controller: PsychologistAddPatientData().patientMobile2,
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
                controller: PsychologistAddPatientData().patientAge,
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
                controller: PsychologistAddPatientData().patientWeight,
                margin: const EdgeInsets.symmetric(vertical: 10),
                action: TextInputAction.next,
                type: TextInputType.number,
                onChange: (value) => PsychologistAddPatientData().calculateBMI(),
                validate: (value) => value!.validateEmpty(context),
              ),
              MyText(title: "Patient height", size: 12, fontWeight: FontWeight.bold),
              GenericTextField(
                hintColor:
                    Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                fieldTypes: FieldTypes.normal,
                fillColor: MyColors.textFields,
                hint: "Patient height",
                controller: PsychologistAddPatientData().patientHeight,
                margin: const EdgeInsets.symmetric(vertical: 10),
                action: TextInputAction.next,
                type: TextInputType.number,
                onChange: (value) => PsychologistAddPatientData().calculateBMI(),
                validate: (value) => value!.validateEmpty(context),
              ),
              MyText(title: "BMI", size: 12, fontWeight: FontWeight.bold),
              GenericTextField(
                hintColor:
                    Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                fieldTypes: FieldTypes.clickable,
                fillColor: MyColors.textFields,
                hint: "XX",
                controller: PsychologistAddPatientData().BMI,
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
                      onTap: () => PsychologistAddPatientData().previousPage(),
                    ),
                  ),
                  Expanded(
                    child: DefaultButton(
                      title: "Next",
                      onTap: () => PsychologistAddPatientData().addPatientFirst(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
