part of 'PagesWImports.dart';

class AddPatientFifthPage extends StatelessWidget {
  const AddPatientFifthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        MyText(
          title: "Procedures:",
          size: 12,
          fontWeight: FontWeight.bold,
          color: MyColors.primary,
        ),
        const SizedBox(height: 10),
        MyText(
          title: "Previous bariatric procedures:",
          size: 12,
          fontWeight: FontWeight.bold,
          color: MyColors.black,
        ),
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: SurAddPatientData().proceduresSelectionCubit,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RadioListTile(
                  title: MyText(
                    title: "Yes",
                    size: 12,
                    color: MyColors.black,
                  ),
                  value: true,
                  groupValue: state.data,
                  onChanged: (value) => SurAddPatientData().proceduresSelectionCubit.onUpdateData(value!),
                ),
                RadioListTile(
                  title: MyText(
                    title: "No",
                    size: 12,
                    color: MyColors.black,
                  ),
                  value: false,
                  groupValue: state.data,
                  onChanged: (value) => SurAddPatientData().proceduresSelectionCubit.onUpdateData(value!),
                ),
                Offstage(
                  offstage: !state.data,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(title: "Outcome Result", size: 12, fontWeight: FontWeight.bold),
                      GenericTextField(
                        hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                        fieldTypes: FieldTypes.normal,
                        fillColor: MyColors.textFields,
                        hint: "Outcome weight loss result",
                        controller: SurAddPatientData().proceduresOutcomeResultCubit,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        action: TextInputAction.next,
                        type: TextInputType.text,
                        validate: (value) => value!.validateEmpty(context),
                      ),
                      MyText(title: "Outcome Date", size: 12, fontWeight: FontWeight.bold),
                      InkWell(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          AdaptivePicker.datePicker(
                            context: context,
                            title: tr(context, "Date"),
                            onConfirm: (date) {
                              if (date != null) {
                                String dateStr = DateFormat("dd-MM-yyyy").format(date);
                                SurAddPatientData().proceduresOutcomeDateCubit.text = dateStr;
                              }
                            },
                          );
                        },
                        child: IgnorePointer(
                          child: GenericTextField(
                            hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                            fieldTypes: FieldTypes.normal,
                            fillColor: MyColors.textFields,
                            hint: "Outcome date",
                            controller: SurAddPatientData().proceduresOutcomeDateCubit,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            action: TextInputAction.next,
                            suffixIcon: Image.asset(Res.imagesCalendar, scale: 2.2, color: MyColors.primary),
                            type: TextInputType.text,
                            validate: (value) => value!.validateEmpty(context),
                          ),
                        ),
                      ),
                      MyText(title: "Surgery Type:", size: 12, fontWeight: FontWeight.bold),
                      BlocBuilder<GenericBloc<String>, GenericState<String>>(
                        bloc: SurAddPatientData().surgeryTypeCubit,
                        builder: (context, state) {
                          return Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            direction: Axis.horizontal,
                            children: List.generate(
                              SurAddPatientData().surgeryTypes.length,
                              (index) => Container(
                                width: MediaQuery.of(context).size.width / 2.6,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Radio(
                                      value: SurAddPatientData().surgeryTypes[index],
                                      groupValue: state.data,
                                      onChanged: (value) => SurAddPatientData().surgeryTypeCubit.onUpdateData(value!),
                                    ),
                                    // Checkbox(
                                    //   value: state.data.contains(SurAddPatientData().surgeryTypes[index]),
                                    //   onChanged: (value) {
                                    //     if (state.data.contains(SurAddPatientData().surgeryTypes[index])) {
                                    //       state.data.remove(SurAddPatientData().surgeryTypes[index]);
                                    //     } else {
                                    //       state.data.add(SurAddPatientData().surgeryTypes[index]);
                                    //     }
                                    //     SurAddPatientData().surgeryTypeCubit.onUpdateData(state.data);
                                    //   },
                                    // ),
                                    Expanded(
                                      child: MyText(
                                        title: SurAddPatientData().surgeryTypes[index],
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
                onTap: () => SurAddPatientData().addPatientFifth(context),
              ),
            ),
          ],
        )
      ],
    );
  }
}
