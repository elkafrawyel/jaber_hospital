import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../models/appointments_response.dart';
import '../../../models/patient_appointment_model.dart';
import '../../../resources/PatientRepository.dart';

class ReceivedAppointmentsData{
  ReceivedAppointmentsData._();
  static final ReceivedAppointmentsData _instance = ReceivedAppointmentsData._();
  factory ReceivedAppointmentsData() => _instance;

  late GenericBloc<AppointmentsResponse?> receivedCubit;
  late GenericBloc<bool> loadingHome;
  List<PatientAppointmentModel>? receivedAppointments = [];


  void init(BuildContext context) {
    this.receivedCubit = GenericBloc<AppointmentsResponse?>(null);
    fetchComingPatAppointments(context);
  }

  Future<void> fetchComingPatAppointments(BuildContext context) async {
    receivedAppointments = [];
    AppointmentsResponse? result = await PatientRepository(context).getComingAppointments();
    receivedAppointments = result?.appointments??[];
    log("receivedAppointments=> ${receivedAppointments?.length}");
    receivedCubit.onUpdateData(result);
  }
}