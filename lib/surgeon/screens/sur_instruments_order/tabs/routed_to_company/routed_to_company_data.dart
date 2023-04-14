import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../models/instrument_order_model.dart';
import '../../../../models/instrument_orders_response.dart';
import '../../../../models/medications_orders_model.dart';
import '../../../../resources/SurgeonRepoImports.dart';

class RoutedToCompanyData{
  RoutedToCompanyData._();
  static final RoutedToCompanyData _instance = RoutedToCompanyData._();
  factory RoutedToCompanyData() => _instance;

  late GenericBloc<List<InstrumentOrderModel>?> routedCompanyCubit;
  List<InstrumentOrderModel>? routedCompanyInstruments = [];

  void init(BuildContext context) async{
    this.routedCompanyCubit = GenericBloc<List<InstrumentOrderModel>?>(null);
    await fetchRoutedCompanyInstruments(context);
  }

  Future<void> fetchRoutedCompanyInstruments(BuildContext context) async {
    InstrumentOrdersResponse? result = await SurgeonRepository(context).getInstrumentsRoutedOrders();
    log("patients=> ${result.data?.length}");
    routedCompanyInstruments = result.data??[];
    routedCompanyCubit.onUpdateData(routedCompanyInstruments);
  }
}