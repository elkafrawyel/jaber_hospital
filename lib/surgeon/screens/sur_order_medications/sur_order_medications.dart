part of 'sur_order_medications_imports.dart';

class SurOrderMedications extends StatefulWidget {
  const SurOrderMedications({Key? key}) : super(key: key);

  @override
  State<SurOrderMedications> createState() => _SurOrderMedicationsState();
}

class _SurOrderMedicationsState extends State<SurOrderMedications> {
  SurOrderMedicationsData surOrderMedicationsData = SurOrderMedicationsData();

  @override
  void initState() {
    surOrderMedicationsData.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: GeneralScaffold(
        back: true,
        title: "Order Medications",
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            Form(
              key: surOrderMedicationsData.formKey,
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
                    hintColor: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.color
                        ?.withOpacity(.8),
                    fieldTypes: FieldTypes.clickable,
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
                    onTab: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          // barrierColor: Colors.transparent,
                          context: context,
                          builder: (_) => BuildPatientNameBottomSheet());
                    },
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  MyText(
                    title: "Patient Mobile Number",
                    size: 12,
                    color: MyColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  GenericTextField(
                    hintColor: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.color
                        ?.withOpacity(.8),
                    fieldTypes: FieldTypes.normal,
                    fillColor: MyColors.textFields,
                    hint: "Patient Mobile Number",
                    controller: SurOrderMedicationsData().PatientMobileNumber,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    action: TextInputAction.next,
                    type: TextInputType.phone,
                    validate: (value) => value!.validatePhone(context),
                  ),
                  MyText(
                    title: "Date",
                    size: 12,
                    color: MyColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  BlocConsumer<GenericBloc<String?>, GenericState<String?>>(
                    bloc: SurOrderMedicationsData().dateBloc,
                    listener: (context, state) {
                      if (state.data != null) {
                        SurOrderMedicationsData().Date.text = state.data!;
                      }
                    },
                    builder: (context, state) {
                      return GenericTextField(
                        hintColor: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.color
                            ?.withOpacity(.8),
                        fieldTypes: FieldTypes.clickable,
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
                        onTab: () =>
                            SurOrderMedicationsData().chooseFromDate(context),
                        validate: (value) => value!.validateEmpty(context),
                      );
                    },
                  ),
                  MyText(
                    title: 'Company',
                    size: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  BlocBuilder<GenericBloc<List<CompanyId>?>,
                      GenericState<List<CompanyId>?>>(
                    bloc: surOrderMedicationsData.companiesCubit,
                    builder: (context, state) {
                      if (state is GenericUpdateState) {
                        return AppDropMenu<CompanyId>(
                          hint: "Company",
                          items: surOrderMedicationsData.companies,
                          expanded: true,
                          selectedItem:
                          surOrderMedicationsData.selectedCompany ?? null,
                          onChanged: (value) {
                            CompanyId company = value as CompanyId;
                            log("val=> ${company.sId}");
                            log("val=> ${company.companyNameEn}");
                            surOrderMedicationsData.selectedCompany = company;
                            setState(() {});
                            surOrderMedicationsData.fetchCompanyMedications(
                                context, company.sId ?? "");
                          },
                        );
                      } else {
                        return SizedBox(
                          height: 56,
                          child: Shimmer.fromColors(
                            baseColor: Colors.white,
                            highlightColor: MyColors.greyWhite,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 10, left: 20, right: 20),
                              height: MediaQuery.of(context).size.height / 6,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: MyColors.white,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 8.0),
                  if (surOrderMedicationsData.selectedCompany != null) ...[
                    MyText(
                      title: "Medication",
                      size: 12,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    BlocConsumer<GenericBloc<List<MedicationInfo>?>,
                        GenericState<List<MedicationInfo>?>>(
                      // bloc: SurOrderMedicationsData().companyMedicationsCubit,
                      bloc: SurOrderMedicationsData().selectedMedicationCubit,
                      listener: (context, state) {
                        if (state.data!.isNotEmpty) {
                          SurOrderMedicationsData().Medication.text = "${state.data?.length} Medications";
                        }
                      },
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GenericTextField(
                              hintColor: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.color
                                  ?.withOpacity(.8),
                              fieldTypes: FieldTypes.clickable,
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
                              onTab: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (_) =>
                                        BuildMedicationBottomSheet());
                              },
                              validate: (value) =>
                                  value!.validateEmpty(context),
                            ),
                            Wrap(
                              spacing: 10,
                              children: List.generate(
                                state.data?.length??0,
                                (index) => Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xffD3E0F6),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MyText(
                                        title:
                                            state.data?[index].medicationName ??
                                                '',
                                        size: 12,
                                        color: MyColors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      MyText(
                                        title:
                                            "  (${state.data?[index].quantity ?? ''})",
                                        size: 12,
                                        color: MyColors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            SurOrderMedicationsData()
                                                .selectedMedicationCubit
                                                .state.data.remove(state.data?[index]);
                                            SurOrderMedicationsData()
                                                .selectedMedicationCubit
                                                .onUpdateData(
                                                    SurOrderMedicationsData().selectedMedicationCubit.state.data);
                                          },
                                          child: Icon(Icons.close, color: MyColors.primary)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    DefaultButton(
                      title: "Confirm Request",
                      margin: const EdgeInsets.symmetric(vertical: 28, horizontal: 48),
                      onTap: ()=> SurOrderMedicationsData().onAddMedication(context),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
