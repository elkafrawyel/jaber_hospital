import 'dart:developer';

import '../../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../models/apointments_response.dart';
import '../../../../models/appointment_model.dart';
import 'package:flutter/material.dart';
import '../../../../resources/SurgeonRepoImports.dart';

class PastAppointmentsData{
  PastAppointmentsData._();
  static final PastAppointmentsData _instance = PastAppointmentsData._();
  factory PastAppointmentsData() => _instance;

  late GenericBloc<List<AppointmentModel>?> pastCubit;
  List<AppointmentModel>? pastAppointments = [];

  void init(BuildContext context) {
    this.pastCubit = GenericBloc<List<AppointmentModel>?>([]);
    fetchUpcomingAppointments(context);
  }

  Future<void> fetchUpcomingAppointments(BuildContext context) async {
    AppointmentsResponse? result = await SurgeonRepository(context).fetchSurAppointments(false);
    log("patients=> ${result?.data?.length}");
    pastAppointments = result?.data??[];
    pastCubit.onUpdateData(pastAppointments);
  }
}