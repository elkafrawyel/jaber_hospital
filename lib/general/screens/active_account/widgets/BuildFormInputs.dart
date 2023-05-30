part of 'ActiveAccountWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final ActiveAccountData activeAccountData;

  const BuildFormInputs({required this.activeAccountData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: activeAccountData.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: PinCodeTextField(
          length: 4,
          appContext: context,
          onChanged: (String value) {},
          backgroundColor: Colors.transparent,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(15),
            fieldHeight: 60,
            fieldWidth: 55,
            inactiveColor: MyColors.greyWhite,
            activeColor: MyColors.primary,
            selectedColor: MyColors.primary,
            selectedFillColor: MyColors.textFields,
            inactiveFillColor: MyColors.textFields,
            activeFillColor: MyColors.textFields,
            disabledColor: MyColors.primary,
          ),
          animationDuration: Duration(milliseconds: 300),
          enableActiveFill: true,
          // validator: (value) => value!.validateEmpty(context),
          controller: activeAccountData.code,
        ),
      ),
    );
  }
}
