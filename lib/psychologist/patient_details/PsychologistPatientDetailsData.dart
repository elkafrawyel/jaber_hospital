import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../../general/MyApp.dart';
import '../../general/models/doctor_model.dart';
import '../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../general/utilities/utils_functions/AdaptivePicker.dart';
import '../../patient/models/ques_answer_response.dart';
import '../../surgeon/models/patient_details_model.dart';
import '../resources/PsychologistRepoImports.dart';
import 'PsychologistPatientDetails.dart';

class PsychologistPatientDetailsData {
  //  single tone class
  static PsychologistPatientDetailsData _instance = new PsychologistPatientDetailsData._();
  factory PsychologistPatientDetailsData() => _instance;
  PsychologistPatientDetailsData._();

  late TextEditingController appointmentDate;
  late TextEditingController clinicName;
  late TextEditingController notes;
  late GenericBloc<String?> dateBloc;
  DateTime startDate = DateTime.now();
  late GenericBloc<PatientDetailsModel?> patientDetailsCubit;
  late GenericBloc<QuesAnswerResponse?> patScoreCubit;
  late GlobalKey<FormState> formKey;
  late String patSurgeonId;
  late DoctorId psychologistId;
  late bool isReadyPatient;

  void init(BuildContext context, {required String patientId}) {
    appointmentDate = TextEditingController();
    clinicName = TextEditingController();
    notes = TextEditingController();
    patientDetailsCubit = GenericBloc<PatientDetailsModel?>(null);
    patScoreCubit = GenericBloc<QuesAnswerResponse?>(null);
    formKey = GlobalKey<FormState>();
    dateBloc = GenericBloc(null);
    getPatientDetails(context, patientId);
    getPatAssessmentScore(context, patientId);
  }

  void getPatientDetails(BuildContext context, String patientId) async {
    PatientDetailsModel? data = await PsychologistRepository(context).getPatientDetails(patientId);
    patSurgeonId = data?.patient?.surgeonId?.sId ?? '';
    isReadyPatient = (data?.patient?.egd?? false) &&
        (data?.patient?.ultrasound ?? false) &&
        (data?.patient?.surgionVisit ?? false) &&
        (data?.patient?.dietationFeedbackDecision == 'Clear') &&
        (data?.patient?.feedback == 'Clear') &&
        (data?.patient?.watchedClip ?? false) &&
        (data?.patient?.finalFeedback == 'Clear');
    patientDetailsCubit.onUpdateData(data);
  }

  void getPatAssessmentScore(BuildContext context, String patientId) async {
    QuesAnswerResponse? data = await PsychologistRepository(context).getPatScore(patientId);
    patScoreCubit.onUpdateData(data);
  }

  String date(String date) {
    DateTime dateTime = DateTime.parse(date);
    String returnDate = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    return returnDate;
  }

  String time(String date) {
    DateTime dateTime = DateTime.parse(date);
    String returnDate =
        "${dateTime.hour}:${dateTime.minute} ${dateTime.hour > 12 ? "PM" : "AM"}";
    return returnDate;
  }

  onConfirmFromDate(date) {
    if (date != null) {
      startDate = date;
      String dateStr = DateFormat("dd-MM-yyyy").format(date);
      dateBloc.onUpdateData(dateStr);
      print(dateBloc.state.data);
    }
  }

  Future chooseFromDate(BuildContext context) async{
    FocusScope.of(context).requestFocus(FocusNode());
    await AdaptivePicker.datePicker(
      context: context,
      title: tr(context, "selectStartDate"), //الرجاء تحديد تاريخ بداية اللعبة
      onConfirm: (date) => onConfirmFromDate(date),
    );
  }

  void addAppointment(BuildContext context, String patientId) async {
    if (formKey.currentState!.validate()) {
      bool res = await PsychologistRepository(context)
          .addAppointment(patientId, dateBloc.state.data??'', notes.text,clinicName.text);
      if (res) {
        navigationKey.currentState!.pop();
        navigationKey.currentState!.pop();
        // navigationKey.currentState!.push(MaterialPageRoute(
        //     builder: (_) => PsychologistPatientDetails(patientId: patientId)));
      }
    }
  }
}
