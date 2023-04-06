import 'dart:developer';

import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import 'package:flutter/material.dart';

import '../../../models/companies_response.dart';
import '../../../models/company_instruments_response.dart';
import '../../../models/medication_model.dart';
import '../../../resources/SurgeonRepoImports.dart';


class RequestInstrumentsData{
  RequestInstrumentsData._();
  static final RequestInstrumentsData _instance = RequestInstrumentsData._();
  factory RequestInstrumentsData() => _instance;

  late GenericBloc<List<CompanyId>?> companiesCubit;
  late GenericBloc<CompanyInstrumentsResponse?> companyInstrumentsCubit;
  List<CompanyId> companies = [];
  late TextEditingController nameController;
  late TextEditingController mobileController;
  String? selectedDate;
  CompanyId? selectedCompany;

  void init(BuildContext context) {
    this.companiesCubit = GenericBloc<List<CompanyId>?>([]);
    this.companyInstrumentsCubit = GenericBloc<CompanyInstrumentsResponse?>(null);
    fetchCompanies(context);
  }

  Future<void> fetchCompanies(BuildContext context) async {
    companies = [];
    CompaniesResponse? result = await SurgeonRepository(context).fetchCompanies();
    log("companies=> ${companies.length}");
    companies = result?.companies??[];
    companiesCubit.onUpdateData(companies);
  }

  Future<void> fetchCompanyInstruments(BuildContext context, String companyId) async {
    CompanyInstrumentsResponse? result = await SurgeonRepository(context).fetchCompanyInstruments(companyId);
    log("companies=> ${companies.length}");
    companyInstrumentsCubit.onUpdateData(result);
  }
}