import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../general/MyApp.dart';
import '../../../../general/models/company_model.dart';
import '../../../../general/models/instrument_model.dart';
import '../../../../general/network/api_service.dart';
import '../../../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../../../general/utilities/http/dio/utils/DioUtils.dart';
import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../general/utilities/utils_functions/ApiNames.dart';
import '../../../models/comp_instruments_model.dart';
import '../../../models/companies_response.dart';
import '../../../models/company_instruments_response.dart';
import '../../../resources/SurgeonRepoImports.dart';
import '../../sur_notifications/SurNotificationsImports.dart';
import '../models/instruments_order_response.dart';


class RequestInstrumentsData {
  RequestInstrumentsData._();

  static final RequestInstrumentsData _instance = RequestInstrumentsData._();

  factory RequestInstrumentsData() => _instance;

  late GenericBloc<List<CompanyId>?> companiesCubit;
  late GenericBloc<List<CompInstrumentsModel>?> companyInstrumentsCubit;
  // late GenericBloc<CompanyInstrumentsResponse?> companyInstrumentsCubit;
  List<CompanyId> companies = [];
  List<CompInstrumentsModel> compAllInstruments = [];
  List<InstrumentModel> handles = [];
  List<InstrumentModel> reloads = [];
  List<InstrumentModel> endoStitch = [];
  List<InstrumentModel> trocars = [];
  List<InstrumentModel> trsReinForced = [];
  List<InstrumentModel> reinforcement = [];
  List<InstrumentModel> vesselSealing = [];
  late TextEditingController nameController;
  late TextEditingController mobileController;
  String? selectedDate;
  String? selectedHandle;
  CompanyId? selectedCompany;
  List<InstrumentModel> selectedInstrumentsList = [];

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
    this.companyInstrumentsCubit = GenericBloc<List<CompInstrumentsModel>?>([]);
    compAllInstruments = [];
    selectedInstrumentsList = [];
    CompanyInstrumentsResponse? result = await SurgeonRepository(context).fetchCompanyInstruments(companyId);
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
          case "Reinforcement":
            reinforcement.add(element);
            break;
          case "TRS Reinforced":
            trsReinForced.add(element);
            break;
          case "Vessel Sealing":
            vesselSealing.add(element);
            break;
        }
    });
    log("Handles=> ${handles.length}");
    log("Reloads=> ${reloads.length}");
    log("Trocars=> ${trocars.length}");
    log("trsReinForced=> ${trsReinForced.length}");
    log("vesselSealing=> ${vesselSealing.length}");
    log("reinforcement=> ${reinforcement.length}");
    compAllInstruments.add(CompInstrumentsModel(headerTitle: "Handles", instruments: handles));
    compAllInstruments.add(CompInstrumentsModel(headerTitle: "Reloads", instruments: reloads));
    compAllInstruments.add(CompInstrumentsModel(headerTitle: "Trocars", instruments: trocars));
    compAllInstruments.add(CompInstrumentsModel(headerTitle: "Reinforcement", instruments: reinforcement));
    compAllInstruments.add(CompInstrumentsModel(headerTitle: "Vessel Sealing", instruments: vesselSealing));
    log("compAllInstruments==> ${compAllInstruments.length}");
    companyInstrumentsCubit.onUpdateData(compAllInstruments);
  }

  void updateSelectedValues(bool checked, InstrumentModel instrumentModel){
    if(checked){
      selectedInstrumentsList.add(instrumentModel);
    } else{
      selectedInstrumentsList.remove(instrumentModel);
    }
    log("selectedInstrumentsList==> ${selectedInstrumentsList.length}");
  }

  void onChangeCounter({required bool isAdd, required InstrumentModel instrumentModel}) {
    if (isAdd) {
      instrumentModel.quantity = instrumentModel.quantity! + 1;
    } else {
      if (instrumentModel.quantity! > 1) {
        instrumentModel.quantity = instrumentModel.quantity! - 1;
      }
    }
    companyInstrumentsCubit.onUpdateData(compAllInstruments);
  }

  Future<void> requestInstrumentsOrder(BuildContext context, Map<String, dynamic> body) async {
      DioUtils.showLoadingDialog();
      final response = await ApiService.post(ApiNames.requestInstrumentsOrder, body: body,);
      InstrumentsOrderResponse instrumentsOrderResponse = InstrumentsOrderResponse.fromJson(response.data);
      DioUtils.dismissDialog();
      if(instrumentsOrderResponse.code==200){
        log("orderId=> ${instrumentsOrderResponse.orderData?.sId??""}");
        CustomToast.showSnackBar(context, instrumentsOrderResponse.message?.messageEn??"");
        await SurNotificationsData().createNotification(context, notificationTitle: "Instrument Order has been created",
            notificationMsg: "Instrument Order created successfully", orderId: instrumentsOrderResponse.orderData?.sId??"",
          doctorId: instrumentsOrderResponse.orderData?.doctorId??"", patientId: instrumentsOrderResponse.orderData?.patientId??""
        );
        navigationKey.currentState!.pop();
      } else{
        CustomToast.showSnackBar(context, response.data["message"]["message_en"]);
      }
    }
}