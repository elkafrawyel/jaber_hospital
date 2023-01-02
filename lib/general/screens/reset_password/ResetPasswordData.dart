part of 'ResetPasswordImports.dart';

class ResetPasswordData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final GenericBloc<bool> passwordBloc = GenericBloc(true);

  final TextEditingController password = new TextEditingController();

  void onResetPassword(BuildContext context, String userId) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      bool result = await GeneralRepository(context).resetUserPassword(userId: userId, pass: password.text);
      btnKey.currentState!.animateReverse();
      if (result) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => BuildPassResetSuccess(),
        );
      }
    }
  }
}

