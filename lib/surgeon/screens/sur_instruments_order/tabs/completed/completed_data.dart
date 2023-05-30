import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../models/instrument_order_model.dart';
import '../../../../models/instrument_orders_response.dart';
import '../../../../models/medications_orders_model.dart';
import '../../../../resources/SurgeonRepoImports.dart';

class CompletedData{
  CompletedData._();
  static final CompletedData _instance = CompletedData._();
  factory CompletedData() => _instance;

  late GenericBloc<List<InstrumentOrderModel>?> completedCubit;
  List<InstrumentOrderModel>? completedInstruments = [];

  void init(BuildContext context) async{
    this.completedCubit = GenericBloc<List<InstrumentOrderModel>?>(null);
    await fetchCompletedInstruments(context);
  }

  Future<void> fetchCompletedInstruments(BuildContext context) async {
    InstrumentOrdersResponse? result = await SurgeonRepository(context).getInstrumentsCompletedOrders();
    completedInstruments = result.data??[];
    completedCubit.onUpdateData(completedInstruments);
  }
}