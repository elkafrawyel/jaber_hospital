import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../general/blocks/user_cubit/user_cubit.dart';
import '../../general/models/UserModel.dart';
import '../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../surgeon/models/patient_details_model.dart';
import '../models/appointments_response.dart';
import '../models/patient_appointment_model.dart';
import '../resources/PatientRepository.dart';

class PatientHomeData {
  PatientHomeData._();

  static final PatientHomeData _instance = PatientHomeData._();

  factory PatientHomeData() => _instance;

  late GenericBloc<PatientDetailsModel?> patInfoCubit;
  late GenericBloc<AppointmentsResponse?> homeCubit;
  late GenericBloc<List<PatientAppointmentModel>?> pastVisitsCubit;
  late GenericBloc<bool> loadingHome;
  List<PatientAppointmentModel> pastAppointments = [];

  void init(BuildContext context) async {
    this.homeCubit = GenericBloc<AppointmentsResponse?>(null);
    this.pastVisitsCubit = GenericBloc<List<PatientAppointmentModel>?>(null);
    this.patInfoCubit = GenericBloc<PatientDetailsModel?>(null);
    await fetchComingAppointments(context);
    await fetchPastAppointments(context);
    await fetchPatientDetails(context);
  }

  Future<void> fetchPatientDetails(BuildContext context) async {
    UserModel user = context.read<UserCubit>().state.model;
    log("userId==> ${user.userData?[0].sId}");
    PatientDetailsModel? result = await PatientRepository(context).getPatientDetails(user.userData?[0].sId ?? "");
    log("operationDate=> ${result?.patient?.operationDate}");
    log("patientName=> ${result?.patient?.fNameAr} ${result?.patient?.lNameAr}");
    patInfoCubit.onUpdateData(result);
  }

  Future<void> fetchComingAppointments(BuildContext context) async {
    AppointmentsResponse? result = await PatientRepository(context).getComingAppointments();
    log("comingAppointments=> ${result?.appointments?.length}");
    homeCubit.onUpdateData(result);
  }

  Future<void> fetchPastAppointments(BuildContext context) async {
    AppointmentsResponse? result = await PatientRepository(context).getPastAppointments();
    log("PastAppointments=> ${result?.appointments?.length}");
    pastAppointments = result?.appointments ?? [];
    pastVisitsCubit.onUpdateData(pastAppointments);
  }
}
