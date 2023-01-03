part of 'LoginImports.dart';

class LoginData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final TextEditingController password = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final GenericBloc<bool> passwordBloc = GenericBloc(true);
  final GenericBloc<int> selectAuthType = GenericBloc(-1);

  // list AuthTypes for test
  List<String> authTypesList = ['Doctor', "Patient", "Pharmacy"];
  //AuthTypeModel

  void userLogin(BuildContext context) async {
    var user = context.read<UserCubit>().state.model;
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      await GeneralRepository(context).userLogin(email: email.text, pass: password.text, role:"doctor" );
      btnKey.currentState!.animateReverse();
    }
    log("====s=s==s=ss==ss==s ${user.accessToken}- ${user.refreshToken} - ${user.userData?.length}");
  }

}
