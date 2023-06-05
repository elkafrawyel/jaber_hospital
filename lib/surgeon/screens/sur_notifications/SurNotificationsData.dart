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
      {OrderData? orderData}) async {
    Map<String, dynamic> body = {
      "status": true,
      "notifcation_company_en": "New order number ${orderData?.orderNum} has been created for you by Doctor ",
      "notifcation_patient_ar": "",
      "notifcation_doctor_en": "Your order has been created successfully",
      "company_id": orderData?.companyId??"",
      "patient_id": orderData?.patientId??"",
      "doctor_id": orderData?.doctorId??"",
      "order_id": orderData?.sId??"",
      "created_date": DateTime.now().toIso8601String(),
      "is_read": false,
    };
    UpdateConsentResponse data = await GenericHttp<UpdateConsentResponse>(context).callApi(
      name: ApiNames.createNotification,
      returnType: ReturnType.Model,
      methodType: MethodType.Post,
      jsonBody: body,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => UpdateConsentResponse.fromJson(json),
    );
    if (data.success ?? false) {
      CustomToast.showSimpleToast(msg: data.message?.messageEn ?? "");
    } else {
      CustomToast.showSimpleToast(msg: data.message?.messageEn ?? "");
    }
  }
}