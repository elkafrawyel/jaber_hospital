part of 'GeneralRepoImports.dart';

class GeneralHttpMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  GeneralHttpMethods(this.context);

  Future<bool> userLogin(String email, String pass,String role) async {
    String? _deviceId = await messaging.getToken();
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

  Future<bool> patientLogin(String civilId, String pass,String role) async {
    String? _deviceId = await messaging.getToken();
    Map<String, dynamic> body = {
      "civil_id": "$civilId",
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

  Future<List<QuestionModel>> frequentQuestions() async {
    return await GenericHttp<QuestionModel>(context).callApi(
            name: ApiNames.repeatedQuestions,
            returnType: ReturnType.List,
            showLoader: false,
            methodType: MethodType.Get,
            returnDataFun: (data) => data["data"],
            toJsonFunc: (json) => QuestionModel.fromJson(json))
        as List<QuestionModel>;
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
    if(data!=null){
      HandleData.instance.handlePostData(data, context,showMsg: true,fullData: true);
      return true;
    }
    return false;
  }

  Future<bool> resendCode(String userId,String email) async {
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
      returnDataFun: (data) => HandleData.instance.handlePostData(data, context,showMsg: true),
    );
    if(data!=null){
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
            userId: result["data"]["user_id"], email: result["data"]["email"],
          ),
          navigatorType: NavigatorType.push);
    return true;
    }
    return false;
  }

  Future<bool> resetUserPassword(
      String userId ,String pass) async {
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
    if(data!=null){
      HandleData.instance.handlePostData(data, context,fullData: true,showMsg: true);
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
      Nav.navigateTo(Login(),
          navigatorType: NavigatorType.pushAndPopUntil);
      context.read<AuthCubit>().onUpdateAuth(false);
      CustomToast.showSimpleToast(
          msg: 'Sign Out Successfully', color: MyColors.primary);
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
    if(data!=null){
      HandleData.instance.handlePostData(data, context,fullData: true,showMsg: true);
      return true;
    }
    return false;
  }
}
