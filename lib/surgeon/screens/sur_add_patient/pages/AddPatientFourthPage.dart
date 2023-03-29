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
                        onChanged: (value) => SurAddPatientData().historyBallonSelectionCubit.onUpdateData(value!)),
                    MyText(
                      title: "Yes",
                      size: 12,
                      color: MyColors.black,
                    ),
                    const SizedBox(width: 40),
                    Radio(
                        value: false,
                        groupValue: state.data,
                        onChanged: (value) => SurAddPatientData().historyBallonSelectionCubit.onUpdateData(value!)),
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
                                MyText(title: "Weight loss from", size: 12, fontWeight: FontWeight.bold),
                                GenericTextField(
                                  hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                                  fieldTypes: FieldTypes.normal,
                                  fillColor: MyColors.textFields,
                                  hint: "Weight loss from",
                                  controller: SurAddPatientData().weightLossFrom,
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  action: TextInputAction.next,
                                  type: TextInputType.number,
                                  validate: (value) => value!.validateEmpty(context),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(title: "Weight loss to", size: 12, fontWeight: FontWeight.bold),
                                GenericTextField(
                                  hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                                  fieldTypes: FieldTypes.normal,
                                  fillColor: MyColors.textFields,
                                  hint: "Weight loss to",
                                  controller: SurAddPatientData().weightLossTo,
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  action: TextInputAction.next,
                                  type: TextInputType.number,
                                  validate: (value) => value!.validateEmpty(context),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      MyText(title: "Date Of Insertion", size: 12, fontWeight: FontWeight.bold),
                      InkWell(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          AdaptivePicker.datePicker(
                            context: context,
                            title: tr(context, "Date"),
                            onConfirm: (date) {
                              if (date != null) {
                                String dateStr = DateFormat("dd-MM-yyyy").format(date);
                                SurAddPatientData().insertionDate.text = dateStr;
                              }
                            },
                          );
                        },
                        child: IgnorePointer(
                          child: GenericTextField(
                            hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                            fieldTypes: FieldTypes.normal,
                            fillColor: MyColors.textFields,
                            hint: "Date Of Insertion",
                            controller: SurAddPatientData().insertionDate,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            action: TextInputAction.next,
                            suffixIcon: Image.asset(Res.imagesCalendar, scale: 2.2, color: MyColors.primary),
                            type: TextInputType.text,
                            validate: (value) => value!.validateEmpty(context),
                          ),
                        ),
                      ),
                      MyText(title: "Date Of Removal", size: 12, fontWeight: FontWeight.bold),
                      InkWell(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          AdaptivePicker.datePicker(
                            context: context,
                            title: tr(context, "Date"),
                            onConfirm: (date) {
                              if (date != null) {
                                String dateStr = DateFormat("dd-MM-yyyy").format(date);
                                SurAddPatientData().removalDate.text = dateStr;
                              }
                            },
                          );
                        },
                        child: IgnorePointer(
                          child: GenericTextField(
                            hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                            fieldTypes: FieldTypes.normal,
                            fillColor: MyColors.textFields,
                            hint: "Date Of Removal",
                            controller: SurAddPatientData().removalDate,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            action: TextInputAction.next,
                            suffixIcon: Image.asset(Res.imagesCalendar, scale: 2.2, color: MyColors.primary),
                            type: TextInputType.text,
                            validate: (value) => value!.validateEmpty(context),
                          ),
                        ),
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
                        onChanged: (value) => SurAddPatientData().historyWeightLossSelectionCubit.onUpdateData(value!)),
                    MyText(
                      title: "Yes",
                      size: 12,
                      color: MyColors.black,
                    ),
                    const SizedBox(width: 40),
                    Radio(
                        value: false,
                        groupValue: state.data,
                        onChanged: (value) => SurAddPatientData().historyWeightLossSelectionCubit.onUpdateData(value!)),
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
                        hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
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
                      InkWell(
                        onTap:(){
                          FocusScope.of(context).requestFocus(FocusNode());
                          AdaptivePicker.datePicker(
                            context: context,
                            title: tr(context, "Date"),
                            onConfirm: (date) {
                              if (date != null) {
                                String dateStr = DateFormat("dd-MM-yyyy").format(date);
                                SurAddPatientData().outcomeDate.text = dateStr;
                              }
                            },
                          );
                        },
                        child: IgnorePointer(
                          child: GenericTextField(
                            hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                            fieldTypes: FieldTypes.normal,
                            fillColor: MyColors.textFields,
                            hint: "Outcome Date",
                            controller: SurAddPatientData().outcomeDate,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            action: TextInputAction.next,
                            suffixIcon: Image.asset(Res.imagesCalendar, scale: 2.2, color: MyColors.primary),
                            type: TextInputType.text,
                            validate: (value) => value!.validateEmpty(context),
                          ),
                        ),
                      ),
                      MyText(
                        title: "Medication Type:",
                        size: 12,
                        fontWeight: FontWeight.bold,
                        color: MyColors.black,
                      ),
                      BlocBuilder<GenericBloc<List<String>>, GenericState<List<String>>>(
                        bloc: SurAddPatientData().medicationTypeCubit,
                        builder: (context, state) {
                          var medCubit = SurAddPatientData().medicationTypeCubit;
                          final List<String> list = SurAddPatientData().medicationTypes;
                          return Wrap(
                            direction: Axis.horizontal,
                            children: List.generate(
                                list.length,
                                (index) => SizedBox(
                                      width: MediaQuery.of(context).size.width / 2.3,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Checkbox(
                                              value: state.data.contains(list[index]),
                                              onChanged: (value) {
                                                if (value!) {
                                                  medCubit.onUpdateData(state.data..add(list[index]));
                                                } else {
                                                  medCubit.onUpdateData(state.data..remove(list[index]));
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
                                    )),
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
                onTap: () => SurAddPatientData().addPatientFourth(context),
              ),
            ),
          ],
        )
      ],
    );
  }
}
