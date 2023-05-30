import 'dart:developer';

import 'package:base_flutter/company/resources/CompanyRepository.dart';
import 'package:flutter/material.dart';

import '../../../../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../../patient/models/update_consent_response.dart';
import '../../../../models/mdt_patient_model.dart';
import '../../../../models/mdt_patients_response.dart';
import '../../../../resources/SurgeonRepoImports.dart';


class ReadyMdtData{
  ReadyMdtData._();
  static final ReadyMdtData _instance = ReadyMdtData._();
  factory ReadyMdtData() => _instance;

  late GenericBloc<List<MdtPatientModel>?> readyCubit;
  late GenericBloc<bool> loadingHome;
  List<MdtPatientModel>? readyPatients = [];


  void init(BuildContext context) {
    readyCubit = GenericBloc<List<MdtPatientModel>?>(null);
    fetchReadyPatients(context, "ready");
  }

  Future<void> fetchReadyPatients(BuildContext context, String mdtStatus) async {
    MdtPatientsResponse? result = await SurgeonRepository(context).fetchMdtReadyPatients();
    log("patients=> ${result?.patients?.length}");
    readyPatients = result?.patients??[];
    readyCubit.onUpdateData(readyPatients);
  }

  Future<void> updateReadyMdtStatus(BuildContext context, String mdtStatus,String patientId) async {
    Map<String, dynamic> body = {
      "mdt_status":"booked",
      "patient_id": patientId,
    };
    log("updateReadyBody=> $body");
    UpdateConsentResponse? result = await SurgeonRepository(context).updateReadyMdtStatus(body);
    if(result?.success??false){
      // readyPatients?.removeAt(index);
      readyCubit.onUpdateData(readyPatients);
    }else{
      CustomToast.showToastNotification(result?.message?.messageEn??"");
    }
  }
}