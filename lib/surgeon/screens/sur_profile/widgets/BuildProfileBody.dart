part of 'profileWidgetImports.dart';

class BuildProfileBody extends StatelessWidget {
  const BuildProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: SurProfileData().formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        MyText(
          title: 'FirstNameEn',
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: "FirstNameEn",
          controller: SurProfileData().firstName,
          fillColor: MyColors.textFields,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.name,
          validate: (value) => value!.validateEmpty(context),
        ),
        MyText(
          title: 'LastNameEn',
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: "LastNameEn",
          controller: SurProfileData().lastName,
          fillColor: MyColors.textFields,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.name,
          validate: (value) => value!.validateEmpty(context),
        ),
        MyText(
          title: 'Email',
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: "Email",
          fillColor: MyColors.textFields,
          controller: SurProfileData().email,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.emailAddress,
          validate: (value) => value!.validateEmail(context),
        ),
        MyText(
          title: 'Job',
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: "Job",
          fillColor: MyColors.textFields,
          controller: SurProfileData().job,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.text,
          validate: (value) => value!.validateEmpty(context),
        ),
        MyText(
          title: 'Age',
          size: 12,
          fontWeight: FontWeight.bold,
        ),
        GenericTextField(
          fieldTypes: FieldTypes.normal,
          hint: "Age",
          fillColor: MyColors.textFields,
          controller: SurProfileData().age,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.number,
          validate: (value) => value!.validateEmpty(context),
        ),
        MyText(
          title: 'Gender',
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
                        title: 'Male',
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
                        title: 'Female',
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
