import 'package:base_flutter/general/screens/login/LoginImports.dart';
import 'package:flutter/material.dart';
import '../../resources/GeneralRepoImports.dart';
import '../../utilities/http/dio/modals/LoadingDialog.dart';
import '../../utilities/tf_custom_widgets/utils/CustomButtonAnimation.dart';
import '../../utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../utilities/utils_functions/Navigator.dart';

class RegisterData {
  RegisterData._();

  static final RegisterData _instance = RegisterData._();

  factory RegisterData() => _instance;

  /// doctor
  late GlobalKey<FormState> doctorFormKey;
  late TextEditingController doctorFirstName;
  late TextEditingController doctorLastName;
  late TextEditingController doctorPassword;
  late TextEditingController doctorEmail;
  late GenericBloc<bool> doctorGenderMaleBloc;

  ///Company
  late GlobalKey<FormState> companyFormKey;
  late TextEditingController companyName;
  late TextEditingController companyEmail;
  late TextEditingController companyPassword;
  late TextEditingController companyContactPerson;
  late TextEditingController companyAddress;
  late TextEditingController companyMobile;

  ///Patient
  late GlobalKey<FormState> patientFormKey;
  late TextEditingController patientFirstNameEn;
  late TextEditingController patientLastNameEn;
  late TextEditingController patientFirstNameAr;
  late TextEditingController patientLastNameAr;
  late TextEditingController patientEmail;
  late TextEditingController patientPassword;
  late TextEditingController patientMobile;
  late TextEditingController patientAge;
  late TextEditingController patientWeight;
  late TextEditingController patientHeight;
  late GenericBloc<bool> patientGenderMaleBloc;





  late GenericBloc<int> selectAuthType;
  late GlobalKey<CustomButtonState> btnKey;

  void init() {
    selectAuthType = GenericBloc(-1);

    ///doctor
    doctorFormKey = GlobalKey<FormState>();
    doctorFirstName = TextEditingController();
    doctorLastName = TextEditingController();
    doctorEmail = TextEditingController();
    doctorPassword = TextEditingController();
    doctorGenderMaleBloc = GenericBloc(true);

    ///Company
    companyFormKey = GlobalKey<FormState>();
    companyName = TextEditingController();
    companyEmail = TextEditingController();
    companyPassword = TextEditingController();
    companyContactPerson = TextEditingController();
    companyAddress = TextEditingController();
    companyMobile = TextEditingController();

    ///Patient
    patientFormKey = GlobalKey<FormState>();
    patientFirstNameEn = TextEditingController();
    patientLastNameEn = TextEditingController();
    patientFirstNameAr = TextEditingController();
    patientLastNameAr = TextEditingController();
    patientEmail = TextEditingController();
    patientPassword = TextEditingController();
    patientMobile = TextEditingController();
    patientAge = TextEditingController();
    patientWeight = TextEditingController();
    patientHeight = TextEditingController();
    patientGenderMaleBloc = GenericBloc(true);







    btnKey = GlobalKey<CustomButtonState>();
  }

  List<String> authTypesList = ['Doctor', "Patient", "Company"];

  String get getAuthType => authTypesList[selectAuthType.state.data].toLowerCase();

  void doctorRegisterLogin(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (selectAuthType.state.data == -1) {
      CustomToast.showSnackBar(context, "Please select your Account Type", backgroundColor: Colors.redAccent);
      return;
    }
    if (doctorFormKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      var result = await GeneralRepository(context).doctorRegister(
        firstName: doctorFirstName.text,
        lastName: doctorLastName.text,
        email: doctorEmail.text,
        gender: doctorGenderMaleBloc.state.data ? 'male' : 'female',
        password: doctorPassword.text,
      );
      if (result) {
        btnKey.currentState!.animateReverse();
        Nav.navigateTo(
          Login(),
          navigatorType: NavigatorType.pushAndPopUntil,
        );
      }
      btnKey.currentState!.animateReverse();
    }
    btnKey.currentState!.animateReverse();
  }

  void companyRegisterLogin(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (selectAuthType.state.data == -1) {
      CustomToast.showSnackBar(context, "Please select your Account Type", backgroundColor: Colors.redAccent);
      return;
    }
    if (doctorFormKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      var result = await GeneralRepository(context).doctorRegister(
        firstName: doctorFirstName.text,
        lastName: doctorLastName.text,
        email: doctorEmail.text,
        gender: doctorGenderMaleBloc.state.data ? 'male' : 'female',
        password: doctorPassword.text,
      );
      if (result) {
        btnKey.currentState!.animateReverse();
        Nav.navigateTo(
          Login(),
          navigatorType: NavigatorType.pushAndPopUntil,
        );
      }
      btnKey.currentState!.animateReverse();
    }
    btnKey.currentState!.animateReverse();
  }

  register(BuildContext context) {
    switch (selectAuthType.state.data) {
      case 0:
        doctorRegisterLogin(context);
        break;
      case 1:
        break;
      case 2:
        companyRegisterLogin(context);
        break;
    }
  }
}
