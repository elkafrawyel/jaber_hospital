part of 'PsychologistRepoImports.dart';

class PsychologistRepository {
  late BuildContext _context;
  late PsychologistHttpMethods _surgeonHttpMethods;

  PsychologistRepository(BuildContext context) {
    _context = context;
    _surgeonHttpMethods = PsychologistHttpMethods(_context);
  }

  Future<SurgeonHomeModel?> getHome({required String doctorId}) =>
      _surgeonHttpMethods.getHome(doctorId);

  Future<List<PatientModel>> getAllPatientPreOp() =>
      _surgeonHttpMethods.getAllPatientPreOp();

  Future<List<PatientModel>> getAllPatientPostOp() =>
      _surgeonHttpMethods.getAllPatientPostOp();

  Future<List<PatientModel>> getMyPatientPostOp() =>
      _surgeonHttpMethods.getMyPatientPostOp();

  Future<List<PatientModel>> getMyPatientPreOp() =>
      _surgeonHttpMethods.getMyPatientPreOp();

  Future<bool> updateSurgeonProfile(ProfileModel model) =>
      _surgeonHttpMethods.updateSurgeonProfile(model);

  Future<bool> addPatientFirst(
          {required String userId, required AddPatientFirstDto model}) =>
      _surgeonHttpMethods.addPatientFirst(userId, model);

  Future<PatientDetailsModel?> getPatientDetails(String patientId) =>
      _surgeonHttpMethods.getPatientDetails(patientId);

  Future<bool> addAppointment(
          String patientId, String date, String comments, String clinicName) =>
      _surgeonHttpMethods.addAppointment(patientId, date, comments, clinicName);

  Future<List<MedicationsOrdersModel>> getMedicationOrders(int index) =>
      _surgeonHttpMethods.getMedicationOrders(index);

  Future<bool> cancelMedicationOrder({required String orderId}) =>
      _surgeonHttpMethods.cancelMedicationOrder(orderId);

  Future<List<PatientNameModel>> getPatientNames() =>
      _surgeonHttpMethods.getPatientNames();

  Future<MedicationModel?> getListMedication(String pageNumber) =>
      _surgeonHttpMethods.getListMedication(pageNumber);

  Future<bool> requestMedicationOrder(Map<String, dynamic> body) =>
      _surgeonHttpMethods.requestMedicationOrder(body);
}
