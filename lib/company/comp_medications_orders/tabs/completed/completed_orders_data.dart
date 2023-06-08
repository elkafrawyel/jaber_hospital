import 'dart:developer';

import 'package:base_flutter/company/resources/CompanyRepository.dart';
import 'package:flutter/material.dart';

import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../models/comp_home_orders_response.dart';
import '../../../models/order_model.dart';
import '../../../models/orders_response.dart';


class CompletedOrdersData{
  CompletedOrdersData._();
  static final CompletedOrdersData _instance = CompletedOrdersData._();
  factory CompletedOrdersData() => _instance;

  late GenericBloc<List<OrderModel>?> completedOrdersCubit;
  late GenericBloc<bool> loadingHome;
  List<OrderModel> completedOrders = [];


  void init(BuildContext context) {
    this.completedOrdersCubit = GenericBloc<List<OrderModel>?>([]);
    fetchCompCompletedOrders(context);
  }

  Future<void> fetchCompCompletedOrders(BuildContext context) async {
    completedOrders = [];
    OrdersResponse? result = await  CompanyRepository(context).getCompMedicationOrders();
    List<OrderModel>? orders = result?.orders??[];
    orders.forEach((order) {
      if(order.orderStatus=="completed"){
        completedOrders.add(order);
      }
    });
    log("completedOrders=> ${completedOrders.length}");
    completedOrdersCubit.onUpdateData(completedOrders);
  }
}