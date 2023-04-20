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

  Future<String?> addPatientFirst(String userId, AddPatientFirstDto model) async {
    dynamic data = await GenericHttp<PatientDetailsModel>(context).callApi(
      name: ApiNames.patientBasicInfo + "?user_id=$userId",
      returnType: ReturnType.Type,
      methodType: MethodType.Post,
      returnDataFun: (data) => data,
      jsonBody: model.toJson(),
      showLoader: true,
    );
    if (data != null) {
      CustomToast.showSnackBar(context, data["message"]["message_en"]);
      String id = data['data']['_id'];
      return id;
    }
    return null;
  }

  Future<bool> editPatientFirst(String userId, AddPatientFirstDto model) async {
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.patientBasicInfo + "?user_id=$userId",
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
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

  Future<bool> addPatientSecond(AddPatientSecondDto model) async {
    UserModel? users = context.read<UserCubit>().state.model;
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.patientCoMorbidities + "?user_id=${users.userData?[0].sId}",
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
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

  Future<bool> addPatientThird(AddPatientThirdDto model) async {
    UserModel? users = context.read<UserCubit>().state.model;
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.patientReflux + "?user_id=${users.userData?[0].sId}",
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
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

  Future<bool> addPatientFourth(AddPatientFourthDto model) async {
    UserModel? users = context.read<UserCubit>().state.model;
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.patientReflux + "?user_id=${users.userData?[0].sId}",
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
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

  Future<bool> addPatientFifth(AddPatientFifthDto model) async {
    UserModel? users = context.read<UserCubit>().state.model;
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.patientProcedures + "?user_id=${users.userData?[0].sId}",
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
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

  Future<bool> addPatientSixth(AddPatientSixthDto model) async {
    UserModel? users = context.read<UserCubit>().state.model;
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.patientPreOperative + "?patient_id=${users.userData?[0].sId}",
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
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
      user.userData?[0].firstNameEn = data["first_name_en"];
      user.userData?[0].firstNameAr = data["first_name_ar"];
      user.userData?[0].lastNameAr = data["last_name_ar"];
      user.userData?[0].lastNameEn = data["last_name_en"];
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

  Future<bool> addAppointment(
    String patientId,
    String date,
    String comments,
    // String clinicName,
  ) async {
    var user = context.read<UserCubit>().state.model;
    Map<String, dynamic> body = {
      "doctor_id": user.userData?[0].sId,
      "patient_id": patientId,
      "appointment_date": date,
      "comments": comments,
      // "clinic_name_en": clinicName,
      // "clinic_name_ar": clinicName,
    };
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.addAppointment,
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

  Future<List<MedicationsOrdersModel>> getMedicationOrders(int index) async {
    dynamic data = await GenericHttp<MedicationsOrdersModel>(context).callApi(
      name: _getMedicationApiNames(index),
      returnType: ReturnType.List,
      methodType: MethodType.Get,
      returnDataFun: (data) => data["data"],
      toJsonFunc: (json) => MedicationsOrdersModel.fromJson(json),
    );
    if (data != null) {
      return data;
    } else {
      return [];
    }
  }

  Future<InstrumentOrdersResponse> getInstrumentsRoutedOrders() async {
    dynamic data = await GenericHttp<InstrumentOrdersResponse>(context).callApi(
      name: ApiNames.instrumentsRoutedOrdersPath,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => InstrumentOrdersResponse.fromJson(json),
    );
      return data;
  }

  Future<InstrumentOrdersResponse> getInProgressInstrumentsOrders() async {
    dynamic data = await GenericHttp<InstrumentOrdersResponse>(context).callApi(
      name: ApiNames.instrumentsProgressOrdersPath,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => InstrumentOrdersResponse.fromJson(json),
    );
    return data;
  }

  Future<InstrumentOrdersResponse> getCompletedInstrumentsOrders() async {
    dynamic data = await GenericHttp<InstrumentOrdersResponse>(context).callApi(
      name: ApiNames.instrumentsCompletedOrdersPath,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => InstrumentOrdersResponse.fromJson(json),
    );
    return data;
  }

  String _getMedicationApiNames(int index) {
    switch (index) {
      case 0:
        return ApiNames.doctorRoutedOrders;
      case 1:
        return ApiNames.doctorInProgressOrders;
      case 2:
        return ApiNames.doctorCompleatedOrders;
      default:
        return ApiNames.doctorRoutedOrders;
    }
  }

  Future<bool> cancelMedicationOrder(String orderId) async {
    Map<String, dynamic> body = {
      "order_status": "canceled",
    };
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.cancelMedicationOrder + "?order_id=$orderId",
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
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

  Future<bool> cancelInstrumentOrder(String orderId) async {
    Map<String, dynamic> body = {
      "order_status": "canceled",
    };
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.cancelInstrumentOrder + "?order_id=$orderId",
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
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

  Future<List<PatientNameModel>> getPatientNames() async {
    dynamic data = await GenericHttp<PatientNameModel>(context).callApi(
      name: ApiNames.patientNames,
      returnType: ReturnType.List,
      methodType: MethodType.Get,
      returnDataFun: (data) => data["data"],
      toJsonFunc: (json) => PatientNameModel.fromJson(json),
    );
    if (data != null) {
      return data;
    } else {
      return [];
    }
  }

  Future<MedicationModel?> getListMedication(String pageNumber) async {
    dynamic data = await GenericHttp<MedicationModel>(context).callApi(
      name: ApiNames.listMedication + "?page=$pageNumber",
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => MedicationModel.fromJson(json),
    );
    if (data != null) {
      return data;
    } else {
      return null;
    }
  }

  Future<bool> requestMedicationOrder(Map<String, dynamic> body) async {
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.requestMedicationOrder,
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

  Future<NotificationsResponse?> fetchSurgeonNotifications() async {
    log('fetchNotifications called...');
    UserModel user = context.read<UserCubit>().state.model;
    final data = await GenericHttp<NotificationsResponse>(context).callApi(
      name: "${ApiNames.surgeonNotifications}?doctor_id=${user.userData?[0].sId}",
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => NotificationsResponse.fromJson(json),
    );
    return data;
  }

  Future<MdtPatientsResponse?> fetchMdtPatientsByStatus(String status) async {
    MdtPatientsResponse data = await GenericHttp<MdtPatientsResponse>(context).callApi(
      name: "${ApiNames.mdtPatientsPath}?mdt_status=$status",
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => MdtPatientsResponse.fromJson(json),
    );
    return data;
  }

  Future<MdtPatientsResponse?> fetchMdtAllReadyPatients() async {
    MdtPatientsResponse data = await GenericHttp<MdtPatientsResponse>(context).callApi(
      name: ApiNames.mdtReadyPatientsPath,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => MdtPatientsResponse.fromJson(json),
    );
    return data;
  }

  Future<MdtPatientsResponse?> fetchMdtAdminPatients() async {
    MdtPatientsResponse data = await GenericHttp<MdtPatientsResponse>(context).callApi(
      name: ApiNames.mdtAdminPatientsPath,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => MdtPatientsResponse.fromJson(json),
    );
    return data;
  }

  Future<UpdateConsentResponse?> confirmMdtBooking(Map<String, dynamic> body, String patientId) async {
    final data = await GenericHttp<UpdateConsentResponse>(context).callApi(
      name: "${ApiNames.confirmMdtBookingPath}?user_id=$patientId",
      returnType: ReturnType.Model,
      methodType: MethodType.Put,
      jsonBody: body,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => UpdateConsentResponse.fromJson(json),
    );
    return data;
  }

  Future<UpdateConsentResponse?> updateReadyMdtStatus(Map<String, dynamic> body) async {
    final data = await GenericHttp<UpdateConsentResponse>(context).callApi(
      name: ApiNames.updatePatientMdtStatusPath,
      returnType: ReturnType.Model,
      methodType: MethodType.Put,
      jsonBody: body,
      returnDataFun: (data) => data,
      showLoader: true,
      toJsonFunc: (json) => UpdateConsentResponse.fromJson(json),
    );
    return data;
  }

  Future<UpdateConsentResponse?> sendMdtResult(Map<String, dynamic> body) async {
    final data = await GenericHttp<UpdateConsentResponse>(context).callApi(
      name: ApiNames.patientMdtResultPath,
      returnType: ReturnType.Model,
      methodType: MethodType.Put,
      jsonBody: body,
      returnDataFun: (data) => data,
      showLoader: true,
      toJsonFunc: (json) => UpdateConsentResponse.fromJson(json),
    );
    return data;
  }

  Future<UpdateConsentResponse?> rescheduleMdtPatientStatus(String patientId) async {
    final data = await GenericHttp<UpdateConsentResponse>(context).callApi(
      name: "${ApiNames.rescheduleMdtPatientPath}?patient_id=$patientId",
      returnType: ReturnType.Model,
      methodType: MethodType.Put,
      returnDataFun: (data) => data,
      showLoader: true,
      toJsonFunc: (json) => UpdateConsentResponse.fromJson(json),
    );
    return data;
  }

  Future<AppointmentsResponse?> fetchSurAppointments(bool isUpcoming) async {
    AppointmentsResponse data = await GenericHttp<AppointmentsResponse>(context).callApi(
      name: isUpcoming ? ApiNames.surFutureAppointmentsPath : ApiNames.surPastAppointmentsPath,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => AppointmentsResponse.fromJson(json),
    );
    return data;
  }

  Future<bool> downloadPatientInfo(String patientId) async {
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.downloadPatientInfo + "?patient_id=${patientId}",
      returnType: ReturnType.Type,
      methodType: MethodType.Get,
      returnDataFun: (data) => data["data"]["report_url"],
      toJsonFunc: (json) => PatientDetailsModel.fromJson(json),
    );
    if (data != null) {
      print('=============$data');

      Nav.navigateTo(WebViewScreen(url: data), navigatorType: NavigatorType.push);

      return true;
      // try {
      //   Directory downloadsDir = await getTemporaryDirectory();
      //   var filePath = '${downloadsDir.path}/patient_$patientId.pdf';
      //   Dio dio = new Dio(
      //     BaseOptions(
      //       contentType: "application/x-www-form-urlencoded; charset=utf-8",
      //       followRedirects: true,
      //     ),
      //   );
      //   Response response = await dio.download(
      //     data,
      //     filePath,
      //     onReceiveProgress: (received, total) {
      //       int percentage = ((received / total) * 100).floor();
      //       print(percentage);
      //     },
      //   );
      // if (response.statusCode! >= 200 || response.statusCode! <= 300)
      //   CustomToast.showSnackBar(context, 'Patient Information Downloaded Successfully');
      // else
      //   CustomToast.showSnackBar(context, 'Patient Information Download Failed');
      // return true;
      // }
      // catch (e) {
      // CustomToast.showSnackBar(context, 'Patient Information Download Failed');
      //
      // return false;
      // }
    } else {
      return false;
    }
  }

  Future<bool> archivePatient(String patientId) async {
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.patientArchive + "/${patientId}",
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => PatientDetailsModel.fromJson(json),
    );
    if (data != null) {
      CustomToast.showSnackBar(context, data["message"]["message_en"]);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> addPatientSeventh(AddPatientSeventhDto model) async {
    UserModel? users = context.read<UserCubit>().state.model;
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.patientEgd + "?user_id=${users.userData?[0].sId}",
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
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

  Future<bool> uploadFluoroscopyResult(File file) async {
    UserModel? users = context.read<UserCubit>().state.model;
    Map<String, dynamic> body = {
      'patient_id': users.userData![0].sId,
      // 'patient_id': '63d841866514c4eaa12e0128',
      'file': file,
    };
    body.removeWhere((key, value) => value == null);
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.uploadFluoroscopyResult,
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
      returnDataFun: (data) => data["data"],
      jsonBody: body,
      showLoader: true,
    );
    if (data != null) {
      // CustomToast.showSnackBar(context, data["message"]["message_en"]);
      return true;
    }
    return false;
  }

  Future<bool> uploadEgd(File file) async {
    UserModel? users = context.read<UserCubit>().state.model;
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.uploadEgdResult,
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
      showLoader: true,
      jsonBody: {
        'patient_id': users.userData![0].sId,
        // 'patient_id': '63d841866514c4eaa12e0128',
        'fileToUpload': file,
      },
    );
    if (data != null) {
      CustomToast.showSnackBar(context, data["message"]["message_en"]);
      return true;
    }
    return false;
  }

  Future<List<LabModel>> getAllLabs() async {
    dynamic data = await GenericHttp<LabsResponse>(context).callApi(
      name: ApiNames.labs + '?limit=99999',
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      showLoader: false,
      toJsonFunc: LabsResponse.fromJson,
    );

    if (data != null) {
      return (data as LabsResponse).data ?? [];
    }
    return [];
  }

  Future<CompaniesResponse?> getCompanies() async {
    CompaniesResponse? data = await GenericHttp<CompaniesResponse?>(context).callApi(
      name: ApiNames.companiesPath,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => CompaniesResponse.fromJson(json),
    );
    return data;
  }

  Future<CompanyInstrumentsResponse> fetchCompanyInstruments(String companyId) async {
    Map<String, dynamic> query = {
      "company_id": companyId,
    };
    dynamic data = await GenericHttp<CompanyInstrumentsResponse>(context).callApi(
      name: ApiNames.companyInstrumentsPath,
      returnType: ReturnType.Model,
      query: query,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => CompanyInstrumentsResponse.fromJson(json),
    );
    return data;
  }
}
