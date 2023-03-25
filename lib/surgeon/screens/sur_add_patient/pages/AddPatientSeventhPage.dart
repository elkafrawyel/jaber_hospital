part of 'PagesWImports.dart';

class AddPatientSeventhPage extends StatelessWidget {
  const AddPatientSeventhPage({Key? key}) : super(key: key);

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
                bloc: SurAddPatientData().EGDCubit,
                builder: (context, state) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: true,
                              groupValue: state.data,
                              onChanged: (value) => SurAddPatientData().EGDCubit.onUpdateData(value!)),
                          MyText(
                            title: "Yes",
                            size: 12,
                            color: MyColors.black,
                          ),
                          const SizedBox(width: 40),
                          Radio(
                              value: false,
                              groupValue: state.data,
                              onChanged: (value) => SurAddPatientData().EGDCubit.onUpdateData(value!)),
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
                              hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                              fieldTypes: FieldTypes.clickable,
                              fillColor: MyColors.textFields,
                              hint: "EGD Result..",
                              controller: SurAddPatientData().EGDResultController,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              action: TextInputAction.next,
                              type: TextInputType.text,
                              onTab: () => SurAddPatientData().setEGDResultImage(),
                              suffixIcon: Image.asset(
                                Res.imagesEditIconff,
                                scale: 3,
                              ),
                              validate: (value) => value!.validateEmpty(context),
                            ),
                            BlocBuilder<GenericBloc<File?>, GenericState<File?>>(
                              bloc: SurAddPatientData().EGDResultImageCubit,
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
                                        onTap: () => SurAddPatientData().EGDResultImageCubit.onUpdateData(null),
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
                              bloc: SurAddPatientData().NormalOesophagusCubit,
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    Radio(
                                        value: true,
                                        groupValue: state.data,
                                        onChanged: (value) =>
                                            SurAddPatientData().NormalOesophagusCubit.onUpdateData(value!)),
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
                                            SurAddPatientData().NormalOesophagusCubit.onUpdateData(value!)),
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
                              bloc: SurAddPatientData().oesophagusCubit,
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    Radio(
                                        value: true,
                                        groupValue: state.data,
                                        onChanged: (value) => SurAddPatientData().oesophagusCubit.onUpdateData(value!)),
                                    MyText(
                                      title: "Yes",
                                      size: 12,
                                      color: MyColors.black,
                                    ),
                                    const SizedBox(width: 40),
                                    Radio(
                                        value: false,
                                        groupValue: state.data,
                                        onChanged: (value) => SurAddPatientData().oesophagusCubit.onUpdateData(value!)),
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
                              bloc: SurAddPatientData().oesophagusGradeCubit,
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
                                                SurAddPatientData().oesophagusGradeCubit.onUpdateData(value!)),
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
                                                SurAddPatientData().oesophagusGradeCubit.onUpdateData(value!)),
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
                                            title: "Oesophagitis Grade Type",
                                            size: 12,
                                            fontWeight: FontWeight.bold,
                                            color: MyColors.black,
                                          ),
                                          BlocBuilder<GenericBloc<String>, GenericState<String>>(
                                            bloc: SurAddPatientData().oesophagusGradeTypeCubit,
                                            builder: (context, state) {
                                              return Wrap(
                                                alignment: WrapAlignment.spaceBetween,
                                                direction: Axis.horizontal,
                                                children: List.generate(
                                                  SurAddPatientData().oesophagusGradeType.length,
                                                  (index) => Container(
                                                    width: MediaQuery.of(context).size.width / 2.6,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Radio(
                                                          value: SurAddPatientData().oesophagusGradeType[index],
                                                          groupValue: state.data,
                                                          onChanged: (value) => SurAddPatientData()
                                                              .oesophagusGradeTypeCubit
                                                              .onUpdateData(value!),
                                                        ),
                                                        Expanded(
                                                          child: MyText(
                                                            title: SurAddPatientData().oesophagusGradeType[index],
                                                            size: 12,
                                                            color: MyColors.black,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );

                                              return Wrap(
                                                spacing: 10,
                                                direction: Axis.horizontal,
                                                children: List.generate(
                                                  SurAddPatientData().oesophagusGradeType.length,
                                                  (index) => Padding(
                                                    padding: const EdgeInsets.only(right: 50),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Radio(
                                                          value: SurAddPatientData().oesophagusGradeType[index],
                                                          groupValue: state.data,
                                                          onChanged: (value) => SurAddPatientData()
                                                              .oesophagusGradeTypeCubit
                                                              .onUpdateData(value!),
                                                        ),
                                                        MyText(
                                                          title: SurAddPatientData().oesophagusGradeType[index],
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
                            MyText(
                              title: "Barret’s Oesophagus",
                              size: 12,
                              fontWeight: FontWeight.bold,
                              color: MyColors.black,
                            ),
                            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                              bloc: SurAddPatientData().BileCubit,
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    Radio(
                                        value: true,
                                        groupValue: state.data,
                                        onChanged: (value) => SurAddPatientData().BileCubit.onUpdateData(value!)),
                                    MyText(
                                      title: "Yes",
                                      size: 12,
                                      color: MyColors.black,
                                    ),
                                    const SizedBox(width: 40),
                                    Radio(
                                        value: false,
                                        groupValue: state.data,
                                        onChanged: (value) => SurAddPatientData().BileCubit.onUpdateData(value!)),
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
                              hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                              fieldTypes: FieldTypes.normal,
                              fillColor: MyColors.textFields,
                              hint: "Other...",
                              controller: SurAddPatientData().OtherOesophagusController,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              action: TextInputAction.next,
                              type: TextInputType.text,
                              validate: (value) => value!.validateEmpty(context),
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
                              bloc: SurAddPatientData().HiatusHerniaCubit,
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
                                                SurAddPatientData().HiatusHerniaCubit.onUpdateData(value!)),
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
                                                SurAddPatientData().HiatusHerniaCubit.onUpdateData(value!)),
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
                                            title: "Size",
                                            size: 12,
                                            fontWeight: FontWeight.bold,
                                            color: MyColors.black,
                                          ),
                                          BlocBuilder<GenericBloc<String>, GenericState<String>>(
                                            bloc: SurAddPatientData().SizeCubit,
                                            builder: (context, state) {
                                              return Wrap(
                                                alignment: WrapAlignment.spaceBetween,
                                                direction: Axis.horizontal,
                                                children: List.generate(
                                                  SurAddPatientData().SizeType.length,
                                                  (index) => Container(
                                                    width: MediaQuery.of(context).size.width / 2.6,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Radio(
                                                          value: SurAddPatientData().SizeType[index],
                                                          groupValue: state.data,
                                                          onChanged: (value) =>
                                                              SurAddPatientData().SizeCubit.onUpdateData(value!),
                                                        ),
                                                        Expanded(
                                                          child: MyText(
                                                            title: SurAddPatientData().SizeType[index],
                                                            size: 12,
                                                            color: MyColors.black,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );

                                              return Wrap(
                                                spacing: 10,
                                                direction: Axis.horizontal,
                                                children: List.generate(
                                                  SurAddPatientData().SizeType.length,
                                                  (index) => Padding(
                                                    padding: const EdgeInsets.only(right: 50),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Radio(
                                                          value: SurAddPatientData().SizeType[index],
                                                          groupValue: state.data,
                                                          onChanged: (value) =>
                                                              SurAddPatientData().SizeCubit.onUpdateData(value!),
                                                        ),
                                                        MyText(
                                                          title: SurAddPatientData().SizeType[index],
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
                                          MyText(
                                            title: "Size (CM)",
                                            size: 12,
                                            fontWeight: FontWeight.bold,
                                            color: MyColors.black,
                                          ),
                                          GenericTextField(
                                            hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                                            fieldTypes: FieldTypes.normal,
                                            fillColor: MyColors.textFields,
                                            hint: "Size in cm",
                                            controller: SurAddPatientData().SizeController,
                                            margin: const EdgeInsets.symmetric(vertical: 10),
                                            action: TextInputAction.next,
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
                            MyText(
                              title: "Gastritis",
                              size: 12,
                              fontWeight: FontWeight.bold,
                              color: MyColors.black,
                            ),
                            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                              bloc: SurAddPatientData().GastritisCubit,
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
                                                SurAddPatientData().GastritisCubit.onUpdateData(value!)),
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
                                                SurAddPatientData().GastritisCubit.onUpdateData(value!)),
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
                                            title: "Gastritis Type",
                                            size: 12,
                                            fontWeight: FontWeight.bold,
                                            color: MyColors.black,
                                          ),
                                          BlocBuilder<GenericBloc<String>, GenericState<String>>(
                                            bloc: SurAddPatientData().GastritisTypeCubit,
                                            builder: (context, state) {
                                              return Wrap(
                                                alignment: WrapAlignment.spaceBetween,
                                                direction: Axis.horizontal,
                                                children: List.generate(
                                                  SurAddPatientData().GastritisType.length,
                                                  (index) => Container(
                                                    width: MediaQuery.of(context).size.width / 2.6,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Radio(
                                                          value: SurAddPatientData().GastritisType[index],
                                                          groupValue: state.data,
                                                          onChanged: (value) => SurAddPatientData()
                                                              .GastritisTypeCubit
                                                              .onUpdateData(value!),
                                                        ),
                                                        Expanded(
                                                          child: MyText(
                                                            title: SurAddPatientData().GastritisType[index],
                                                            size: 12,
                                                            color: MyColors.black,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                              return Wrap(
                                                spacing: 10,
                                                direction: Axis.horizontal,
                                                children: List.generate(
                                                  SurAddPatientData().GastritisType.length,
                                                  (index) => Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Radio(
                                                        value: SurAddPatientData().GastritisType[index],
                                                        groupValue: state.data,
                                                        onChanged: (value) =>
                                                            SurAddPatientData().GastritisTypeCubit.onUpdateData(value!),
                                                      ),
                                                      MyText(
                                                        title: SurAddPatientData().GastritisType[index],
                                                        size: 12,
                                                        color: MyColors.black,
                                                      )
                                                    ],
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
                              title: "Gastric ulcer",
                              size: 12,
                              fontWeight: FontWeight.bold,
                              color: MyColors.black,
                            ),
                            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                              bloc: SurAddPatientData().gastricUlcerCubit,
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    Radio(
                                        value: true,
                                        groupValue: state.data,
                                        onChanged: (value) =>
                                            SurAddPatientData().gastricUlcerCubit.onUpdateData(value!)),
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
                                            SurAddPatientData().gastricUlcerCubit.onUpdateData(value!)),
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
                            BlocBuilder<GenericBloc<String>, GenericState<String>>(
                              bloc: SurAddPatientData().HPyloriCubit,
                              builder: (context, state) {
                                return Wrap(
                                  spacing: 10,
                                  direction: Axis.horizontal,
                                  children: List.generate(
                                    SurAddPatientData().HPyloriType.length,
                                    (index) => Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Radio(
                                          value: SurAddPatientData().HPyloriType[index],
                                          groupValue: state.data,
                                          onChanged: (value) => SurAddPatientData().HPyloriCubit.onUpdateData(value!),
                                        ),
                                        MyText(
                                          title: SurAddPatientData().HPyloriType[index],
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
                              bloc: SurAddPatientData().PolypsCubit,
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    Radio(
                                        value: true,
                                        groupValue: state.data,
                                        onChanged: (value) => SurAddPatientData().PolypsCubit.onUpdateData(value!)),
                                    MyText(
                                      title: "Yes",
                                      size: 12,
                                      color: MyColors.black,
                                    ),
                                    const SizedBox(width: 40),
                                    Radio(
                                        value: false,
                                        groupValue: state.data,
                                        onChanged: (value) => SurAddPatientData().PolypsCubit.onUpdateData(value!)),
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
                              hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                              fieldTypes: FieldTypes.normal,
                              fillColor: MyColors.textFields,
                              hint: "Other...",
                              controller: SurAddPatientData().OtherStomachController,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              action: TextInputAction.next,
                              type: TextInputType.text,
                              validate: (value) => value!.validateEmpty(context),
                            ),
                            MyText(
                              title: "Previous Surgery",
                              size: 12,
                              fontWeight: FontWeight.bold,
                              color: MyColors.black,
                            ),
                            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                              bloc: SurAddPatientData().PostSurgeryCubit,
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
                                                SurAddPatientData().PostSurgeryCubit.onUpdateData(value!)),
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
                                                SurAddPatientData().PostSurgeryCubit.onUpdateData(value!)),
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
                                            title: "Previous Surgery Type",
                                            size: 12,
                                            fontWeight: FontWeight.bold,
                                            color: MyColors.black,
                                          ),
                                          BlocBuilder<GenericBloc<String>, GenericState<String>>(
                                            bloc: SurAddPatientData().PostSurgeryTypeCubit,
                                            builder: (context, state) {
                                              return Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Wrap(
                                                    alignment: WrapAlignment.spaceBetween,
                                                    direction: Axis.horizontal,
                                                    children: List.generate(
                                                      SurAddPatientData().PreviousSurgeryType.length,
                                                      (index) => Container(
                                                        width: MediaQuery.of(context).size.width / 2.6,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            Radio(
                                                              value: SurAddPatientData().PreviousSurgeryType[index],
                                                              groupValue: state.data,
                                                              onChanged: (value) => SurAddPatientData()
                                                                  .PostSurgeryTypeCubit
                                                                  .onUpdateData(value!),
                                                            ),
                                                            Expanded(
                                                              child: MyText(
                                                                title: SurAddPatientData().PreviousSurgeryType[index],
                                                                size: 12,
                                                                color: MyColors.black,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Offstage(
                                                    offstage: state.data != "LSG",
                                                    child: BlocBuilder<GenericBloc<String>, GenericState<String>>(
                                                      bloc: SurAddPatientData().PreviousLSGStatusCubit,
                                                      builder: (context, state) {
                                                        return Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            MyText(
                                                              title: "Previous LSG Status",
                                                              size: 12,
                                                              fontWeight: FontWeight.bold,
                                                              color: MyColors.black,
                                                            ),
                                                            Wrap(
                                                              alignment: WrapAlignment.spaceBetween,
                                                              direction: Axis.horizontal,
                                                              children: List.generate(
                                                                SurAddPatientData().PostLSGStatusType.length,
                                                                (index) => Container(
                                                                  width: MediaQuery.of(context).size.width / 2.6,
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    children: [
                                                                      Radio(
                                                                        value: SurAddPatientData()
                                                                            .PostLSGStatusType[index],
                                                                        groupValue: state.data,
                                                                        onChanged: (value) => SurAddPatientData()
                                                                            .PreviousLSGStatusCubit
                                                                            .onUpdateData(value!),
                                                                      ),
                                                                      Expanded(
                                                                        child: MyText(
                                                                          title: SurAddPatientData()
                                                                              .PostLSGStatusType[index],
                                                                          size: 12,
                                                                          color: MyColors.black,
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
                                                    offstage: state.data == "LSG" || state.data == "LAGB",
                                                    child: BlocBuilder<GenericBloc<String>, GenericState<String>>(
                                                      bloc: SurAddPatientData().HPyloriCubit,
                                                      builder: (context, state) {
                                                        return Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            MyText(
                                                              title: "Pouch Dilatation",
                                                              size: 12,
                                                              fontWeight: FontWeight.bold,
                                                              color: MyColors.black,
                                                            ),
                                                            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                                                              bloc: SurAddPatientData().PouchDilatationCubit,
                                                              builder: (context, state) {
                                                                return Row(
                                                                  children: [
                                                                    Radio(
                                                                        value: true,
                                                                        groupValue: state.data,
                                                                        onChanged: (value) => SurAddPatientData()
                                                                            .PouchDilatationCubit
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
                                                                            .PouchDilatationCubit
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
                                                              title: "Anastomotic Size",
                                                              size: 12,
                                                              fontWeight: FontWeight.bold,
                                                              color: MyColors.black,
                                                            ),
                                                            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                                                              bloc: SurAddPatientData().AnastomoticSizeCubit,
                                                              builder: (context, state) {
                                                                return Row(
                                                                  children: [
                                                                    Radio(
                                                                        value: true,
                                                                        groupValue: state.data,
                                                                        onChanged: (value) => SurAddPatientData()
                                                                            .AnastomoticSizeCubit
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
                                                                            .AnastomoticSizeCubit
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
                                                              title: "Anastomotic size",
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
                                                              hint: "Anastomotic size",
                                                              controller: SurAddPatientData().AnastomoticSizeController,
                                                              margin: const EdgeInsets.symmetric(vertical: 10),
                                                              action: TextInputAction.next,
                                                              type: TextInputType.text,
                                                              validate: (value) => value!.validateEmpty(context),
                                                            ),
                                                            MyText(
                                                              title: "Ulcer",
                                                              size: 12,
                                                              fontWeight: FontWeight.bold,
                                                              color: MyColors.black,
                                                            ),
                                                            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                                                              bloc: SurAddPatientData().UlcerCubit,
                                                              builder: (context, state) {
                                                                return Row(
                                                                  children: [
                                                                    Radio(
                                                                        value: true,
                                                                        groupValue: state.data,
                                                                        onChanged: (value) => SurAddPatientData()
                                                                            .UlcerCubit
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
                                                                            .UlcerCubit
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
                                                              title: "Stricture",
                                                              size: 12,
                                                              fontWeight: FontWeight.bold,
                                                              color: MyColors.black,
                                                            ),
                                                            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                                                              bloc: SurAddPatientData().StrictureCubit,
                                                              builder: (context, state) {
                                                                return Row(
                                                                  children: [
                                                                    Radio(
                                                                        value: true,
                                                                        groupValue: state.data,
                                                                        onChanged: (value) => SurAddPatientData()
                                                                            .StrictureCubit
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
                                                                            .StrictureCubit
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
                                                              title: "Bile",
                                                              size: 12,
                                                              fontWeight: FontWeight.bold,
                                                              color: MyColors.black,
                                                            ),
                                                            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                                                              bloc: SurAddPatientData().BileCubit,
                                                              builder: (context, state) {
                                                                return Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Radio(
                                                                            value: true,
                                                                            groupValue: state.data,
                                                                            onChanged: (value) => SurAddPatientData()
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
                                                                            onChanged: (value) => SurAddPatientData()
                                                                                .BileCubit
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
                                                                            title: "Twist",
                                                                            size: 12,
                                                                            fontWeight: FontWeight.bold,
                                                                            color: MyColors.black,
                                                                          ),
                                                                          BlocBuilder<GenericBloc<bool>,
                                                                              GenericState<bool>>(
                                                                            bloc: SurAddPatientData().TwistCubit,
                                                                            builder: (context, state) {
                                                                              return Row(
                                                                                children: [
                                                                                  Radio(
                                                                                      value: true,
                                                                                      groupValue: state.data,
                                                                                      onChanged: (value) =>
                                                                                          SurAddPatientData()
                                                                                              .TwistCubit
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
                                                                                          SurAddPatientData()
                                                                                              .TwistCubit
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
                              bloc: SurAddPatientData().NormalDuodenum,
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    Radio(
                                        value: true,
                                        groupValue: state.data,
                                        onChanged: (value) => SurAddPatientData().NormalDuodenum.onUpdateData(value!)),
                                    MyText(
                                      title: "Yes",
                                      size: 12,
                                      color: MyColors.black,
                                    ),
                                    const SizedBox(width: 40),
                                    Radio(
                                        value: false,
                                        groupValue: state.data,
                                        onChanged: (value) => SurAddPatientData().NormalDuodenum.onUpdateData(value!)),
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
                              bloc: SurAddPatientData().DuodenalUlcer,
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    Radio(
                                        value: true,
                                        groupValue: state.data,
                                        onChanged: (value) => SurAddPatientData().DuodenalUlcer.onUpdateData(value!)),
                                    MyText(
                                      title: "Yes",
                                      size: 12,
                                      color: MyColors.black,
                                    ),
                                    const SizedBox(width: 40),
                                    Radio(
                                        value: false,
                                        groupValue: state.data,
                                        onChanged: (value) => SurAddPatientData().DuodenalUlcer.onUpdateData(value!)),
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
                              hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                              fieldTypes: FieldTypes.normal,
                              fillColor: MyColors.textFields,
                              hint: "Other...",
                              controller: SurAddPatientData().OtherDuodenumController,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              action: TextInputAction.next,
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
                onTap: () => SurAddPatientData().previousPage(),
              ),
            ),
            Expanded(
              child: DefaultButton(
                title: "Add Patient",
                onTap: () {
                  SurAddPatientData().addPatientSeventh(context);
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
