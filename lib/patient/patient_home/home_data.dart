import 'dart:developer';

import 'package:flutter/material.dart';

import '../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../models/appointments_response.dart';
import '../models/patient_appointment_model.dart';
import '../resources/PatientRepository.dart';

class PatientHomeData{
  PatientHomeData._();
  static final PatientHomeData _instance = PatientHomeData._();
  factory PatientHomeData() => _instance;

  late GenericBloc<AppointmentsResponse?> homeCubit;
  late GenericBloc<List<PatientAppointmentModel>?> pastVisitsCubit;
  late GenericBloc<bool> loadingHome;
  List<PatientAppointmentModel> pastAppointments = [];

  void init(BuildContext context) {
    this.homeCubit = GenericBloc<AppointmentsResponse?>(null);
    this.pastVisitsCubit = GenericBloc<List<PatientAppointmentModel>?>(null);
    fetchComingAppointments(context);
    fetchPastAppointments(context);
  }

  Future<void> fetchComingAppointments(BuildContext context) async {
    AppointmentsResponse? result = await  PatientRepository(context).getComingAppointments();
    log("comingAppointments=> ${result?.appointments?.length}");
    homeCubit.onUpdateData(result);
  }

  Future<void> fetchPastAppointments(BuildContext context) async {
    AppointmentsResponse? result = await  PatientRepository(context).getPastAppointments();
    log("PastAppointments=> ${result?.appointments?.length}");
    pastAppointments = result?.appointments??[];
    pastVisitsCubit.onUpdateData(pastAppointments);
  }
}