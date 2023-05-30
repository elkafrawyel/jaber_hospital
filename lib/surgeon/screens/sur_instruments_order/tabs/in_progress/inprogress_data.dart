import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../models/instrument_order_model.dart';
import '../../../../models/instrument_orders_response.dart';
import '../../../../models/medications_orders_model.dart';
import '../../../../resources/SurgeonRepoImports.dart';

class InProgressData{
  InProgressData._();
  static final InProgressData _instance = InProgressData._();
  factory InProgressData() => _instance;

  late GenericBloc<List<InstrumentOrderModel>?> inProgressCubit;
  List<InstrumentOrderModel>? inProgressInstruments = [];

  void init(BuildContext context) async{
    this.inProgressCubit = GenericBloc<List<InstrumentOrderModel>?>(null);
    await fetchInProgressInstruments(context);
  }

  Future<void> fetchInProgressInstruments(BuildContext context) async {
    InstrumentOrdersResponse? result = await SurgeonRepository(context).getInstrumentsInProgressOrders();
    inProgressInstruments = result.data??[];
    inProgressCubit.onUpdateData(inProgressInstruments);
  }
}