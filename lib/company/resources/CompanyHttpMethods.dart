import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../general/blocks/user_cubit/user_cubit.dart';
import '../../general/models/UserModel.dart';
import '../../general/models/notifications_response.dart';
import '../../general/utilities/http/dio/http/GenericHttp.dart';
import '../../general/utilities/utils_functions/ApiNames.dart';
import '../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../general/utilities/utils_functions/UtilsImports.dart';
import '../models/comp_home_orders_response.dart';
import '../models/instruments_response.dart';
import '../models/orders_response.dart';

class CompanyHttpMethods {
  final BuildContext context;

  CompanyHttpMethods(this.context);

  Future<CompOrdersResponse?> fetchCompHomeOrders() async {
     final data = await GenericHttp<CompOrdersResponse>(context).callApi(
      name: ApiNames.companyHomeOrders,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => CompOrdersResponse.fromJson(json),
    );
    log("data=> ${data?.toJson()}");
     return data;
  }

  Future<bool> updateCompanyProfile(Map<String, dynamic> body) async {
    body.removeWhere((key, value) => value == null);
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

  Future<OrdersResponse?> fetchCompInstrumentsRoutedOrders() async {
    log('fetchCompOrders called...');
    final data = await GenericHttp<OrdersResponse>(context).callApi(
      name: ApiNames.instrumentsRoutedOrdersPath,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => OrdersResponse.fromJson(json),
    );
    return data;
  }

  Future<OrdersResponse?> fetchCompInstrumentsInProgressOrders() async {
    log('fetchCompOrders called...');
    final data = await GenericHttp<OrdersResponse>(context).callApi(
      name: ApiNames.instrumentsProgressOrdersPath,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => OrdersResponse.fromJson(json),
    );
    return data;
  }

  Future<OrdersResponse?> fetchCompInstrumentsCompletedOrders() async {
    log('fetchCompOrders called...');
    final data = await GenericHttp<OrdersResponse>(context).callApi(
      name: ApiNames.instrumentsCompletedOrdersPath,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => OrdersResponse.fromJson(json),
    );
    return data;
  }

  Future<OrdersResponse?> fetchCompMedicationOrders() async {
    log('fetchCompOrders called...');
    UserModel user = context.read<UserCubit>().state.model;
    final data = await GenericHttp<OrdersResponse>(context).callApi(
      name: "${ApiNames.compMedicationOrders}?user_id=${user.userData?[0].sId}",
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => OrdersResponse.fromJson(json),
    );
    return data;
  }

  Future<InstrumentsResponse?> fetchCompInstruments() async {
    log('fetchInstruments called...');
    final data = await GenericHttp<InstrumentsResponse>(context).callApi(
      name: ApiNames.compInstrument,
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => InstrumentsResponse.fromJson(json),
    );
    return data;
  }

  Future<NotificationsResponse?> fetchCompNotifications() async {
    log('fetchNotifications called...');
    UserModel user = context.read<UserCubit>().state.model;
    final data = await GenericHttp<NotificationsResponse>(context).callApi(
      name: "${ApiNames.compNotifications}?company_id=${user.userData?[0].sId}",
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => NotificationsResponse.fromJson(json),
    );
    return data;
  }

}
