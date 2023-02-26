part of 'SurgeonRepoImports.dart';

class SurgeonHttpMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  SurgeonHttpMethods(this.context);

  Future<SurgeonHomeModel?> getHome(String doctorId) async {
    String param = "?doctor_id=$doctorId";
    return await GenericHttp<SurgeonHomeModel>(context).callApi(
      name: ApiNames.doctorHome + param,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data["data"],
      toJsonFunc: (json) => SurgeonHomeModel.fromJson(json),
    );
  }

  Future<List<PatientModel>> getAllPatientPreOp() async {
    dynamic data = await GenericHttp<PatientModel>(context).callApi(
      name: ApiNames.allPatientsPreOp,
      returnType: ReturnType.List,
      methodType: MethodType.Get,
      returnDataFun: (data) => data["data"],
      toJsonFunc: (json) => PatientModel.fromJson(json),
    );
    if (data != null) {
      return data;
    } else {
      return [];
    }
  }

  Future<List<PatientModel>> getAllPatientPostOp() async {
    dynamic data = await GenericHttp<PatientModel>(context).callApi(
      name: ApiNames.allPatientsPostOp,
      returnType: ReturnType.List,
      methodType: MethodType.Get,
      returnDataFun: (data) => data["data"],
      toJsonFunc: (json) => PatientModel.fromJson(json),
    );
    if (data != null) {
      return data;
    } else {
      return [];
    }
  }

  Future<List<PatientModel>> getMyPatientPostOp() async {
    dynamic data = await GenericHttp<PatientModel>(context).callApi(
      name: ApiNames.myPatientsPostOp,
      returnType: ReturnType.List,
      methodType: MethodType.Get,
      returnDataFun: (data) => data["data"],
      toJsonFunc: (json) => PatientModel.fromJson(json),
    );
    if (data != null) {
      return data;
    } else {
      return [];
    }
  }

  Future<List<PatientModel>> getMyPatientPreOp() async {
    dynamic data = await GenericHttp<PatientModel>(context).callApi(
      name: ApiNames.myPatientsPreOp,
      returnType: ReturnType.List,
      methodType: MethodType.Get,
      returnDataFun: (data) => data["data"],
      toJsonFunc: (json) => PatientModel.fromJson(json),
    );
    if (data != null) {
      return data;
    } else {
      return [];
    }
  }

  Future<bool> addPatientFirst( String userId,  AddPatientFirstDto model) async {
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.patientBasicInfo + "?user_id=$userId",
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      returnDataFun: (data) => data,
      jsonBody: model.toJson(),
      showLoader: true,
    );
    if (data != null) {
      CustomToast.showSnackBar(context, data["message"]["message_en"]);
      return true;
    }
    return false;
  }

  Future<bool> updateSurgeonProfile(ProfileModel model) async {
    Map<String, dynamic> body = {};
    body.addAll(model.toJson());
    body.removeWhere((key, value) => value == null);
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.updateProfile,
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
      returnDataFun: (data) => data["data"],
      jsonBody: body,
      showLoader: false,
    );
    if (data != null) {
      UserModel user = context.read<UserCubit>().state.model;
      user.userData?[0].fullNameEn = data["full_name_en"];
      user.userData?[0].fullNameAr = data["full_name_ar"];
      user.userData?[0].email = data["email"];
      user.userData?[0].age = data["age"];
      user.userData?[0].role = data["role"];
      user.userData?[0].gender = data["gender"];
      user.userData?[0].image = data["image"];
      await Utils.saveUserData(user);
      context.read<UserCubit>().onUpdateUserData(user);
      return true;
    } else {
      return false;
    }
  }


  Future<PatientDetailsModel?> getPatientDetails(String patientId) async {
    dynamic data = await GenericHttp<PatientDetailsModel>(context).callApi(
      name: ApiNames.patientDetails + "/$patientId",
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data["data"],
      toJsonFunc: (json) => PatientDetailsModel.fromJson(json),
    );
    if (data != null) {
      return data;
    } else {
      return null;
    }
  }

  Future<bool> addAppointment(String patientId,String date,String comments,String clinicName) async {
    var user = context.read<UserCubit>().state.model ;
    Map<String, dynamic> body = {
      "doctor_id": user.userData?[0].sId,
      "patient_id": patientId,
      "appointment_date": date,
      "comments": comments,
      "clinic_name_en":clinicName,
      "clinic_name_ar":clinicName,


    };
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.addAppointment ,
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      returnDataFun: (data) => data,
      jsonBody: body,
      showLoader: true,
    );
    if (data != null) {
      CustomToast.showSnackBar(context, data["message"]["message_en"]);
      return true;
    }
    return false;
  }
}
