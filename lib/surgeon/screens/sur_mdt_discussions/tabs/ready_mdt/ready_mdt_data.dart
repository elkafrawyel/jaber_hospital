import 'dart:developer';

import 'package:base_flutter/company/resources/CompanyRepository.dart';
import 'package:flutter/material.dart';

import '../../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../models/mdt_patient_model.dart';
import '../../../../models/mdt_patients_response.dart';
import '../../../../resources/SurgeonRepoImports.dart';


class ReadyMdtData{
  ReadyMdtData._();
  static final ReadyMdtData _instance = ReadyMdtData._();
  factory ReadyMdtData() => _instance;

  late GenericBloc<MdtPatientsResponse?> readyCubit;
  late GenericBloc<bool> loadingHome;
  List<MdtPatientModel>? readyPatients = [];


  void init(BuildContext context) {
    readyCubit = GenericBloc<MdtPatientsResponse?>(null);
    fetchReadyPatients(context, "ready");
  }

  Future<void> fetchReadyPatients(BuildContext context, String mdtStatus) async {
    MdtPatientsResponse? result = await SurgeonRepository(context).requestMdtReadyPatients(mdtStatus);
    log("patients=> ${result?.patients?.length}");
    readyCubit.onUpdateData(result);
  }

  Future<void> confirmMdtBooking(BuildContext context, String mdtStatus) async {
    Map<String, dynamic> body = {
      "":"",
    };
    MdtPatientsResponse? result = await SurgeonRepository(context).requestMdtReadyPatients(mdtStatus);
    log("patients=> ${result?.patients?.length}");
    readyCubit.onUpdateData(result);
  }
}