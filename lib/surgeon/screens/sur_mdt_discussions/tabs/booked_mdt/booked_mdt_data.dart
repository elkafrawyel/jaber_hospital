import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../../patient/models/update_consent_response.dart';
import '../../../../models/mdt_patient_model.dart';
import '../../../../models/mdt_patients_response.dart';
import '../../../../resources/SurgeonRepoImports.dart';

class BookedMdtData {
  BookedMdtData._();

  static final BookedMdtData _instance = BookedMdtData._();

  factory BookedMdtData() => _instance;

  late GenericBloc<List<MdtPatientModel>?> bookedCubit;
  late GenericBloc<bool> loadingHome;
  List<MdtPatientModel>? bookedPatients = [];

  void init(BuildContext context) {
    this.bookedCubit = GenericBloc<List<MdtPatientModel>?>(null);
    fetchBookedPatients(context, "booked");
  }

  Future<void> fetchBookedPatients(BuildContext context, String mdtStatus) async {
    MdtPatientsResponse? result = await SurgeonRepository(context).requestMdtPatientsByStatus(mdtStatus);
    log("patients=> ${result?.patients?.length}");
    bookedPatients = result?.patients ?? [];
    bookedCubit.onUpdateData(bookedPatients);
  }
  //
  // Future<void> confirmBooking(BuildContext context, Map<String, dynamic> body, int index, String patientId) async {
  //   UpdateConsentResponse? result = await SurgeonRepository(context).confirmMdtBooking(body, patientId);
  //   if (result?.success ?? false) {
  //     bookedPatients?.removeAt(index);
  //     bookedCubit.onUpdateData(bookedPatients);
  //   } else {
  //     CustomToast.showToastNotification(result?.message?.messageEn ?? "");
  //   }
  // }
}
