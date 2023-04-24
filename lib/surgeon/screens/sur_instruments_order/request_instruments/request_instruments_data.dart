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
    selectedCompany = null;
    CompaniesResponse? result = await SurgeonRepository(context).fetchCompanies();
    companies = result?.companies ?? [];
    log("companies=> ${companies.length}");
    companiesCubit.onUpdateData(companies);
  }

  Future<void> fetchCompanyInstruments(BuildContext context, String companyId) async {
    this.companyInstrumentsCubit = GenericBloc<CompanyInstrumentsResponse?>(null);
    CompanyInstrumentsResponse? result = await SurgeonRepository(context)
        .fetchCompanyInstruments(companyId);
    List<InstrumentModel> compInstruments = result?.data??[];
    log("compInstruments=> ${compInstruments.length}");
    compInstruments.forEach((element) {
      log("Code=> ${element.code}");
        switch (element.code?.trim()) {
          case "Handles":
            log("Handles item...");
            handles.add(element);
            break;
          case "Reloads":
            reloads.add(element);
            break;
          case "Trocars":
            trocars.add(element);
            break;
          case "TRS Reinforced":
            trsReinForced.add(element);
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