import 'dart:developer';

import 'package:base_flutter/company/resources/CompanyRepository.dart';
import 'package:flutter/material.dart';

import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../models/comp_home_orders_response.dart';
import '../../../models/order_model.dart';
import '../../../models/orders_response.dart';


class ReceivedOrdersData{
  ReceivedOrdersData._();
  static final ReceivedOrdersData _instance = ReceivedOrdersData._();
  factory ReceivedOrdersData() => _instance;

  late GenericBloc<List<OrderModel>?> ordersCubit;
  late GenericBloc<bool> loadingHome;
  List<OrderModel>? receivedOrders = [];


  void init(BuildContext context) {
    this.ordersCubit = GenericBloc<List<OrderModel>?>([]);
    fetchCompMedicationOrders(context);
  }

  Future<void> fetchCompMedicationOrders(BuildContext context) async {
    receivedOrders = [];
    CompOrdersResponse? result = await  CompanyRepository(context).getCompHomeOrders();
    receivedOrders = result?.data?.routedToCompanyOrders??[];
    log("receivedOrders=> ${receivedOrders?.length}");
    ordersCubit.onUpdateData(receivedOrders);
  }
}