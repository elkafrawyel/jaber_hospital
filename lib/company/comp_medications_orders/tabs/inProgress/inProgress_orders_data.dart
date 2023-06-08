import 'dart:developer';

import 'package:base_flutter/company/resources/CompanyRepository.dart';
import 'package:flutter/material.dart';

import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../models/comp_home_orders_response.dart';
import '../../../models/order_model.dart';
import '../../../models/orders_response.dart';

class InProgressOrdersData{
  InProgressOrdersData._();
  static final InProgressOrdersData _instance = InProgressOrdersData._();
  factory InProgressOrdersData() => _instance;

  late GenericBloc<List<OrderModel>?> inProgressOrdersCubit;
  late GenericBloc<bool> loadingHome;
  List<OrderModel> inProgressOrders = [];


  void init(BuildContext context) {
    this.inProgressOrdersCubit = GenericBloc<List<OrderModel>?>([]);
    fetchCompInProgressOrders(context);
  }

  Future<void> fetchCompInProgressOrders(BuildContext context) async {
    inProgressOrders= [];
    OrdersResponse? result = await  CompanyRepository(context).getCompMedicationOrders();
    List<OrderModel>? orders = result?.orders??[];
    orders.forEach((order) {
      if(order.orderStatus=="inprogress"){
        inProgressOrders.add(order);
      }
    });
    log("inProgressOrders=> ${inProgressOrders.length}");
    inProgressOrdersCubit.onUpdateData(inProgressOrders);
  }
}