import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
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
    fetchBookedPatients(context, "booked");
  }

  Future<void> fetchBookedPatients(BuildContext context, String mdtStatus) async {
    MdtPatientsResponse? result = await SurgeonRepository(context).requestMdtReadyPatients(mdtStatus);
    log("bookedPatients=> ${result?.patients?.length}");
    bookedCubit.onUpdateData(result);
  }
}