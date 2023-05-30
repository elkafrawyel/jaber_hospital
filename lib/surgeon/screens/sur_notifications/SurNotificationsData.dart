part of 'SurNotificationsImports.dart';


class SurNotificationsData {

  static SurNotificationsData _instance = SurNotificationsData._();
  SurNotificationsData._();
  factory SurNotificationsData() => _instance;

  late GenericBloc<NotificationsResponse?> notificationsCubit;
  late GenericBloc<bool> loadingHome;
  List<NotificationModel>? notificationsList = [];


  void init(BuildContext context) {
    this.notificationsCubit = GenericBloc<NotificationsResponse?>(null);
    fetchCompNotifications(context);
  }

  Future<void> fetchCompNotifications(BuildContext context) async {
    NotificationsResponse? result = await SurgeonRepository(context).getSurgeonNotifications();
    log("instruments=> ${result?.notifications?.length}");
    notificationsList = result?.notifications??[];
    notificationsCubit.onUpdateData(result);
  }

  Future<void> createNotification(BuildContext context,
      {String? notificationTitle,
      String? notificationMsg,
      String? patientId,
      String? doctorId,
      String? orderId}) async {
    UserModel user = context.read<UserCubit>().state.model;
    String userId = user.userData?[0].sId??"";
    Map<String, dynamic> body = {
      "status": true,
      "notifcation_patient_ar": "",
      "notifcation_doctor_en": notificationTitle,
      "patient_id": patientId,
      "doctor_id": doctorId,
      "order_id": orderId,
      "appointment_id": "",
    };
    UpdateConsentResponse data = await GenericHttp<UpdateConsentResponse>(context).callApi(
      name: ApiNames.createNotification,
      returnType: ReturnType.Model,
      methodType: MethodType.Put,
      jsonBody: body,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => UpdateConsentResponse.fromJson(json),
    );
    if (data.success ?? false) {
      CustomToast.showSimpleToast(msg: data.message?.messageAr ?? "");
    } else {
      CustomToast.showSimpleToast(msg: data.message?.messageAr ?? "");
    }
  }
}