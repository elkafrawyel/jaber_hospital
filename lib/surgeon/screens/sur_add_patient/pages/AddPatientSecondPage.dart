part of 'PagesWImports.dart';

List<String>listt = [];
class AddPatientSecondPage extends StatelessWidget {
  const AddPatientSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        //generic form field
        MyText(
          title: "Co-morbidities:",
          size: 12,
          fontWeight: FontWeight.bold,
          color: MyColors.primary,
        ),
        const SizedBox(height: 10),
        MyText(
          title: "DM",
          size: 12,
          fontWeight: FontWeight.bold,
          color: MyColors.black,
        ),
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: SurAddPatientData().refluxSelectionCubit,
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  children: [
                    Radio(
                        value: true,
                        groupValue: state.data,
                        onChanged: (value) => SurAddPatientData().refluxSelectionCubit.onUpdateData(value!)),
                    MyText(
                      title: "Yes",
                      size: 12,
                      color: MyColors.black,
                    ),
                    const SizedBox(width: 40),
                    Radio(
                        value: false,
                        groupValue: state.data,
                        onChanged: (value) => SurAddPatientData()
                            .refluxSelectionCubit
                            .onUpdateData(value!)),
                    MyText(
                      title: "No",
                      size: 12,
                      color: MyColors.black,
                    ),
                  ],
                ),
                Offstage(
                  offstage: !state.data,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        title: "DM Type:",
                        size: 12,
                        fontWeight: FontWeight.bold,
                        color: MyColors.black,
                      ),
                      BlocBuilder<GenericBloc<int>, GenericState<int>>(
                        bloc: SurAddPatientData().dmTypeSelectionCubit,
                        builder: (context, state) {
                          return Row(
                            children: [
                              Radio(
                                  value: 1,
                                  groupValue: state.data,
                                  onChanged: (value) => SurAddPatientData()
                                      .dmTypeSelectionCubit
                                      .onUpdateData(value!)),
                              MyText(
                                title: "Type I",
                                size: 12,
                                color: MyColors.black,
                              ),
                              const SizedBox(width: 40),
                              Radio(
                                  value: 2,
                                  groupValue: state.data,
                                  onChanged: (value) => SurAddPatientData()
                                      .dmTypeSelectionCubit
                                      .onUpdateData(value!)),
                              MyText(
                                title: "Type II",
                                size: 12,
                                color: MyColors.black,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        BlocBuilder<GenericBloc<String>, GenericState<String>>(
          bloc: SurAddPatientData().diagnosisTypesCubit,
          builder: (context, state) {
            var diaCubit = SurAddPatientData().diagnosisTypesCubit;
            final List<String> list = SurAddPatientData().diagnosisTypes;
            return Column(
              children: List.generate(
                  list.length,
                      (index) => Column(
                    children: [
                      const Divider(),
                      Row(
                        children: [
                          Checkbox(
                              value: state.data.contains(list[index]),
                              onChanged: (value) {
                                if (value!) {
                                  log("selected value: ${state.data}");
                                  diaCubit.onUpdateData(
                                      state.data + list[index]);
                                } else {
                                  diaCubit.onUpdateData(state.data
                                      .replaceAll(list[index], ""));
                                }
                              }),
                          MyText(
                            title: list[index],
                            size: 12,
                            color: MyColors.black,
                          ),
                        ],
                      ),
                    ],
                  )),
            );
          },
        ),
        const Divider(),
        MyText(
          title: "Cardiac Disease",
          size: 12,
          fontWeight: FontWeight.bold,
          color: MyColors.black,
        ),
        BlocBuilder<GenericBloc<String>, GenericState<String>>(
          bloc: SurAddPatientData().cardiacDiseaseCubit,
          builder: (context, state) {
            var cardiacCubit = SurAddPatientData().cardiacDiseaseCubit;
            final List<String> list = SurAddPatientData().cardiacDiseaseTypes;
            return Row(
              children: List.generate(
                  list.length,
                      (index) => Column(
                    children: [
                      const Divider(),
                      Row(
                        children: [
                          Checkbox(
                              value: state.data.contains(list[index]),
                              onChanged: (value) {
                                if (value!) {
                                  cardiacCubit.onUpdateData(
                                      state.data + list[index]);
                                  // log("selected value: ${state.data}");
                                  listt.add(list[index]);
                                  log("listt ${listt}");
                                } else {
                                  cardiacCubit.onUpdateData(state.data
                                      .replaceAll(list[index], ""));
                                  listt.remove(list[index]);
                                  log("listt removed ${listt}");
                                }
                              }),
                          MyText(
                            title: list[index],
                            size: 12,
                            color: MyColors.black,
                          ),
                          const SizedBox(width: 40),
                        ],
                      ),
                    ],
                  )),
            );
          },
        ),
        MyText(
          title: "Respiratory Disease:",
          size: 12,
          fontWeight: FontWeight.bold,
          color: MyColors.black,
        ),
        BlocBuilder<GenericBloc<String>, GenericState<String>>(
          bloc: SurAddPatientData().respiratoryDiseaseCubit,
          builder: (context, state) {
            var cardiacCubit = SurAddPatientData().respiratoryDiseaseCubit;
            final List<String> list = SurAddPatientData().respiratoryDiseaseTypes;
            return Wrap(
              direction: Axis.horizontal,
              children: List.generate(
                  list.length,
                      (index) =>   Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                              value: state.data.contains(list[index]),
                              onChanged: (value) {
                                if (value!) {
                                  cardiacCubit.onUpdateData(
                                      state.data + list[index]);
                                  // log("selected value: ${state.data}");
                                  listt.add(list[index]);
                                  log("listt ${listt}");
                                } else {
                                  cardiacCubit.onUpdateData(state.data
                                      .replaceAll(list[index], ""));
                                  listt.remove(list[index]);
                                  log("listt removed ${listt}");
                                }
                              }),
                          MyText(
                            title: list[index],
                            size: 12,
                            color: MyColors.black,
                          ),
                          const SizedBox(width: 40),
                        ],
                      )),
            );
          },
        ),
        MyText(
          title: "Other notes",
          size: 12,
          fontWeight: FontWeight.bold,
          color: MyColors.black,
        ),
        GenericTextField(
          max: 3,
          hintColor:
              Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
          fieldTypes: FieldTypes.rich,
          fillColor: MyColors.textFields,
          hint: "Other notes",
          controller: SurAddPatientData().patientName,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.text,
          validate: (value) => value!.validateEmpty(context),
        ),
        DefaultButton(
          title: "Next",
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
          onTap: () =>SurAddPatientData().nextPage(),
        ),

      ],
    );
  }
}
