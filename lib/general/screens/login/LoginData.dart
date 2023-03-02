part of 'LoginImports.dart';

class LoginData {
  LoginData._();
  static final LoginData _instance = LoginData._();

  factory LoginData() => _instance;

  late GlobalKey<FormState> formKey ;
  late GlobalKey<CustomButtonState> btnKey ;
  late TextEditingController password ;
  late TextEditingController email ;
  late TextEditingController civilId ;
  late GenericBloc<bool> passwordBloc;
  late GenericBloc<bool> rememberMeBloc;
  late GenericBloc<int> selectAuthType;

  void init (){
    formKey = GlobalKey<FormState>();
    btnKey = GlobalKey<CustomButtonState>();
    password = TextEditingController();
    email = TextEditingController();
    civilId = TextEditingController();
    passwordBloc = GenericBloc(true);
    rememberMeBloc = GenericBloc(false);
    selectAuthType = GenericBloc(-1);

  }
  List<String> authTypesList = ['Doctor', "Patient", "Company"];
  String get getAuthType => authTypesList[selectAuthType.state.data].toLowerCase();

  void userLogin(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    var user = context.read<UserCubit>().state.model;
    if (selectAuthType.state.data == -1) {
      CustomToast.showSnackBar(context, "Please select your Account Type",
          backgroundColor: Colors.redAccent);
      return;
    }
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      log("getAuthType==> $getAuthType");
      var result;
      // result = await GeneralRepository(context).userLogin(
      //     email: email.text, pass: password.text, role: getAuthType);
      if(getAuthType == "patient"){
        result = await GeneralRepository(context).patientLogin(
            civilId: civilId.text, pass: password.text, role: getAuthType);
      }else{
        result = await GeneralRepository(context).userLogin(
            email: email.text, pass: password.text, role: getAuthType);
      }
      if (result) {
        btnKey.currentState!.animateReverse();
      }
      btnKey.currentState!.animateReverse();
    }
    btnKey.currentState!.animateReverse();
    log("====s=s==s=ss==ss==s ${user.accessToken}- ${user.refreshToken} - ${user.userData?.length}");
  }
}
