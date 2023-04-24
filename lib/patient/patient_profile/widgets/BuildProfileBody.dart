part of 'profileWidgetImports.dart';

class BuildPatientProfileBody extends StatelessWidget {
  const BuildPatientProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: SurProfileData().formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        MyText(
          title: 'اسمك',
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: "اسمك",
          controller: SurProfileData().firstName,
          fillColor: MyColors.textFields,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.name,
          validate: (value) => value!.validateEmpty(context),
        ),
        MyText(
          title: 'اللقب',
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: "اللقب",
          controller: SurProfileData().lastName,
          fillColor: MyColors.textFields,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.name,
          validate: (value) => value!.validateEmpty(context),
        ),
        MyText(
          title: 'البريد الإلكتروني',
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: "البريد الإلكتروني",
          fillColor: MyColors.textFields,
          controller: SurProfileData().email,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.emailAddress,
          validate: (value) => value!.validateEmail(context),
        ),
        MyText(
          title: 'الوظيفة',
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: "الوظيفة",
          fillColor: MyColors.textFields,
          controller: SurProfileData().job,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.text,
          validate: (value) => value!.validateEmpty(context),
        ),
        MyText(
          title: 'السن',
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: "40",
          fillColor: MyColors.textFields,
          controller: SurProfileData().age,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.number,
          validate: (value) => value!.validateEmpty(context),
        ),
        MyText(
          title: 'النوع',
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 10),
        BuildSurProfileGender()
      ]),
    );
  }
}

class BuildSurProfileGender extends StatelessWidget {
  const BuildSurProfileGender({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<int>, GenericState<int>>(
      bloc: SurProfileData().genderBloc,
      builder: (context, state) {
        return Row(
          children: [
            InkWell(
              onTap: () => SurProfileData().genderBloc.onUpdateData(0),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: MyColors.textFields,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color:  state.data == 0
                        ? MyColors.primary
                        : MyColors.textFields,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color:  state.data == 0
                                  ? MyColors.primary
                                  : MyColors.grey),
                          color:  state.data == 0
                              ? MyColors.primary
                              : MyColors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child:  state.data == 0
                          ? Icon(
                        Icons.check,
                        color: MyColors.white,
                        size: 15,
                      )
                          : const SizedBox(),
                    ),
                    const SizedBox(width: 5),
                    Center(
                      child: MyText(
                        title: 'ذكر',
                        size: 10,
                        color:  state.data == 0
                            ? MyColors.primary
                            : MyColors.blackOpacity,
                        fontWeight:  state.data == 0
                            ? FontWeight.bold
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => SurProfileData().genderBloc.onUpdateData(1),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: MyColors.textFields,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color:  state.data == 1
                        ? MyColors.primary
                        : MyColors.textFields,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color:  state.data == 1
                                  ? MyColors.primary
                                  : MyColors.grey),
                          color:  state.data == 1
                              ? MyColors.primary
                              : MyColors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child:  state.data == 1
                          ? Icon(
                        Icons.check,
                        color: MyColors.white,
                        size: 15,
                      )
                          : const SizedBox(),
                    ),
                    const SizedBox(width: 5),
                    Center(
                      child: MyText(
                        title: 'أنثى',
                        size: 10,
                        color:  state.data == 1
                            ? MyColors.primary
                            : MyColors.blackOpacity,
                        fontWeight:  state.data == 1
                            ? FontWeight.bold
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        );
      },
    );
  }
}
