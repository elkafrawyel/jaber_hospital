import 'dart:developer';

import 'package:base_flutter/company/resources/CompanyRepository.dart';
import 'package:flutter/material.dart';

import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../models/order_model.dart';
import '../../../models/orders_response.dart';


class CompletedOrdersData{
  CompletedOrdersData._();
  static final CompletedOrdersData _instance = CompletedOrdersData._();
  factory CompletedOrdersData() => _instance;

  late GenericBloc<OrdersResponse?> completedOrdersCubit;
  late GenericBloc<bool> loadingHome;
  List<OrderModel>? completedOrders = [];


  void init(BuildContext context) {
    this.completedOrdersCubit = GenericBloc<OrdersResponse?>(null);
    fetchCompCompletedOrders(context);
  }

  Future<void> fetchCompCompletedOrders(BuildContext context) async {
    completedOrders = [];
    OrdersResponse? result = await CompanyRepository(context).getCompInstrumentsOrders();
    result?.orders?.forEach((element) {
      if(element.orderStatus == "completed"){
        completedOrders?.add(element);
      }
    });
    log("orders=> ${result?.orders?.length}");
    log("completedOrders=> ${completedOrders?.length}");
    completedOrdersCubit.onUpdateData(result);
  }
}