import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../models/appointments_response.dart';
import '../../../models/patient_appointment_model.dart';
import '../../../resources/PatientRepository.dart';

class CompletedAppointmentsData{
  CompletedAppointmentsData._();
  static final CompletedAppointmentsData _instance = CompletedAppointmentsData._();
  factory CompletedAppointmentsData() => _instance;

  late GenericBloc<AppointmentsResponse?> pastCubit;
  late GenericBloc<bool> loadingHome;
  List<PatientAppointmentModel>? pastAppointments = [];


  void init(BuildContext context) {
    this.pastCubit = GenericBloc<AppointmentsResponse?>(null);
    fetchPastPatAppointments(context);
  }

  Future<void> fetchPastPatAppointments(BuildContext context) async {
    pastAppointments = [];
    AppointmentsResponse? result = await PatientRepository(context).getComingAppointments();
    pastAppointments = result?.appointments??[];
    log("pastAppointments=> ${pastAppointments?.length}");
    pastCubit.onUpdateData(result);
  }
}