import 'dart:developer';

import 'package:base_flutter/company/resources/CompanyRepository.dart';
import 'package:flutter/material.dart';

import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../models/order_model.dart';
import '../../../models/orders_response.dart';


class ReceivedOrdersData{
  ReceivedOrdersData._();
  static final ReceivedOrdersData _instance = ReceivedOrdersData._();
  factory ReceivedOrdersData() => _instance;

  late GenericBloc<OrdersResponse?> ordersCubit;
  late GenericBloc<bool> loadingHome;
  List<OrderModel>? receivedOrders = [];


  void init(BuildContext context) {
    this.ordersCubit = GenericBloc<OrdersResponse?>(null);
    fetchCompMedicationOrders(context);
  }

  Future<void> fetchCompMedicationOrders(BuildContext context) async {
    receivedOrders = [];
    OrdersResponse? result = await CompanyRepository(context).getCompMedicationOrders();
    result?.orders?.forEach((element) {
      if(element.orderStatus == "routed to company"){
        receivedOrders?.add(element);
      }
    });
    log("orders=> ${result?.orders?.length}");
    log("receivedOrders=> ${receivedOrders?.length}");
    ordersCubit.onUpdateData(result);
  }
}