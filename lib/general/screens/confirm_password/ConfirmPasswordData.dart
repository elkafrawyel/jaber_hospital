part of 'ConfirmPasswordImports.dart';

class ConfirmPasswordData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final TextEditingController code = new TextEditingController();
  final GlobalKey<CustomButtonState> btnKey =
  new GlobalKey<CustomButtonState>();

  final GenericBloc<bool> reSendCubit = GenericBloc(false);
  final GenericBloc<bool> checkSendCubit = GenericBloc(false);
  final GenericBloc<int> currentSecondCubit = GenericBloc(0);

  String get timerText =>
      '${((60 - currentSecondCubit.state.data) % 60).toString().padLeft(2, '0')}';

  void startTimeout([int? milliseconds]) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      currentSecondCubit.onUpdateData(timer.tick);
      if (timer.tick >= 60) {
        timer.cancel();
        reSendCubit.onUpdateData(true);
        checkSendCubit.onUpdateData(false);
      }
    });
  }

  void reSendClicked() {
    reSendCubit.onUpdateData(false);
    startTimeout();
  }

  void onResendCode(BuildContext context,
      {required String email, required String userId}) async {
    bool result = await GeneralRepository(context)
        .resendCode(userId: userId, email: email);
    if (result) {
      reSendClicked();
      checkSendCubit.onUpdateData(true);
    }
  }

  void onSendCode(BuildContext context, {required String userId}) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      var result = await GeneralRepository(context).sendCode(code: code.text, userId: userId);
      if (result) {
        btnKey.currentState!.animateReverse();

        Nav.navigateTo(ResetPassword(userId: userId),
            navigatorType: NavigatorType.push);
      }
    }
    btnKey.currentState!.animateReverse();
  }
}
