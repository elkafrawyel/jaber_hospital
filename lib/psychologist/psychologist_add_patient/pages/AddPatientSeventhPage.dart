part of 'PagesWImports.dart';

class AddPatientSeventhPage extends StatelessWidget {
  AddPatientSeventhPage({Key? key}) : super(key: key);

  PsychologistAddPatientData psychologistAddPatientData = PsychologistAddPatientData();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            children: [
              MyText(
                title: "Preoperative Investigations:",
                size: 12,
                fontWeight: FontWeight.bold,
                color: MyColors.primary,
              ),
              const SizedBox(height: 10),
              MyText(
                title: "EGD",
                size: 12,
                fontWeight: FontWeight.bold,
                color: MyColors.black,
              ),
              BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                bloc: psychologistAddPatientData.EGDCubit,
                builder: (context, state) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: true,
                              groupValue: state.data,
                              onChanged: (value) => psychologistAddPatientData
                                  .EGDCubit
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
                              onChanged: (value) => psychologistAddPatientData
                                  .EGDCubit
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
                              title: "EGD Result",
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
                              fieldTypes: FieldTypes.clickable,
                              fillColor: MyColors.textFields,
                              hint: "EGD Result..",
                              controller:
                              psychologistAddPatientData.EGDResultController,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              action: TextInputAction.next,
                              type: TextInputType.text,
                              onTab: () => psychologistAddPatientData.setEGDResultImage(),
                              suffixIcon: Image.asset(
                                Res.imagesEditIconff,
                                scale: 3,
                              ),
                              validate: (value) =>
                                  value!.validateEmpty(context),
                            ),
                            BlocBuilder<GenericBloc<File?>,
                                GenericState<File?>>(
                              bloc: psychologistAddPatientData.EGDResultImageCubit,
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
                                        onTap: () => psychologistAddPatientData
                                            .EGDResultImageCubit
                                            .onUpdateData(null),
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
                            const Divider(),
                            MyText(
                              title: "Oesophagus:",
                              size: 12,
                              fontWeight: FontWeight.bold,
                              color: MyColors.primary,
                            ),
                            const SizedBox(height: 10),
                            MyText(
                              title: "Normal",
                              size: 12,
                              fontWeight: FontWeight.bold,
                              color: MyColors.black,
                            ),
                            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                              bloc: psychologistAddPatientData.NormalOesophagusCubit,
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    Radio(
                                        value: true,
                                        groupValue: state.data,
                                        onChanged: (value) =>
                                            psychologistAddPatientData
                                                .NormalOesophagusCubit
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
                                        onChanged: (value) =>
                                            psychologistAddPatientData
                                                .NormalOesophagusCubit
                                                .onUpdateData(value!)),
                                    MyText(
                                      title: "No",
                                      size: 12,
                                      color: MyColors.black,
                                    ),
                                  ],
                                );
                              },
                            ),
                            MyText(
                              title: "Oesophagitis",
                              size: 12,
                              fontWeight: FontWeight.bold,
                              color: MyColors.black,
                            ),
                            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                              bloc: psychologistAddPatientData.oesophagusCubit,
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    Radio(
                                        value: true,
                                        groupValue: state.data,
                                        onChanged: (value) =>
                                            psychologistAddPatientData
                                                .oesophagusCubit
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
                                        onChanged: (value) =>
                                            psychologistAddPatientData
                                                .oesophagusCubit
                                                .onUpdateData(value!)),
                                    MyText(
                                      title: "No",
                                      size: 12,
                                      color: MyColors.black,
                                    ),
                                  ],
                                );
                              },
                            ),
                            MyText(
                              title: "Oesophagitis Grade",
                              size: 12,
                              fontWeight: FontWeight.bold,
                              color: MyColors.black,
                            ),
                            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                              bloc: psychologistAddPatientData.oesophagusGradeCubit,
                              builder: (context, state) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                            value: true,
                                            groupValue: state.data,
                                            onChanged: (value) =>
                                                psychologistAddPatientData
                                                    .oesophagusGradeCubit
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
                                            onChanged: (value) =>
                                                psychologistAddPatientData
                                                    .oesophagusGradeCubit
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyText(
                                            title: "Oesophagitis Grade Type",
                                            size: 12,
                                            fontWeight: FontWeight.bold,
                                            color: MyColors.black,
                                          ),
                                          BlocBuilder<GenericBloc<String>,
                                              GenericState<String>>(
                                            bloc: psychologistAddPatientData
                                                .oesophagusGradeTypeCubit,
                                            builder: (context, state) {
                                              return Wrap(
                                                alignment:
                                                    WrapAlignment.spaceBetween,
                                                direction: Axis.horizontal,
                                                children: List.generate(
                                                  psychologistAddPatientData
                                                      .oesophagusGradeType
                                                      .length,
                                                  (index) => Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.6,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Radio(
                                                          value: psychologistAddPatientData
                                                                  .oesophagusGradeType[
                                                              index],
                                                          groupValue:
                                                              state.data,
                                                          onChanged: (value) =>
                                                              psychologistAddPatientData
                                                                  .oesophagusGradeTypeCubit
                                                                  .onUpdateData(
                                                                      value!),
                                                        ),
                                                        Expanded(
                                                          child: MyText(
                                                            title: psychologistAddPatientData
                                                                    .oesophagusGradeType[
                                                                index],
                                                            size: 12,
                                                            color:
                                                                MyColors.black,
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
                            MyText(
                              title: "Barret’s Oesophagus",
                              size: 12,
                              fontWeight: FontWeight.bold,
                              color: MyColors.black,
                            ),
                            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                              bloc: psychologistAddPatientData.BileCubit,
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    Radio(
                                        value: true,
                                        groupValue: state.data,
                                        onChanged: (value) =>
                                            psychologistAddPatientData
                                                .BileCubit
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
                                        onChanged: (value) =>
                                            psychologistAddPatientData
                                                .BileCubit
                                                .onUpdateData(value!)),
                                    MyText(
                                      title: "No",
                                      size: 12,
                                      color: MyColors.black,
                                    ),
                                  ],
                                );
                              },
                            ),
                            MyText(
                              title: "Other",
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
                              hint: "Other...",
                              controller:
                              psychologistAddPatientData.OtherOesophagusController,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              action: TextInputAction.next,
                              type: TextInputType.text,
                              validate: (value) =>
                                  value!.validateEmpty(context),
                            ),
                            const Divider(),
                            MyText(
                              title: "Stomach:",
                              size: 12,
                              fontWeight: FontWeight.bold,
                              color: MyColors.primary,
                            ),
                            const SizedBox(height: 10),
                            MyText(
                              title: "Hiatus Hernia",
                              size: 12,
                              fontWeight: FontWeight.bold,
                              color: MyColors.black,
                            ),
                            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                              bloc: psychologistAddPatientData.HiatusHerniaCubit,
                              builder: (context, state) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                            value: true,
                                            groupValue: state.data,
                                            onChanged: (value) =>
                                                psychologistAddPatientData
                                                    .HiatusHerniaCubit
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
                                            onChanged: (value) =>
                                                psychologistAddPatientData
                                                    .HiatusHerniaCubit
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyText(
                                            title: "Size",
                                            size: 12,
                                            fontWeight: FontWeight.bold,
                                            color: MyColors.black,
                                          ),
                                          BlocBuilder<GenericBloc<String>,
                                              GenericState<String>>(
                                            bloc: psychologistAddPatientData.SizeCubit,
                                            builder: (context, state) {
                                              return Wrap(
                                                alignment:
                                                    WrapAlignment.spaceBetween,
                                                direction: Axis.horizontal,
                                                children: List.generate(
                                                  psychologistAddPatientData
                                                      .SizeType
                                                      .length,
                                                  (index) => Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.6,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Radio(
                                                          value:
                                                          psychologistAddPatientData
                                                                      .SizeType[
                                                                  index],
                                                          groupValue:
                                                              state.data,
                                                          onChanged: (value) =>
                                                              psychologistAddPatientData
                                                                  .SizeCubit
                                                                  .onUpdateData(
                                                                      value!),
                                                        ),
                                                        Expanded(
                                                          child: MyText(
                                                            title:
                                                            psychologistAddPatientData
                                                                        .SizeType[
                                                                    index],
                                                            size: 12,
                                                            color:
                                                                MyColors.black,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );

                                              // return Wrap(
                                              //   spacing: 10,
                                              //   direction: Axis.horizontal,
                                              //   children: List.generate(
                                              //     psychologistAddPatientData
                                              //         .SizeType
                                              //         .length,
                                              //     (index) => Padding(
                                              //       padding:
                                              //           const EdgeInsets.only(
                                              //               right: 50),
                                              //       child: Row(
                                              //         mainAxisAlignment:
                                              //             MainAxisAlignment
                                              //                 .start,
                                              //         mainAxisSize:
                                              //             MainAxisSize.min,
                                              //         children: [
                                              //           Radio(
                                              //             value:
                                              //             psychologistAddPatientData
                                              //                         .SizeType[
                                              //                     index],
                                              //             groupValue:
                                              //                 state.data,
                                              //             onChanged: (value) =>
                                              //                 SurAddPatientData()
                                              //                     .SizeCubit
                                              //                     .onUpdateData(
                                              //                         value!),
                                              //           ),
                                              //           MyText(
                                              //             title:
                                              //                 SurAddPatientData()
                                              //                         .SizeType[
                                              //                     index],
                                              //             size: 12,
                                              //             color: MyColors.black,
                                              //           )
                                              //         ],
                                              //       ),
                                              //     ),
                                              //   ),
                                              // );
                                            },
                                          ),
                                          MyText(
                                            title: "Size (CM)",
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
                                            hint: "Size in cm",
                                            controller: psychologistAddPatientData
                                                .SizeController,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            action: TextInputAction.next,
                                            type: TextInputType.text,
                                            validate: (value) =>
                                                value!.validateEmpty(context),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            MyText(
                              title: "Gastritis",
                              size: 12,
                              fontWeight: FontWeight.bold,
                              color: MyColors.black,
                            ),
                            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                              bloc: psychologistAddPatientData.GastritisCubit,
                              builder: (context, state) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                            value: true,
                                            groupValue: state.data,
                                            onChanged: (value) =>
                                                psychologistAddPatientData
                                                    .GastritisCubit
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
                                            onChanged: (value) =>
                                                psychologistAddPatientData
                                                    .GastritisCubit
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyText(
                                            title: "Gastritis Type",
                                            size: 12,
                                            fontWeight: FontWeight.bold,
                                            color: MyColors.black,
                                          ),
                                          BlocBuilder<GenericBloc<String>,
                                              GenericState<String>>(
                                            bloc: psychologistAddPatientData
                                                .GastritisTypeCubit,
                                            builder: (context, state) {
                                              return Wrap(
                                                alignment:
                                                    WrapAlignment.spaceBetween,
                                                direction: Axis.horizontal,
                                                children: List.generate(
                                                  psychologistAddPatientData
                                                      .GastritisType
                                                      .length,
                                                  (index) => Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.6,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Radio(
                                                          value: psychologistAddPatientData
                                                                  .GastritisType[
                                                              index],
                                                          groupValue:
                                                              state.data,
                                                          onChanged: (value) =>
                                                              psychologistAddPatientData
                                                                  .GastritisTypeCubit
                                                                  .onUpdateData(
                                                                      value!),
                                                        ),
                                                        Expanded(
                                                          child: MyText(
                                                            title: psychologistAddPatientData
                                                                    .GastritisType[
                                                                index],
                                                            size: 12,
                                                            color:
                                                                MyColors.black,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                              // return Wrap(
                                              //   spacing: 10,
                                              //   direction: Axis.horizontal,
                                              //   children: List.generate(
                                              //     SurAddPatientData()
                                              //         .GastritisType
                                              //         .length,
                                              //     (index) => Row(
                                              //       mainAxisAlignment:
                                              //           MainAxisAlignment.start,
                                              //       mainAxisSize:
                                              //           MainAxisSize.min,
                                              //       children: [
                                              //         Radio(
                                              //           value: SurAddPatientData()
                                              //                   .GastritisType[
                                              //               index],
                                              //           groupValue: state.data,
                                              //           onChanged: (value) =>
                                              //               SurAddPatientData()
                                              //                   .GastritisTypeCubit
                                              //                   .onUpdateData(
                                              //                       value!),
                                              //         ),
                                              //         MyText(
                                              //           title: SurAddPatientData()
                                              //                   .GastritisType[
                                              //               index],
                                              //           size: 12,
                                              //           color: MyColors.black,
                                              //         )
                                              //       ],
                                              //     ),
                                              //   ),
                                              // );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),

                            MyText(
                              title: "Gastric ulcer",
                              size: 12,
                              fontWeight: FontWeight.bold,
                              color: MyColors.black,
                            ),
                            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                              bloc: psychologistAddPatientData.gastricUlcerCubit,
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    Radio(
                                        value: true,
                                        groupValue: state.data,
                                        onChanged: (value) =>
                                            psychologistAddPatientData
                                                .gastricUlcerCubit
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
                                        onChanged: (value) =>
                                            psychologistAddPatientData
                                                .gastricUlcerCubit
                                                .onUpdateData(value!)),
                                    MyText(
                                      title: "No",
                                      size: 12,
                                      color: MyColors.black,
                                    ),
                                  ],
                                );
                              },
                            ),
                            MyText(
                              title: "H.Pylori",
                              size: 12,
                              fontWeight: FontWeight.bold,
                              color: MyColors.black,
                            ),
                            BlocBuilder<GenericBloc<String>,
                                GenericState<String>>(
                              bloc: psychologistAddPatientData.HPyloriCubit,
                              builder: (context, state) {
                                return Wrap(
                                  spacing: 10,
                                  direction: Axis.horizontal,
                                  children: List.generate(
                                    psychologistAddPatientData.HPyloriType.length,
                                    (index) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Radio(
                                          value: psychologistAddPatientData
                                              .HPyloriType[index],
                                          groupValue: state.data,
                                          onChanged: (value) =>
                                              psychologistAddPatientData
                                                  .HPyloriCubit
                                                  .onUpdateData(value!),
                                        ),
                                        MyText(
                                          title: psychologistAddPatientData
                                              .HPyloriType[index],
                                          size: 12,
                                          color: MyColors.black,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            MyText(
                              title: "Polyps",
                              size: 12,
                              fontWeight: FontWeight.bold,
                              color: MyColors.black,
                            ),
                            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                              bloc: psychologistAddPatientData.PolypsCubit,
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    Radio(
                                        value: true,
                                        groupValue: state.data,
                                        onChanged: (value) =>
                                            psychologistAddPatientData
                                                .PolypsCubit
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
                                        onChanged: (value) =>
                                            psychologistAddPatientData
                                                .PolypsCubit
                                                .onUpdateData(value!)),
                                    MyText(
                                      title: "No",
                                      size: 12,
                                      color: MyColors.black,
                                    ),
                                  ],
                                );
                              },
                            ),
                            GenericTextField(
                              hintColor: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.color
                                  ?.withOpacity(.8),
                              fieldTypes: FieldTypes.normal,
                              fillColor: MyColors.textFields,
                              hint: "Other...",
                              controller:
                              psychologistAddPatientData.OtherStomachController,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              action: TextInputAction.next,
                              type: TextInputType.text,
                              validate: (value) =>
                                  value!.validateEmpty(context),
                            ),
                            MyText(
                              title: "Previous Surgery",
                              size: 12,
                              fontWeight: FontWeight.bold,
                              color: MyColors.black,
                            ),
                            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                              bloc: psychologistAddPatientData.PostSurgeryCubit,
                              builder: (context, state) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                            value: true,
                                            groupValue: state.data,
                                            onChanged: (value) =>
                                                psychologistAddPatientData
                                                    .PostSurgeryCubit
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
                                            onChanged: (value) =>
                                                psychologistAddPatientData
                                                    .PostSurgeryCubit
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyText(
                                            title: "Previous Surgery Type",
                                            size: 12,
                                            fontWeight: FontWeight.bold,
                                            color: MyColors.black,
                                          ),
                                          BlocBuilder<GenericBloc<String>,
                                              GenericState<String>>(
                                            bloc: psychologistAddPatientData
                                                .PostSurgeryTypeCubit,
                                            builder: (context, state) {
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Wrap(
                                                    alignment: WrapAlignment
                                                        .spaceBetween,
                                                    direction: Axis.horizontal,
                                                    children: List.generate(
                                                      psychologistAddPatientData
                                                          .PreviousSurgeryType
                                                          .length,
                                                      (index) => Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2.6,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Radio(
                                                              value: psychologistAddPatientData
                                                                      .PreviousSurgeryType[
                                                                  index],
                                                              groupValue:
                                                                  state.data,
                                                              onChanged: (value) =>
                                                                  psychologistAddPatientData
                                                                      .PostSurgeryTypeCubit
                                                                      .onUpdateData(
                                                                          value!),
                                                            ),
                                                            Expanded(
                                                              child: MyText(
                                                                title: psychologistAddPatientData
                                                                        .PreviousSurgeryType[
                                                                    index],
                                                                size: 12,
                                                                color: MyColors
                                                                    .black,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Offstage(
                                                    offstage:
                                                        state.data != "LSG",
                                                    child: BlocBuilder<
                                                        GenericBloc<String>,
                                                        GenericState<String>>(
                                                      bloc: psychologistAddPatientData
                                                          .PreviousLSGStatusCubit,
                                                      builder:
                                                          (context, state) {
                                                        return Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            MyText(
                                                              title:
                                                                  "Previous LSG Status",
                                                              size: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: MyColors
                                                                  .black,
                                                            ),
                                                            Wrap(
                                                              alignment:
                                                                  WrapAlignment
                                                                      .spaceBetween,
                                                              direction: Axis
                                                                  .horizontal,
                                                              children:
                                                                  List.generate(
                                                                    psychologistAddPatientData
                                                                    .PostLSGStatusType
                                                                    .length,
                                                                (index) =>
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      2.6,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Radio(
                                                                        value: psychologistAddPatientData
                                                                            .PostLSGStatusType[index],
                                                                        groupValue:
                                                                            state.data,
                                                                        onChanged: (value) => psychologistAddPatientData
                                                                            .PreviousLSGStatusCubit
                                                                            .onUpdateData(value!),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            MyText(
                                                                          title:
                                                                          psychologistAddPatientData.PostLSGStatusType[index],
                                                                          size:
                                                                              12,
                                                                          color:
                                                                              MyColors.black,
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Offstage(
                                                    offstage: state.data ==
                                                            "LSG" ||
                                                        state.data == "LAGB",
                                                    child: BlocBuilder<
                                                        GenericBloc<String>,
                                                        GenericState<String>>(
                                                      bloc: psychologistAddPatientData
                                                          .HPyloriCubit,
                                                      builder:
                                                          (context, state) {
                                                        return Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            MyText(
                                                              title:
                                                                  "Pouch Dilatation",
                                                              size: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: MyColors
                                                                  .black,
                                                            ),
                                                            BlocBuilder<
                                                                GenericBloc<
                                                                    bool>,
                                                                GenericState<
                                                                    bool>>(
                                                              bloc: psychologistAddPatientData
                                                                  .PouchDilatationCubit,
                                                              builder: (context,
                                                                  state) {
                                                                return Row(
                                                                  children: [
                                                                    Radio(
                                                                        value:
                                                                            true,
                                                                        groupValue:
                                                                            state
                                                                                .data,
                                                                        onChanged: (value) => psychologistAddPatientData
                                                                            .PouchDilatationCubit
                                                                            .onUpdateData(value!)),
                                                                    MyText(
                                                                      title:
                                                                          "Yes",
                                                                      size: 12,
                                                                      color: MyColors
                                                                          .black,
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            40),
                                                                    Radio(
                                                                        value:
                                                                            false,
                                                                        groupValue:
                                                                            state
                                                                                .data,
                                                                        onChanged: (value) => psychologistAddPatientData
                                                                            .PouchDilatationCubit
                                                                            .onUpdateData(value!)),
                                                                    MyText(
                                                                      title:
                                                                          "No",
                                                                      size: 12,
                                                                      color: MyColors
                                                                          .black,
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                            MyText(
                                                              title:
                                                                  "Anastomotic Size",
                                                              size: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: MyColors
                                                                  .black,
                                                            ),
                                                            BlocBuilder<
                                                                GenericBloc<
                                                                    bool>,
                                                                GenericState<
                                                                    bool>>(
                                                              bloc: psychologistAddPatientData
                                                                  .AnastomoticSizeCubit,
                                                              builder: (context,
                                                                  state) {
                                                                return Row(
                                                                  children: [
                                                                    Radio(
                                                                        value:
                                                                            true,
                                                                        groupValue:
                                                                            state
                                                                                .data,
                                                                        onChanged: (value) => psychologistAddPatientData
                                                                            .AnastomoticSizeCubit
                                                                            .onUpdateData(value!)),
                                                                    MyText(
                                                                      title:
                                                                          "Yes",
                                                                      size: 12,
                                                                      color: MyColors
                                                                          .black,
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            40),
                                                                    Radio(
                                                                        value:
                                                                            false,
                                                                        groupValue:
                                                                            state
                                                                                .data,
                                                                        onChanged: (value) => psychologistAddPatientData
                                                                            .AnastomoticSizeCubit
                                                                            .onUpdateData(value!)),
                                                                    MyText(
                                                                      title:
                                                                          "No",
                                                                      size: 12,
                                                                      color: MyColors
                                                                          .black,
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                            MyText(
                                                              title:
                                                                  "Anastomotic size",
                                                              size: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: MyColors
                                                                  .black,
                                                            ),
                                                            GenericTextField(
                                                              hintColor: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .subtitle1
                                                                  ?.color
                                                                  ?.withOpacity(
                                                                      .8),
                                                              fieldTypes:
                                                                  FieldTypes
                                                                      .normal,
                                                              fillColor: MyColors
                                                                  .textFields,
                                                              hint:
                                                                  "Anastomotic size",
                                                              controller:
                                                              psychologistAddPatientData
                                                                      .AnastomoticSizeController,
                                                              margin: const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 10),
                                                              action:
                                                                  TextInputAction
                                                                      .next,
                                                              type:
                                                                  TextInputType
                                                                      .text,
                                                              validate: (value) =>
                                                                  value!.validateEmpty(
                                                                      context),
                                                            ),
                                                            MyText(
                                                              title: "Ulcer",
                                                              size: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: MyColors
                                                                  .black,
                                                            ),
                                                            BlocBuilder<
                                                                GenericBloc<
                                                                    bool>,
                                                                GenericState<
                                                                    bool>>(
                                                              bloc: psychologistAddPatientData
                                                                  .UlcerCubit,
                                                              builder: (context,
                                                                  state) {
                                                                return Row(
                                                                  children: [
                                                                    Radio(
                                                                        value:
                                                                            true,
                                                                        groupValue:
                                                                            state
                                                                                .data,
                                                                        onChanged: (value) => psychologistAddPatientData
                                                                            .UlcerCubit
                                                                            .onUpdateData(value!)),
                                                                    MyText(
                                                                      title:
                                                                          "Yes",
                                                                      size: 12,
                                                                      color: MyColors
                                                                          .black,
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            40),
                                                                    Radio(
                                                                        value:
                                                                            false,
                                                                        groupValue:
                                                                            state
                                                                                .data,
                                                                        onChanged: (value) => psychologistAddPatientData
                                                                            .UlcerCubit
                                                                            .onUpdateData(value!)),
                                                                    MyText(
                                                                      title:
                                                                          "No",
                                                                      size: 12,
                                                                      color: MyColors
                                                                          .black,
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                            MyText(
                                                              title:
                                                                  "Stricture",
                                                              size: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: MyColors
                                                                  .black,
                                                            ),
                                                            BlocBuilder<
                                                                GenericBloc<
                                                                    bool>,
                                                                GenericState<
                                                                    bool>>(
                                                              bloc: psychologistAddPatientData
                                                                  .StrictureCubit,
                                                              builder: (context,
                                                                  state) {
                                                                return Row(
                                                                  children: [
                                                                    Radio(
                                                                        value:
                                                                            true,
                                                                        groupValue:
                                                                            state
                                                                                .data,
                                                                        onChanged: (value) => psychologistAddPatientData
                                                                            .StrictureCubit
                                                                            .onUpdateData(value!)),
                                                                    MyText(
                                                                      title:
                                                                          "Yes",
                                                                      size: 12,
                                                                      color: MyColors
                                                                          .black,
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            40),
                                                                    Radio(
                                                                        value:
                                                                            false,
                                                                        groupValue:
                                                                            state
                                                                                .data,
                                                                        onChanged: (value) => psychologistAddPatientData
                                                                            .StrictureCubit
                                                                            .onUpdateData(value!)),
                                                                    MyText(
                                                                      title:
                                                                          "No",
                                                                      size: 12,
                                                                      color: MyColors
                                                                          .black,
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                            MyText(
                                                              title: "Bile",
                                                              size: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: MyColors
                                                                  .black,
                                                            ),
                                                            BlocBuilder<
                                                                GenericBloc<
                                                                    bool>,
                                                                GenericState<
                                                                    bool>>(
                                                              bloc:
                                                              psychologistAddPatientData
                                                                      .BileCubit,
                                                              builder: (context,
                                                                  state) {
                                                                return Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Radio(
                                                                            value:
                                                                                true,
                                                                            groupValue:
                                                                                state.data,
                                                                            onChanged: (value) => psychologistAddPatientData.BileCubit.onUpdateData(value!)),
                                                                        MyText(
                                                                          title:
                                                                              "Yes",
                                                                          size:
                                                                              12,
                                                                          color:
                                                                              MyColors.black,
                                                                        ),
                                                                        const SizedBox(
                                                                            width:
                                                                                40),
                                                                        Radio(
                                                                            value:
                                                                                false,
                                                                            groupValue:
                                                                                state.data,
                                                                            onChanged: (value) => psychologistAddPatientData.BileCubit.onUpdateData(value!)),
                                                                        MyText(
                                                                          title:
                                                                              "No",
                                                                          size:
                                                                              12,
                                                                          color:
                                                                              MyColors.black,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Offstage(
                                                                      offstage:
                                                                          !state
                                                                              .data,
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          MyText(
                                                                            title:
                                                                                "Twist",
                                                                            size:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color:
                                                                                MyColors.black,
                                                                          ),
                                                                          BlocBuilder<
                                                                              GenericBloc<bool>,
                                                                              GenericState<bool>>(
                                                                            bloc:
                                                                            psychologistAddPatientData.TwistCubit,
                                                                            builder:
                                                                                (context, state) {
                                                                              return Row(
                                                                                children: [
                                                                                  Radio(value: true, groupValue: state.data, onChanged: (value) => psychologistAddPatientData.TwistCubit.onUpdateData(value!)),
                                                                                  MyText(
                                                                                    title: "Yes",
                                                                                    size: 12,
                                                                                    color: MyColors.black,
                                                                                  ),
                                                                                  const SizedBox(width: 40),
                                                                                  Radio(value: false, groupValue: state.data, onChanged: (value) => psychologistAddPatientData.TwistCubit.onUpdateData(value!)),
                                                                                  MyText(
                                                                                    title: "No",
                                                                                    size: 12,
                                                                                    color: MyColors.black,
                                                                                  ),
                                                                                ],
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
                                                          ],
                                                        );
                                                      },
                                                    ),
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

                            ///Duodenum
                            const Divider(),
                            MyText(
                              title: "Duodenum",
                              size: 12,
                              fontWeight: FontWeight.bold,
                              color: MyColors.primary,
                            ),
                            const SizedBox(height: 10),
                            MyText(
                              title: "Normal",
                              size: 12,
                              fontWeight: FontWeight.bold,
                              color: MyColors.black,
                            ),
                            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                              bloc: psychologistAddPatientData.NormalDuodenum,
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    Radio(
                                        value: true,
                                        groupValue: state.data,
                                        onChanged: (value) =>
                                            psychologistAddPatientData
                                                .NormalDuodenum
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
                                        onChanged: (value) =>
                                            psychologistAddPatientData
                                                .NormalDuodenum
                                                .onUpdateData(value!)),
                                    MyText(
                                      title: "No",
                                      size: 12,
                                      color: MyColors.black,
                                    ),
                                  ],
                                );
                              },
                            ),
                            MyText(
                              title: "Duodenal Ulcer",
                              size: 12,
                              fontWeight: FontWeight.bold,
                              color: MyColors.black,
                            ),
                            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                              bloc: psychologistAddPatientData.DuodenalUlcer,
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    Radio(
                                        value: true,
                                        groupValue: state.data,
                                        onChanged: (value) =>
                                            psychologistAddPatientData
                                                .DuodenalUlcer
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
                                        onChanged: (value) =>
                                            psychologistAddPatientData
                                                .DuodenalUlcer
                                                .onUpdateData(value!)),
                                    MyText(
                                      title: "No",
                                      size: 12,
                                      color: MyColors.black,
                                    ),
                                  ],
                                );
                              },
                            ),
                            MyText(
                              title: "Other",
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
                              hint: "Other...",
                              controller:
                              psychologistAddPatientData.OtherDuodenumController,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              action: TextInputAction.next,
                              type: TextInputType.text,
                              validate: (value) =>
                                  value!.validateEmpty(context),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: DefaultButton(
                title: "Previous",
                borderColor: MyColors.primary,
                color: MyColors.white,
                textColor: MyColors.primary,
                onTap: () => psychologistAddPatientData.previousPage(),
              ),
            ),
            Expanded(
              child: DefaultButton(
                title: "Add Patient",
                onTap: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}
