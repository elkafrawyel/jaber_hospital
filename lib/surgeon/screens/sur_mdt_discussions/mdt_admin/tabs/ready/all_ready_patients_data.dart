import 'dart:developer';

import '../../../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../../models/mdt_patient_model.dart';
import 'package:flutter/material.dart';

import '../../../../../models/mdt_patients_response.dart';
import '../../../../../resources/SurgeonRepoImports.dart';

class AllReadyPatientsData{
  AllReadyPatientsData._();
  static final AllReadyPatientsData _instance = AllReadyPatientsData._();
  factory AllReadyPatientsData() => _instance;

  late GenericBloc<List<MdtPatientModel>?> mdtAdminCubit;
  late GenericBloc<bool> loadingHome;
  List<MdtPatientModel>? readyPatients = [];

  void init(BuildContext context) {
    this.mdtAdminCubit = GenericBloc<List<MdtPatientModel>?>(null);
    fetchMdtReadyPatients(context);
  }

  Future<void> fetchMdtReadyPatients(BuildContext context) async {
    MdtPatientsResponse? result = await SurgeonRepository(context).requestMdtAdminPatients();
    log("AdminPatients=> ${result?.patients?.length}");
    readyPatients = result?.patients??[];
    mdtAdminCubit.onUpdateData(readyPatients);
  }
}