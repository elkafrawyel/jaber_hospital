import 'dart:developer';

import 'package:flutter/material.dart';

import '../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../general/models/notification_model.dart';
import '../models/notifications_response.dart';
import '../resources/PatientRepository.dart';

class PatientNotificationsData{
  PatientNotificationsData._();
  static final PatientNotificationsData _instance = PatientNotificationsData._();
  factory PatientNotificationsData() => _instance;

  late GenericBloc<NotificationsResponse?> notificationsCubit;
  late GenericBloc<bool> loadingHome;
  List<NotificationModel>? notificationsList = [];


  void init(BuildContext context) {
    this.notificationsCubit = GenericBloc<NotificationsResponse?>(null);
    fetchPatientNotifications(context);
  }

  Future<void> fetchPatientNotifications(BuildContext context) async {
    NotificationsResponse? result = await PatientRepository(context).getPatientNotifications();
    log("notifications=> ${result?.notifications?.length}");
    notificationsCubit.onUpdateData(result);
  }
}