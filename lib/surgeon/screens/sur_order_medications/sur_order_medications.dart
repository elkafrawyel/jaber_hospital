part of'sur_order_medications_imports.dart';

class SurOrderMedications extends StatefulWidget {
  const SurOrderMedications({Key? key}) : super(key: key);

  @override
  State<SurOrderMedications> createState() => _SurOrderMedicationsState();
}

class _SurOrderMedicationsState extends State<SurOrderMedications> {
  @override
  void initState() {
    SurOrderMedicationsData().init(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      back: true,
      title: "Order Medications",
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [

          Form(
            key: SurOrderMedicationsData().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  title: "Patient Name",
                  size: 12,
                  color: MyColors.black,
                  fontWeight: FontWeight.bold,
                ),
                GenericTextField(
                  hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                  fieldTypes: FieldTypes.normal,
                  fillColor: MyColors.textFields,
                  hint: "Patient Name",
                  controller: SurOrderMedicationsData().patientName,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.next,
                  type: TextInputType.text,
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down,
                    color: MyColors.black,
                  ),
                  validate: (value) => value!.validateEmpty(context),
                ),
                MyText(
                  title: "Patient Mobile Number",
                  size: 12,
                  color: MyColors.black,
                  fontWeight: FontWeight.bold,
                ),
                GenericTextField(
                  hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                  fieldTypes: FieldTypes.normal,
                  fillColor: MyColors.textFields,
                  hint: "Patient Mobile Number",
                  controller: SurOrderMedicationsData().PatientMobileNumber,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.next,
                  type: TextInputType.text,
                  validate: (value) => value!.validatePhone(context),
                ),
                MyText(
                  title: "Date",
                  size: 12,
                  color: MyColors.black,
                  fontWeight: FontWeight.bold,
                ),
                GenericTextField(
                  hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                  fieldTypes: FieldTypes.normal,
                  fillColor: MyColors.textFields,
                  hint: "Date",
                  controller: SurOrderMedicationsData().Date,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.next,
                  type: TextInputType.text,
                  suffixIcon: Icon(
                    Icons.calendar_month,
                    color: MyColors.primary,
                  ),
                  validate: (value) => value!.validateEmpty(context),
                ),
                MyText(
                  title: "Medication",
                  size: 12,
                  color: MyColors.black,
                  fontWeight: FontWeight.bold,
                ),
                GenericTextField(
                  hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                  fieldTypes: FieldTypes.normal,
                  fillColor: MyColors.textFields,
                  hint: "Please choose from the list",
                  controller: SurOrderMedicationsData().Medication,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.done,
                  type: TextInputType.text,
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down,
                    color: MyColors.black,
                  ),
                  validate: (value) => value!.validateEmpty(context),
                ),
                DefaultButton(
                  title: "Confirm Request",
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                  onTap: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
