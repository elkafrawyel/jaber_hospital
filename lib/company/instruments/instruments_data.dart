import 'dart:developer';

import 'package:flutter/material.dart';

import '../../general/models/instrument_model.dart';
import '../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../models/instruments_response.dart';
import '../resources/CompanyRepository.dart';

class InstrumentsData{
  InstrumentsData._();
  static final InstrumentsData _instance = InstrumentsData._();
  factory InstrumentsData() => _instance;

  late GenericBloc<InstrumentsResponse?> instrumentsCubit;
  late GenericBloc<bool> loadingHome;
  List<InstrumentModel>? receivedOrders = [];


  void init(BuildContext context) {
    this.instrumentsCubit = GenericBloc<InstrumentsResponse?>(null);
    fetchInstruments(context);
  }

  Future<void> fetchInstruments(BuildContext context) async {
    InstrumentsResponse? result = await CompanyRepository(context).getCompInstruments();
    log("instruments=> ${result?.instruments?.length}");
    instrumentsCubit.onUpdateData(result);
  }
}