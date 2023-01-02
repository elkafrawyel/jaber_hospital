part of 'ForgetPasswordImports.dart';

class ForgerPasswordData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final TextEditingController email = new TextEditingController();

  void onForgetPassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      dynamic result =
          await GeneralRepository(context).forgetPassword(email.text);
      Nav.navigateTo(
          ConfirmPassword(
            userId: result["user_id"], email: result["email"],
          ),
          navigatorType: NavigatorType.push);
      btnKey.currentState!.animateReverse();
    }
    btnKey.currentState!.animateReverse();
  }
}
