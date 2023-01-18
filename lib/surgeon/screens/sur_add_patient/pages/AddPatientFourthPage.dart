part of 'PagesWImports.dart';

class AddPatientFourthPage extends StatelessWidget {
  const AddPatientFourthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        MyText(
          title: "Surgical History:",
          size: 12,
          fontWeight: FontWeight.bold,
          color: MyColors.primary,
        ),
        const SizedBox(height: 10),
        MyText(
          title: "History Of Ballon:",
          size: 12,
          fontWeight: FontWeight.bold,
          color: MyColors.black,
        ),
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: SurAddPatientData().historyBallonSelectionCubit,
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  children: [
                    Radio(
                        value: true,
                        groupValue: state.data,
                        onChanged: (value) => SurAddPatientData()
                            .historyBallonSelectionCubit
                            .onUpdateData(value!)),
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
                            .historyBallonSelectionCubit
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
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                    title: "Weight loss from",
                                    size: 12,
                                    fontWeight: FontWeight.bold),
                                GenericTextField(
                                  hintColor: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.color
                                      ?.withOpacity(.8),
                                  fieldTypes: FieldTypes.normal,
                                  fillColor: MyColors.textFields,
                                  hint: "Weight loss from",
                                  controller:
                                      SurAddPatientData().weightLossFrom,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  action: TextInputAction.next,
                                  type: TextInputType.text,
                                  validate: (value) =>
                                      value!.validateEmpty(context),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                    title: "Weight loss to",
                                    size: 12,
                                    fontWeight: FontWeight.bold),
                                GenericTextField(
                                  hintColor: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.color
                                      ?.withOpacity(.8),
                                  fieldTypes: FieldTypes.normal,
                                  fillColor: MyColors.textFields,
                                  hint: "Weight loss to",
                                  controller: SurAddPatientData().weightLossTo,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  action: TextInputAction.next,
                                  type: TextInputType.text,
                                  validate: (value) =>
                                      value!.validateEmpty(context),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      MyText(
                          title: "Date Of Insertion",
                          size: 12,
                          fontWeight: FontWeight.bold),
                      GenericTextField(
                        hintColor: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.color
                            ?.withOpacity(.8),
                        fieldTypes: FieldTypes.normal,
                        fillColor: MyColors.textFields,
                        hint: "Date Of Insertion",
                        controller: SurAddPatientData().insertionDate,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        action: TextInputAction.next,
                        suffixIcon: Image.asset(Res.imagesCalendar, scale: 2.2,color: MyColors.primary),
                        type: TextInputType.text,
                        validate: (value) => value!.validateEmpty(context),
                      ),
                      MyText(
                          title: "Date Of Removal",
                          size: 12,
                          fontWeight: FontWeight.bold),
                      GenericTextField(
                        hintColor: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.color
                            ?.withOpacity(.8),
                        fieldTypes: FieldTypes.normal,
                        fillColor: MyColors.textFields,
                        hint: "Date Of Removal",
                        controller: SurAddPatientData().removalDate,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        action: TextInputAction.next,
                        suffixIcon: Image.asset(Res.imagesCalendar, scale: 2.2,color: MyColors.primary),
                        type: TextInputType.text,
                        validate: (value) => value!.validateEmpty(context),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        const Divider(),
        MyText(
          title: "History Of Weight Loss Medication:",
          size: 12,
          fontWeight: FontWeight.bold,
          color: MyColors.black,
        ),
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: SurAddPatientData().historyWeightLossSelectionCubit,
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  children: [
                    Radio(
                        value: true,
                        groupValue: state.data,
                        onChanged: (value) => SurAddPatientData()
                            .historyWeightLossSelectionCubit
                            .onUpdateData(value!)),
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
                            .historyWeightLossSelectionCubit
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
                        title: "Outcome Result",
                        size: 12,
                        fontWeight: FontWeight.bold,
                        color: MyColors.black,
                      ),
                      GenericTextField(
                        hintColor: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.color
                            ?.withOpacity(.8),
                        fieldTypes: FieldTypes.normal,
                        fillColor: MyColors.textFields,
                        hint: "Outcome Result",
                        controller: SurAddPatientData().outcomeResult,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        action: TextInputAction.next,
                        type: TextInputType.text,
                        validate: (value) => value!.validateEmpty(context),
                      ),
                      MyText(
                        title: "Outcome Date",
                        size: 12,
                        fontWeight: FontWeight.bold,
                        color: MyColors.black,
                      ),
                      GenericTextField(
                        hintColor: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.color
                            ?.withOpacity(.8),
                        fieldTypes: FieldTypes.normal,
                        fillColor: MyColors.textFields,
                        hint: "Outcome Date",
                        controller: SurAddPatientData().outcomeDate,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        action: TextInputAction.next,
                        suffixIcon: Image.asset(Res.imagesCalendar, scale: 2.2,color: MyColors.primary),
                        type: TextInputType.text,
                        validate: (value) => value!.validateEmpty(context),
                      ),

                      MyText(
                        title: "Medication Type:",
                        size: 12,
                        fontWeight: FontWeight.bold,
                        color: MyColors.black,
                      ),
                      BlocBuilder<GenericBloc<String>, GenericState<String>>(
                        bloc: SurAddPatientData().medicationTypeCubit,
                        builder: (context, state) {
                          return Wrap(
                            direction: Axis.horizontal,
                            children: List.generate(
                              SurAddPatientData().medicationTypes.length,
                                  (index) => Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Radio(
                                      value: SurAddPatientData().medicationTypes[index],
                                      groupValue: state.data,
                                      onChanged: (value) => SurAddPatientData()
                                          .medicationTypeCubit
                                          .onUpdateData(value!),
                                    ),
                                    MyText(
                                      title: SurAddPatientData().medicationTypes[index],
                                      size: 12,
                                      color: MyColors.black,
                                    )
                                  ],
                                ),
                              ),
                            ),
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

        DefaultButton(
          title: "Next",
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
          onTap: () => SurAddPatientData().nextPage(),
        ),
      ],
    );
  }
}
