part of 'LoginImports.dart';

class LoginData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final TextEditingController password = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final GenericBloc<bool> passwordBloc = GenericBloc(true);
  final GenericBloc<int> selectAuthType = GenericBloc(-1);

  // list AuthTypes for test
  List<String> authTypesList = ['Doctor', "Patient", "Pharmacy"];
  //AuthTypeModel

  void userLogin(BuildContext context) async {
    Nav.navigateTo(
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
