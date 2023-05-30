import 'dart:developer';

import 'package:base_flutter/company/models/comp_home_orders_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../general/utilities/http/dio/http/GenericHttp.dart';
import '../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../general/utilities/utils_functions/ApiNames.dart';
import '../resources/CompanyRepository.dart';

class CompHomeData{
  CompHomeData._();
  static final CompHomeData _instance = CompHomeData._();
  factory CompHomeData() => _instance;

  late TextEditingController search;
  late GenericBloc<CompOrdersResponse?> homeCubit;
  late GenericBloc<bool> loadingHome;



  void init(BuildContext context) {
    this.search = TextEditingController();
    // this.loadingHome = GenericBloc<bool>(false);
    this.homeCubit = GenericBloc<CompOrdersResponse?>(null);
    fetchCompanyOrders(context);
  }

  Future<void> fetchCompanyOrders(BuildContext context) async {
    CompOrdersResponse? result = await  CompanyRepository(context).getCompHomeOrders();
    log("inProgress=> ${result?.data?.companyOrdersInProgress?.length}");
    log("Completed=> ${result?.data?.companyOrdersCompleted?.length}");
    homeCubit.onUpdateData(result);
  }
}