import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../patient/models/update_consent_response.dart';
import '../../../models/mdt_patients_response.dart';
import '../../../resources/SurgeonRepoImports.dart';


class MdtAdminData{
  MdtAdminData._();
  static final MdtAdminData _instance = MdtAdminData._();
  factory MdtAdminData() => _instance;

  late GenericBloc<MdtPatientsResponse?> mdtAdminCubit;
  late GenericBloc<bool> loadingHome;

  void init(BuildContext context) {
    this.mdtAdminCubit = GenericBloc<MdtPatientsResponse?>(null);
    fetchMdtAdminPatients(context);
  }

  Future<void> fetchMdtAdminPatients(BuildContext context) async {
    MdtPatientsResponse? result = await SurgeonRepository(context).requestMdtAdminPatients();
    log("AdminPatients=> ${result?.patients?.length}");
    mdtAdminCubit.onUpdateData(result);
  }

  Future<void> sentMdtPatientRes(BuildContext context, Map<String, dynamic> body) async {
    UpdateConsentResponse? result = await SurgeonRepository(context).mdtPatientResult(body);
    log("MdtPatientResult=> ${result.toString()}");
    // mdtAdminCubit.onUpdateData(result);
  }
}