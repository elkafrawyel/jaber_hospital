part of 'PagesWImports.dart';

// List<String>listt = [];
class AddPatientSecondPage extends StatelessWidget {
  const AddPatientSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Row(
          children: [
            Expanded(
              child: DefaultButton(
                title: "Previous",
                borderColor: MyColors.primary,
                color: MyColors.white,
                textColor: MyColors.primary,
                onTap: () => SurAddPatientData().previousPage(),
              ),
            ),
            Expanded(
              child: DefaultButton(
                title: "Next",
                onTap: () => SurAddPatientData().addPatientSecond(context),
              ),
            ),
          ],
        )
      ],
      body: ListView(
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
            bloc: SurAddPatientData().dmSelectCubit,
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: true,
                        groupValue: state.data,
                        onChanged: (value) {
                          SurAddPatientData().dmSelectCubit.onUpdateData(value!);
                        },
                      ),
                      MyText(
                        title: "Yes",
                        size: 12,
                        color: MyColors.black,
                      ),
                      const SizedBox(width: 50),
                      Radio(
                          value: false,
                          groupValue: state.data,
                          onChanged: (value) => SurAddPatientData().dmSelectCubit.onUpdateData(value!)),
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
                                    onChanged: (value) =>
                                        SurAddPatientData().dmTypeSelectionCubit.onUpdateData(value!)),
                                MyText(
                                  title: "Type I",
                                  size: 12,
                                  color: MyColors.black,
                                ),
                                const SizedBox(width: 40),
                                Radio(
                                    value: 2,
                                    groupValue: state.data,
                                    onChanged: (value) =>
                                        SurAddPatientData().dmTypeSelectionCubit.onUpdateData(value!)),
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
          BlocBuilder<GenericBloc<List<String>>, GenericState<List<String>>>(
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
                                ///checkbox and can  select and deselect
                                Checkbox(
                                  value: state.data.contains(list[index]),
                                  onChanged: (value) {
                                    if (value!) {
                                      diaCubit.onUpdateData(state.data..add(list[index]));
                                    } else {
                                      diaCubit.onUpdateData(state.data..remove(list[index]));
                                    }
                                    log("${state.data}");
                                  },
                                ),

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
              return Wrap(
                spacing: 10,
                direction: Axis.horizontal,
                children: List.generate(
                  SurAddPatientData().cardiacDiseaseTypes.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio(
                          value: SurAddPatientData().cardiacDiseaseTypes[index],
                          groupValue: state.data,
                          onChanged: (value) => SurAddPatientData().cardiacDiseaseCubit.onUpdateData(value!),
                        ),
                        Flexible(
                          child: MyText(
                            title: SurAddPatientData().cardiacDiseaseTypes[index],
                            size: 12,
                            color: MyColors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          MyText(
            title: "Respiratory Disease:",
            size: 12,
            fontWeight: FontWeight.bold,
            color: MyColors.black,
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: SurAddPatientData().RespiratoryDiseaseSelectionCubit,
            builder: (context, state) {
              return Row(
                children: [
                  Radio(
                      value: true,
                      groupValue: state.data,
                      onChanged: (value) => SurAddPatientData().RespiratoryDiseaseSelectionCubit.onUpdateData(value!)),
                  MyText(
                    title: "Yes",
                    size: 12,
                    color: MyColors.black,
                  ),
                  const SizedBox(width: 40),
                  Radio(
                      value: false,
                      groupValue: state.data,
                      onChanged: (value) => SurAddPatientData().RespiratoryDiseaseSelectionCubit.onUpdateData(value!)),
                  MyText(
                    title: "No",
                    size: 12,
                    color: MyColors.black,
                  ),
                ],
              );
            },
          ),
          BlocBuilder<GenericBloc<List<String>>, GenericState<List<String>>>(
            bloc: SurAddPatientData().respiratoryDiseaseCubit,
            builder: (context, state) {
              var cardiacCubit = SurAddPatientData().respiratoryDiseaseCubit;
              final List<String> list = SurAddPatientData().respiratoryDiseaseTypes;
              return Wrap(
                direction: Axis.horizontal,
                children: List.generate(
                    list.length,
                    (index) => Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Checkbox(
                                    value: state.data.contains(list[index]),
                                    onChanged: (value) {
                                      if (value!) {
                                        cardiacCubit.onUpdateData(state.data..add(list[index]));
                                      } else {
                                        cardiacCubit.onUpdateData(state.data..remove(list[index]));
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
                            const Divider(),
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
            hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
            fieldTypes: FieldTypes.rich,
            fillColor: MyColors.textFields,
            hint: "Other notes",
            controller: SurAddPatientData().otherNotesDm,
            margin: const EdgeInsets.symmetric(vertical: 10),
            action: TextInputAction.next,
            type: TextInputType.text,
            validate: (value) => value!.validateEmpty(context),
          ),
        ],
      ),
    );
  }
}
