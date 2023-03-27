import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../../../patient/models/update_consent_response.dart';
import '../../../models/mdt_patient_model.dart';
import '../../../models/mdt_patients_response.dart';
import '../../../resources/SurgeonRepoImports.dart';


class MdtAdminData{
  MdtAdminData._();
  static final MdtAdminData _instance = MdtAdminData._();
  factory MdtAdminData() => _instance;

  late GenericBloc<List<MdtPatientModel>?> mdtAdminCubit;
  late GenericBloc<bool> loadingHome;
  List<MdtPatientModel>? todayPatients = [];

  void init(BuildContext context) {
    this.mdtAdminCubit = GenericBloc<List<MdtPatientModel>?>(null);
    fetchMdtAdminPatients(context);
  }

  Future<void> fetchMdtAdminPatients(BuildContext context) async {
    MdtPatientsResponse? result = await SurgeonRepository(context).requestMdtAdminPatients();
    log("AdminPatients=> ${result?.patients?.length}");
    todayPatients = result?.patients??[];
    mdtAdminCubit.onUpdateData(todayPatients);
  }

  Future<void> sentMdtPatientRes(BuildContext context, Map<String, dynamic> body, int index) async {
    UpdateConsentResponse? result = await SurgeonRepository(context).mdtPatientResult(body);
    log("MdtPatientResult=> ${result.toString()}");
    if(result?.success??false){
      todayPatients?.removeAt(index);
      mdtAdminCubit.onUpdateData(todayPatients);
    }else{
      CustomToast.showToastNotification(result?.message?.messageEn??"");
    }
  }
}