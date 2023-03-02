import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../general/blocks/user_cubit/user_cubit.dart';
import '../../general/models/UserModel.dart';
import '../../general/utilities/http/dio/http/GenericHttp.dart';
import '../../general/utilities/utils_functions/ApiNames.dart';
import '../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../general/utilities/utils_functions/UtilsImports.dart';
import '../models/appointments_response.dart';
import '../models/notifications_response.dart';
import '../models/update_consent_response.dart';


class PatientHttpMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  PatientHttpMethods(this.context);

  Future<bool> updatePatientProfile(Map<String, dynamic> body) async {
    body.removeWhere((key, value) => value == null);
    LoadingDialog.showLoadingDialog();
    dynamic data = await GenericHttp<bool>(context).callApi(
      name: ApiNames.updateCompProfile,
      returnType: ReturnType.Type,
      methodType: MethodType.Put,
      returnDataFun: (data) => data["data"],
      jsonBody: body,
      showLoader: false,
    );
    EasyLoading.dismiss();
    if (data != null) {
      UserModel user = context.read<UserCubit>().state.model;
      user.userData?[0].compNameAr = data["company_name_ar"];
      user.userData?[0].compNameEn = data["company_name_en"];
      user.userData?[0].email = data["email"];
      user.userData?[0].compAddress = data["company_address"];
      user.userData?[0].compContactPerson = data["company_contact_person"];
      user.userData?[0].compContactMobile = data["company_contact_mobile"];
      user.userData?[0].compLandLine = data["land_line"];
      user.userData?[0].image = data["image"];
      await Utils.saveUserData(user);
      context.read<UserCubit>().onUpdateUserData(user);
      return true;
    } else {
      return false;
    }
  }

  Future<AppointmentsResponse?> fetchComingPatientAppointments() async {
    final data = await GenericHttp<AppointmentsResponse>(context).callApi(
      name: ApiNames.comingAppointmentsPath,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => AppointmentsResponse.fromJson(json),
    );
    return data;
  }

  Future<AppointmentsResponse?> fetchPastPatientAppointments() async {
    final data = await GenericHttp<AppointmentsResponse>(context).callApi(
      name: ApiNames.pastAppointmentsPath,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => AppointmentsResponse.fromJson(json),
    );
    return data;
  }

  Future<UpdateConsentResponse?> updateConsent() async {
    log('fetchInstruments called...');
    Map<String, dynamic> body = {
      "consent": false
    };
    final data = await GenericHttp<UpdateConsentResponse>(context).callApi(
      name: ApiNames.patientConsentPath,
      returnType: ReturnType.Model,
      methodType: MethodType.Put,
      jsonBody: body,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => UpdateConsentResponse.fromJson(json),
    );
    return data;
  }

  Future<NotificationsResponse?> fetchPatientNotifications() async {
    final data = await GenericHttp<NotificationsResponse>(context).callApi(
      name: ApiNames.patientNotificationPath,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => NotificationsResponse.fromJson(json),
    );
    return data;
  }
}
