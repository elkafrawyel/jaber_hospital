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
      returnDataFun: (data) => HandleData.instance.handlePostData(data, context,fullData: true,showMsg: true),
      // toJsonFunc: (json) => UserModel.fromJson(json),
      showLoader: false,
    );
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

  Future<dynamic> forgetPassword(String email) async {
    Map<String, dynamic> body = {
      "email": "$email",
    };
    dynamic result = await GenericHttp<dynamic>(context).callApi(
      name: ApiNames.forgetPassword,
      returnType: ReturnType.Type,
      jsonBody: body,
      showLoader: false,
      methodType: MethodType.Post,
      returnDataFun: (data) =>
          HandleData.instance.handlePostData(data, context, showMsg: true),
    );
    if (result != null) {
      return result;
    } else {
      return null;
    }
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
}
