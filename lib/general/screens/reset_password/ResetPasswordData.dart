part of 'ResetPasswordImports.dart';

class ResetPasswordData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final GenericBloc<bool> passwordBloc = GenericBloc(true);

  final TextEditingController newPassword = new TextEditingController();

  void onResetPassword(BuildContext context, String userId) async {
    // FocusScope.of(context).requestFocus(FocusNode());
    showDialog(
      context: context,
      builder: (context) => BuildPassResetSuccess(),
    );
    // if (formKey.currentState!.validate()) {
    //   btnKey.currentState!.animateForward();
    //   bool result = await GeneralRepository(context).resetUserPassword(userId, 'code', newPassword.text);
    //   btnKey.currentState!.animateReverse();
    //   if (result) {
    //     // ExtendedNavigator.of(context).popUntilPath(Routes.login);
    //   }
    // }
  }
}

