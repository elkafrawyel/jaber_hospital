part of 'PagesWImports.dart';

class AddPatientSixthPage extends StatelessWidget {
  const AddPatientSixthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        MyText(
          title: "Preoperative Investigations:",
          size: 12,
          color: MyColors.primary,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 10),
        MyText(
          title: "Significant Labs:",
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        GenericTextField(
          hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
          fieldTypes: FieldTypes.clickable,
          fillColor: MyColors.textFields,
          hint: "Please choose from the list",
          controller: SurAddPatientData().significantLabsController,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.text,
          suffixIcon: Icon(
            Icons.arrow_drop_down,
            color: MyColors.primary,
          ),
          onTab: () {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              elevation: 20,
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height / 1.2,
                maxHeight: MediaQuery.of(context).size.height,
              ),
              enableDrag: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: BlocBuilder<GenericBloc<List<SignificantLabsModel>>, GenericState<List<SignificantLabsModel>>>(
                    bloc: SurAddPatientData().labsCubit,
                    builder: (context, state) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: MyText(
                              title: "Significant Labs",
                              size: 12,
                              color: MyColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              itemCount: state.data.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: state.data[index].isSelected,
                                          onChanged: (value) {
                                            state.data[index].isSelected = value!;
                                            SurAddPatientData().labsCubit.onUpdateData(state.data);
                                          },
                                        ),
                                        MyText(
                                          title: state.data[index].labName ?? '',
                                          size: 12,
                                        ),
                                      ],
                                    ),
                                    Visibility(
                                      visible: state.data[index].isSelected,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 20),
                                            child: MyText(
                                              title: "${state.data[index].labName} Lab Result:",
                                              size: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          GenericTextField(
                                            hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                                            fieldTypes: FieldTypes.normal,
                                            fillColor: MyColors.textFields,
                                            hint: "Lab Result",
                                            controller: state.data[index].resultController,
                                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                            action: TextInputAction.next,
                                            type: TextInputType.number,
                                            onTab: () {},
                                            validate: (value) => value!.validateEmpty(context),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: MyColors.greyWhite,
                                      thickness: 1,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          DefaultButton(
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                            title: "Save Results",
                            onTap: () {
                              if (state.data
                                  .any((element) => element.isSelected && element.resultController!.text.isEmpty)) {
                                CustomToast.showSimpleToast(
                                    msg:
                                        "Please fill the fields ${state.data.where((element) => element.isSelected && element.resultController!.text.isEmpty).map(
                                              (e) => e.labName,
                                            ).join(", ")}",
                                    color: Colors.red);
                                return;
                              }
                              SurAddPatientData()
                                  .selectedLabsCubit
                                  .onUpdateData(state.data.where((element) => element.isSelected == true).toList());
                              Navigator.pop(context);
                            },
                          )
                        ],
                      );
                    },
                  ),
                );
              },
            );
          },
          validate: (value) => value!.validateEmpty(context),
        ),
        BlocBuilder<GenericBloc<List<SignificantLabsModel>>, GenericState<List<SignificantLabsModel>>>(
          bloc: SurAddPatientData().selectedLabsCubit,
          builder: (context, state) {
            return Wrap(
              children: List.generate(
                  state.data.length,
                  (index) => Container(
                        decoration: BoxDecoration(
                            color: Color(0xffD3E0F6),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: MyColors.greyWhite)),
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                                child: MyText(
                                    title:
                                        "${state.data[index].labName} = ${state.data[index].resultController?.text ?? ''}",
                                    size: 12,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                //remove from selected
                                SurAddPatientData().selectedLabsCubit.onUpdateData(state.data..removeAt(index));
                              },
                              child: Icon(
                                Icons.close,
                                size: 20,
                                color: MyColors.primary,
                              ),
                            )
                          ],
                        ),
                      )),
            );
          },
        ),
        Divider(height: 20),
        // MyText(
        //   title: "Medications",
        //   size: 12,
        //   fontWeight: FontWeight.bold,
        //   color: MyColors.black,
        // ),
        // BlocBuilder<GenericBloc<String>, GenericState<String>>(
        //   bloc: SurAddPatientData().medicationInjectCubit,
        //   builder: (context, state) {
        //     return Wrap(
        //       direction: Axis.horizontal,
        //       children: List.generate(
        //         SurAddPatientData().medicationInject.length,
        //         (index) => Padding(
        //           padding: const EdgeInsets.only(right: 20),
        //           child: Row(
        //             mainAxisSize: MainAxisSize.max,
        //             children: [
        //               Radio(
        //                 value: SurAddPatientData().medicationInject[index],
        //                 groupValue: state.data,
        //                 onChanged: (value) => SurAddPatientData()
        //                     .medicationInjectCubit
        //                     .onUpdateData(value!),
        //               ),
        //               MyText(
        //                 title: SurAddPatientData().medicationInject[index],
        //                 size: 12,
        //                 color: MyColors.black,
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // ),
        // MyText(
        //   title: "Semaglutide Medication",
        //   size: 12,
        //   fontWeight: FontWeight.bold,
        //   color: MyColors.black,
        // ),
        // BlocBuilder<GenericBloc<String>, GenericState<String>>(
        //   bloc: SurAddPatientData().semaglutideMedicationCubit,
        //   builder: (context, state) {
        //     return Wrap(
        //       spacing: 10,
        //       direction: Axis.horizontal,
        //       children: List.generate(
        //         SurAddPatientData().semaglutideMedication.length,
        //         (index) => Padding(
        //           padding: const EdgeInsets.only(right: 50),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             mainAxisSize: MainAxisSize.min,
        //             children: [
        //               Radio(
        //                 value: SurAddPatientData().semaglutideMedication[index],
        //                 groupValue: state.data,
        //                 onChanged: (value) => SurAddPatientData()
        //                     .semaglutideMedicationCubit
        //                     .onUpdateData(value!),
        //               ),
        //               MyText(
        //                 title: SurAddPatientData().semaglutideMedication[index],
        //                 size: 12,
        //                 color: MyColors.black,
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // ),
        MyText(
          title: "Ultrasound:",
          size: 12,
          fontWeight: FontWeight.bold,
          color: MyColors.black,
        ),
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: SurAddPatientData().historyBallonSelectionCubit,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      MyText(
                        title: "US Findings:",
                        size: 12,
                        fontWeight: FontWeight.bold,
                        color: MyColors.black,
                      ),
                      BlocBuilder<GenericBloc<String>, GenericState<String>>(
                        bloc: SurAddPatientData().USFindingsCubit,
                        builder: (context, state) {
                          var medCubit = SurAddPatientData().USFindingsCubit;
                          final List<String> list = SurAddPatientData().USFindings;
                          return Wrap(
                            direction: Axis.horizontal,
                            children: List.generate(
                                list.length,
                                (index) => Container(
                                      width: MediaQuery.of(context).size.width / 3,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Checkbox(
                                              value: state.data.contains(list[index]),
                                              onChanged: (value) {
                                                if (value!) {
                                                  medCubit.onUpdateData(state.data + list[index]);
                                                  // log("selected value: ${state.data}");
                                                  // listt.add(list[index]);
                                                  // log("listt ${listt}");
                                                } else {
                                                  medCubit.onUpdateData(state.data.replaceAll(list[index], ""));
                                                  // listt.remove(list[index]);
                                                  // log("listt removed ${listt}");
                                                }
                                              }),
                                          MyText(
                                            title: list[index],
                                            size: 12,
                                            color: MyColors.black,
                                          ),
                                        ],
                                      ),
                                    )),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),

        MyText(
          title: "Other US Findings",
          size: 12,
          fontWeight: FontWeight.bold,
          color: MyColors.black,
        ),
        GenericTextField(
          hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
          fieldTypes: FieldTypes.normal,
          fillColor: MyColors.textFields,
          hint: "Please enter other us findings results",
          controller: SurAddPatientData().significantLabsController,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.text,
          validate: (value) => value!.validateEmpty(context),
        ),
        MyText(
          title: "Fluoroscopy Result",
          size: 12,
          fontWeight: FontWeight.bold,
          color: MyColors.black,
        ),
        GenericTextField(
          hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
          fieldTypes: FieldTypes.clickable,
          fillColor: MyColors.textFields,
          hint: "Enter or upload Fluoroscopy result",
          controller: SurAddPatientData().FluoroscopyController,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.text,
          onTab: () => SurAddPatientData().setFluoroscopyImage(),
          suffixIcon: Image.asset(
            Res.imagesEditIconff,
            scale: 3,
          ),
          validate: (value) => value!.validateEmpty(context),
        ),
        BlocBuilder<GenericBloc<File?>, GenericState<File?>>(
          bloc: SurAddPatientData().FluoroscopyImageCubit,
          builder: (context, state) {
            if (state.data != null) {
              return Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: Image.file(
                      state.data!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  InkWell(
                    onTap: () => SurAddPatientData().FluoroscopyImageCubit.onUpdateData(null),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        Icons.delete_forever,
                        size: 20,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        const SizedBox(height: 10),
        MyText(
          title: "Other notes",
          size: 12,
          fontWeight: FontWeight.bold,
          color: MyColors.black,
        ),
        GenericTextField(
          hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
          fieldTypes: FieldTypes.rich,
          fillColor: MyColors.textFields,
          hint: "Enter or upload Other notes",
          controller: SurAddPatientData().otherNotesController,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.text,
          max: 3,
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
                onTap: () => SurAddPatientData().previousPage(),
              ),
            ),
            Expanded(
              child: DefaultButton(
                title: "Next",
                onTap: () => SurAddPatientData().nextPage(),
              ),
            ),
          ],
        )
      ],
    );
  }
}
