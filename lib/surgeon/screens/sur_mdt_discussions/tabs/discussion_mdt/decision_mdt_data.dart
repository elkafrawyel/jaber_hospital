import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../models/mdt_patients_response.dart';
import '../../../../resources/SurgeonRepoImports.dart';

class DecisionMdtData{
  DecisionMdtData._();
  static final DecisionMdtData _instance = DecisionMdtData._();
  factory DecisionMdtData() => _instance;

  late GenericBloc<MdtPatientsResponse?> decisionCubit;
  late GenericBloc<bool> loadingHome;

  void init(BuildContext context) {
    this.decisionCubit = GenericBloc<MdtPatientsResponse?>(null);
    fetchDecisionPatients(context, "decision");
  }

  Future<void> fetchDecisionPatients(BuildContext context, String mdtStatus) async {
    MdtPatientsResponse? result = await SurgeonRepository(context).requestMdtPatientsByStatus(mdtStatus);
    log("decisionPatients=> ${result?.patients?.length}");
    decisionCubit.onUpdateData(result);
  }
}