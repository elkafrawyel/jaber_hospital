part of 'LoginImports.dart';

class LoginData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final GenericBloc<bool> passwordBloc = GenericBloc(true);
  final TextEditingController password = new TextEditingController();
  final TextEditingController phone = new TextEditingController();

  void userLogin(BuildContext context) async {
    Nav.navigateTo(
      context,
      Home(index: 0),
      navigatorType: NavigatorType.push,
    );
    // FocusScope.of(context).requestFocus(FocusNode());
    // if (formKey.currentState!.validate()) {
    //   btnKey.currentState!.animateForward();
    //   String phoneEn = Utils.convertDigitsToLatin(phone.text);
    //   String passEn = Utils.convertDigitsToLatin(password.text);
    //   await GeneralRepository(context).setUserLogin(phoneEn, passEn);
    //   btnKey.currentState!.animateReverse();
    // }
  }
}
