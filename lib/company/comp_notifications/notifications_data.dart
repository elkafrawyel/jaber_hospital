import 'dart:developer';

import 'package:flutter/material.dart';

import '../../general/models/instrument_model.dart';
import '../../general/models/notification_model.dart';
import '../../general/models/notifications_response.dart';
import '../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../models/instruments_response.dart';
import '../resources/CompanyRepository.dart';

class NotificationsData{
  NotificationsData._();
  static final NotificationsData _instance = NotificationsData._();
  factory NotificationsData() => _instance;

  late GenericBloc<NotificationsResponse?> notificationsCubit;
  late GenericBloc<bool> loadingHome;
  List<NotificationModel>? notificationsList = [];


  void init(BuildContext context) {
    this.notificationsCubit = GenericBloc<NotificationsResponse?>(null);
    fetchCompNotifications(context);
  }

  Future<void> fetchCompNotifications(BuildContext context) async {
    NotificationsResponse? result = await CompanyRepository(context).getCompNotifications();
    log("instruments=> ${result?.notifications?.length}");
    notificationsList = result?.notifications??[];
    notificationsCubit.onUpdateData(result);
  }
}