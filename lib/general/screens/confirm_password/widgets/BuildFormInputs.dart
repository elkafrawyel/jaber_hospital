part of 'ConfirmPasswordWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final ConfirmPasswordData confirmPasswordData;
  final String userId;

  const BuildFormInputs({required this.confirmPasswordData, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: confirmPasswordData.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: PinCodeTextField(
          length: 4,
          onChanged: (String value) {},
          backgroundColor: Colors.transparent,
          // animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            selectedColor: MyColors.textFields,
            borderWidth: 0,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            inactiveColor: MyColors.textFields,
            activeColor: MyColors.primary,
            selectedFillColor: MyColors.textFields,
            inactiveFillColor: MyColors.textFields,
            activeFillColor: MyColors.textFields,
            disabledColor: MyColors.black,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Please enter OTP";
            } else if (value.length < 4) {
              return "Please enter valid OTP";
            }
            return null;
          },
          onCompleted: (String value) {
            confirmPasswordData.onSendCode(context, userId: userId);
          },
          animationDuration: Duration(milliseconds: 300),
          enableActiveFill: true,
          controller: confirmPasswordData.code,
          appContext: context,
        ),
      ),
    );
  }
}
