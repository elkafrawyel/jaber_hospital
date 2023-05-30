part of 'ChangePasswordImports.dart';

class ChangePasswordData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey();

  final TextEditingController oldPassword = new TextEditingController();
  final TextEditingController newPassword = new TextEditingController();
  final TextEditingController confirmNewPassword = new TextEditingController();

  final GenericBloc<bool> showCurrentPassBloc = GenericBloc(true);
  final GenericBloc<bool> showNewPassBloc = GenericBloc(true);
  final GenericBloc<bool> showConfirmNewPassBloc = GenericBloc(true);

  void setChangePassword(BuildContext context)async{
    FocusScope.of(context).requestFocus(FocusNode());
    if(formKey.currentState!.validate()){
      btnKey.currentState?.animateForward();
      var result = await GeneralRepository(context).changePass(password: newPassword.text);
      btnKey.currentState?.animateReverse();
      if(result){
        navigationKey.currentState!.pop();
        showDialog(context: context, builder: (context)=>BuildChangePassDialog());
      }
    }
  }

}
