import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../general/models/company_model.dart';
import '../../../../general/models/instrument_model.dart';
import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../models/companies_response.dart';
import '../../../models/company_instruments_response.dart';
import '../../../resources/SurgeonRepoImports.dart';


class RequestInstrumentsData {
  RequestInstrumentsData._();

  static final RequestInstrumentsData _instance = RequestInstrumentsData._();

  factory RequestInstrumentsData() => _instance;

  late GenericBloc<List<CompanyId>?> companiesCubit;
  late GenericBloc<CompanyInstrumentsResponse?> companyInstrumentsCubit;
  List<CompanyId> companies = [];
  List<InstrumentModel> handles = [];
  List<InstrumentModel> reloads = [];
  List<InstrumentModel> endoStitch = [];
  List<InstrumentModel> trocars = [];
  List<InstrumentModel> trsReinForced = [];
  late TextEditingController nameController;
  late TextEditingController mobileController;
  String? selectedDate;
  String? selectedHandle;
  CompanyId? selectedCompany;

  void init(BuildContext context) {
    this.companiesCubit = GenericBloc<List<CompanyId>?>([]);
    fetchCompanies(context);
  }

  Future<void> fetchCompanies(BuildContext context) async {
    companies = [];
    CompaniesResponse? result = await SurgeonRepository(context).fetchCompanies();
    log("companies=> ${companies.length}");
    companies = result?.companies ?? [];
    companiesCubit.onUpdateData(companies);
  }

  Future<void> fetchCompanyInstruments(BuildContext context, String companyId) async {
    this.companyInstrumentsCubit = GenericBloc<CompanyInstrumentsResponse?>(null);
    CompanyInstrumentsResponse? result = await SurgeonRepository(context)
        .fetchCompanyInstruments(companyId);
    log("Instruments=> ${result?.data}");
    log("Instruments=> ${result?.data?.length}");
    result?.data?.map((item) {
      switch (item.code) {
        case "Handles":
          handles.add(item);
          break;
        case "Reloads":
          reloads.add(item);
          break;
        case "Trocars":
          trocars.add(item);
          break;
        case "TRS Reinforced":
          trsReinForced.add(item);
          break;
      }
    });
    log("Handles=> ${handles.length}");
    log("Reloads=> ${reloads.length}");
    log("Trocars=> ${trocars.length}");
    log("trsReinForced=> ${trsReinForced.length}");
    companyInstrumentsCubit.onUpdateData(result);
  }
}