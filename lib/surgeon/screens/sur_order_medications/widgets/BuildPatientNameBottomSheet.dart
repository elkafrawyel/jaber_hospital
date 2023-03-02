part of 'SurOrderMedicationWidgetImports.dart';

class BuildPatientNameBottomSheet extends StatefulWidget {
  const BuildPatientNameBottomSheet({Key? key}) : super(key: key);

  @override
  State<BuildPatientNameBottomSheet> createState() =>
      _BuildPatientNameBottomSheetState();
}

class _BuildPatientNameBottomSheetState
    extends State<BuildPatientNameBottomSheet> {
  @override
  void initState() {
    SurOrderMedicationsData().getPatientName(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: const SizedBox(height: 50),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  SurOrderMedicationsData().patientName.clear();
                  navigationKey.currentState!.pop();
                },
                child: Icon(Icons.arrow_back_ios_new,
                    color: MyColors.primary, size: 30),
              ),
              Expanded(
                child: GenericTextField(
                  hintColor: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.color
                      ?.withOpacity(.8),
                  fieldTypes: FieldTypes.normal,
                  fillColor: MyColors.textFields,
                  hint: "Search Patient Name",
                  controller: SurOrderMedicationsData().search,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  action: TextInputAction.next,
                  type: TextInputType.text,
                  onChange: (value) =>
                      SurOrderMedicationsData().getPatientNameBySearch(),
                  onSubmit: () =>
                      SurOrderMedicationsData().getPatientNameBySearch(),
                  validate: (value) => value!.noValidate(),
                ),
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<GenericBloc<List<PatientNameModel>>,
                GenericState<List<PatientNameModel>>>(
              bloc: SurOrderMedicationsData().patientNameBloc,
              builder: (context, state) {
                if (state is GenericUpdateState<List<PatientNameModel>>) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: MyColors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            RadioListTile(
                              value: state.data[index].fullNameEn,
                              groupValue:
                                  SurOrderMedicationsData().patientName.text,
                              onChanged: (value) {
                                SurOrderMedicationsData().patientName.text =
                                    value.toString();
                                SurOrderMedicationsData()
                                    .patientNameBloc
                                    .onUpdateData(state.data);
                              },
                              title: MyText(
                                title: state.data[index].fullNameEn ?? '',
                                size: 12,
                                color: MyColors.black,
                              ),
                            ),
                            Divider(
                              color: MyColors.grey,
                            )
                          ],
                        );
                      },
                    ),
                  );
                } else {
                  return Center(child: LoadingDialog.showLoadingView());
                }
              },
            ),
          ),
          DefaultButton(
            title: "Choose Patient",
            onTap: ()=>SurOrderMedicationsData().onSelectPatientName(context),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
          ),
        ],
      ),
    );
  }
}
