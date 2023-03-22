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
}