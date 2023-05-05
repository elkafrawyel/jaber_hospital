import 'package:flutter/material.dart';

import '../models/appointments_response.dart';
import '../models/notifications_response.dart';
import '../models/questionaire_model.dart';
import '../models/update_consent_response.dart';
import 'PatientHttpMethods.dart';

class PatientRepository {
  late BuildContext _context;
  late PatientHttpMethods _patientHttpMethods;

  PatientRepository(BuildContext context) {
    _context = context;
    _patientHttpMethods =  PatientHttpMethods(_context);
  }
  /// Patient
  Future<AppointmentsResponse?> getComingAppointments()=> _patientHttpMethods.fetchComingPatientAppointments();
  Future<AppointmentsResponse?> getPastAppointments()=> _patientHttpMethods.fetchPastPatientAppointments();
  Future<NotificationsResponse?> getPatientNotifications()=> _patientHttpMethods.fetchPatientNotifications();
  Future<UpdateConsentResponse?> updateConsent()=> _patientHttpMethods.updateConsent();
  Future<QuestionnaireResponse?> getPatientQuestionnaire(int page)=> _patientHttpMethods.fetchPatientQuestionnaire(page);
}
