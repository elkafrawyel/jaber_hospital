import 'dart:developer';

import 'package:base_flutter/company/resources/CompanyRepository.dart';
import 'package:flutter/material.dart';

import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../models/order_model.dart';
import '../../../models/orders_response.dart';

class InProgressOrdersData{
  InProgressOrdersData._();
  static final InProgressOrdersData _instance = InProgressOrdersData._();
  factory InProgressOrdersData() => _instance;

  late GenericBloc<OrdersResponse?> inProgressOrdersCubit;
  late GenericBloc<bool> loadingHome;
  List<OrderModel>? inProgressOrders = [];


  void init(BuildContext context) {
    this.inProgressOrdersCubit = GenericBloc<OrdersResponse?>(null);
    fetchCompInProgressOrders(context);
  }

  Future<void> fetchCompInProgressOrders(BuildContext context) async {
    inProgressOrders= [];
    OrdersResponse? result = await CompanyRepository(context).getCompInstrumentsOrders();
    result?.orders?.forEach((element) {
    if(element.orderStatus == "inprogress"){
        inProgressOrders?.add(element);
      }
    });
    log("orders=> ${result?.orders?.length}");
    log("inProgressOrders=> ${inProgressOrders?.length}");
    inProgressOrdersCubit.onUpdateData(result);
  }
}