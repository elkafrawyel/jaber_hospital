part of 'GeneralRepoImports.dart';

class GeneralHttpMethods {
  final BuildContext context;

  GeneralHttpMethods(this.context);

  Future<bool> userLogin(String email, String pass, String role) async {
    Map<String, dynamic> body = {
      "email": "$email",
      "role": "$role",
      "password": "$pass",
    };
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.login,
      jsonBody: body,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      // returnDataFun: (data) => HandleData.instance.handlePostData(data, context,fullData: true,showMsg: true),
      returnDataFun: (data) => data,
      showLoader: false,
    );
    log("loginResponse=> $data");
    return Utils.manipulateLoginData(context, data);
  }

  Future<bool> patientLogin(String civilId, String pass, String role) async {
    Map<String, dynamic> body = {
      "file_id": "$civilId",
      "role": "$role",
      "password": "$pass",
    };
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.patientLogin,
      jsonBody: body,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      // returnDataFun: (data) => HandleData.instance.handlePostData(data, context,fullData: true,showMsg: true),
      returnDataFun: (data) => data,
      showLoader: false,
    );
    log("loginResponse=> $data");
    return Utils.manipulateLoginData(context, data);
  }

  Future<bool> doctorRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String gender,
  }) async {
    var doctorRole = await GenericHttp<dynamic>(context).callApi(
      name: "surgeon-role",
      returnType: ReturnType.Type,
      methodType: MethodType.Get,
      returnDataFun: (data) => data['data']["_id"],
      showLoader: false,
    );

    print('=================>$doctorRole');
    Map<String, dynamic> body = {
      "first_name_en": firstName,
      "last_name_en": lastName,
      "gender": gender,
      "email": email,
      "password": "$password",
      "civil_id": "222222222222",
      "doctor_role_id": doctorRole,
    };

    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.doctor,
      jsonBody: body,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      returnDataFun: (data) => data['code'],
      showLoader: false,
    );
    log("loginResponse=> $data");
    return data == 200;
  }

  Future<bool> companyRegister({
    required String name,
    required String email,
    required String password,
    required String address,
    required String contactPerson,
    required String contactMobile,
  }) async {
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
      "company_name_en": name,
      "status": true,
      "company_address": address,
      "company_contact_person": contactPerson,
      "company_contact_mobile": contactMobile
    };
    var data = await GenericHttp<dynamic>(context).callApi(
      name: "mobile/${ApiNames.companiesPath}",
      jsonBody: body,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      returnDataFun: (data) => data['code'],
      showLoader: false,
    );
    log("loginResponse=> $data");
    return data == 200;
  }

  Future<bool> patientRegister({
    required String firstNameEn,
    required String firstNameAr,
    required String lastNameEn,
    required String lastNameAr,
    required String email,
    required String password,
    required String age,
    required String gender,
    required String mobile,
    required String weight,
    required String height,
    required String fileId,
  }) async {
    String bmi = '';
    if (weight.isNotEmpty && height.isNotEmpty) {
      double weightD = double.parse(weight);
      double heightD = double.parse(height);
      bmi = (((weightD / heightD) / heightD) * 10000).toString();
    }
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
      "first_name_ar": firstNameAr,
      "first_name_en": firstNameEn,
      "last_name_ar": lastNameAr,
      "last_name_en": lastNameEn,
      "gender": gender,
      "civil_id": "3209654323765",
      "telephone_1": mobile,
      "age": age,
      "weight": weight,
      "height": height,
      "bmi": bmi,
      "file_id": fileId
    };
    var data = await GenericHttp<dynamic>(context).callApi(
      name: "mobile/patient_basicInfo",
      jsonBody: body,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      returnDataFun: (data) => data['code'],
      showLoader: false,
    );
    log("loginResponse=> $data");
    return data == 200;
  }

  Future<List<QuestionModel>> frequentQuestions() async {
    return await GenericHttp<QuestionModel>(context).callApi(
        name: ApiNames.repeatedQuestions,
        returnType: ReturnType.List,
        showLoader: false,
        methodType: MethodType.Get,
        returnDataFun: (data) => data["data"],
        toJsonFunc: (json) => QuestionModel.fromJson(json)) as List<QuestionModel>;
  }

  Future<bool> registerButton() async {
    return await GenericHttp<bool>(context).callApi(
      name: "system/register",
      returnType: ReturnType.Type,
      showLoader: false,
      methodType: MethodType.Get,
      returnDataFun: (data) => data["data"]["register"],
    );
  }

  Future<bool> sendCode(String code, String userId) async {
    Map<String, dynamic> body = {"otp": code, "userId": userId};
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.verifyOtp,
      jsonBody: body,
      returnType: ReturnType.Type,
      showLoader: false,
      methodType: MethodType.Post,
      // returnDataFun: (data) => HandleData.instance.handlePostData(data, context,showMsg: true,fullData: true),
    );
    if (data != null) {
      HandleData.instance.handlePostData(data, context, showMsg: true, fullData: true);
      return true;
    }
    return false;
  }

  Future<bool> resendCode(String userId, String email) async {
    Map<String, dynamic> body = {
      "userId": userId,
      "email": email,
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.resendCode,
      jsonBody: body,
      returnType: ReturnType.Type,
      showLoader: false,
      methodType: MethodType.Post,
      returnDataFun: (data) => HandleData.instance.handlePostData(data, context, showMsg: true),
    );
    if (data != null) {
      return true;
    }
    return false;
  }

  Future<String?> aboutApp() async {
    return await GenericHttp<String>(context).callApi(
      name: ApiNames.aboutApp,
      returnType: ReturnType.Type,
      showLoader: false,
      methodType: MethodType.Get,
    );
  }

  Future<String?> terms() async {
    return await GenericHttp<String>(context).callApi(
      name: ApiNames.terms,
      returnType: ReturnType.Type,
      showLoader: false,
      methodType: MethodType.Get,
    );
  }

  Future<bool> switchNotify() async {
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.switchNotify,
      returnType: ReturnType.Type,
      showLoader: false,
      methodType: MethodType.Post,
    );
    return (data != null);
  }

  Future<bool> forgetPassword(String email) async {
    Map<String, dynamic> body = {
      "email": "$email",
    };
    dynamic result = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.forgetPassword,
      returnType: ReturnType.Type,
      jsonBody: body,
      showLoader: false,
      methodType: MethodType.Post,
    );
    if (result != null) {
      HandleData.instance.handlePostData(result, context, showMsg: true);
      Nav.navigateTo(
          ConfirmPassword(
            userId: result["data"]["user_id"],
            email: result["data"]["email"],
          ),
          navigatorType: NavigatorType.push);
      return true;
    }
    return false;
  }

  Future<bool> resetUserPassword(String userId, String pass) async {
    Map<String, dynamic> body = {
      "id": "$userId",
      "password": "$pass",
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.resetPassword,
      returnType: ReturnType.Type,
      jsonBody: body,
      showLoader: false,
      methodType: MethodType.Post,
    );
    if (data != null) {
      HandleData.instance.handlePostData(data, context, fullData: true, showMsg: true);
      return true;
    }
    return false;
  }

  Future<bool> sendMessage(String? name, String? mail, String? message) async {
    Map<String, dynamic> body = {
      "name": "$name",
      "email": "$mail",
      "comment": "$message",
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.contactUs,
      returnType: ReturnType.Type,
      jsonBody: body,
      showLoader: false,
      methodType: MethodType.Post,
    );
    return (data != null);
  }

  Future<bool> logOut() async {
    LoadingDialog.showLoadingDialog();
    var data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.logout,
      returnType: ReturnType.Type,
      showLoader: true,
      methodType: MethodType.Get,
    );
    if (data != null) {
      EasyLoading.dismiss();
      Utils.clearSavedData();
      GlobalState.instance.set("token", "");
      Nav.navigateTo(Login(), navigatorType: NavigatorType.pushAndPopUntil);
      context.read<AuthCubit>().onUpdateAuth(false);
      CustomToast.showSimpleToast(msg: 'Sign Out Successfully', color: MyColors.primary);
      context.read<LangCubit>().onUpdateLanguage("en");
      return true;
    }
    EasyLoading.dismiss();
    return false;
  }

  Future<bool> changePass(String password) async {
    Map<String, dynamic> body = {
      "password": "$password",
    };
    dynamic data = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.changePassword,
      returnType: ReturnType.Type,
      jsonBody: body,
      showLoader: false,
      methodType: MethodType.Post,
    );
    if (data != null) {
      HandleData.instance.handlePostData(data, context, fullData: true, showMsg: true);
      return true;
    }
    return false;
  }
}
