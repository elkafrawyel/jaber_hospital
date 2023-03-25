import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../../patient/models/update_consent_response.dart';
import '../../../../models/mdt_patients_response.dart';
import '../../../../resources/SurgeonRepoImports.dart';

class BookedMdtData{
  BookedMdtData._();
  static final BookedMdtData _instance = BookedMdtData._();
  factory BookedMdtData() => _instance;

  late GenericBloc<MdtPatientsResponse?> bookedCubit;
  late GenericBloc<bool> loadingHome;

  void init(BuildContext context) {
    this.bookedCubit = GenericBloc<MdtPatientsResponse?>(null);
    // fetchBookedPatients(context, "booked");
  }

  Future<void> confirmBooking(BuildContext context, Map<String, dynamic> body) async {
    UpdateConsentResponse? result = await SurgeonRepository(context).confirmMdtBooking(body);

  }
}