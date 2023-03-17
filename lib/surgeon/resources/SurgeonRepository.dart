part of 'SurgeonRepoImports.dart';

class SurgeonRepository {
  late BuildContext _context;
  late SurgeonHttpMethods _surgeonHttpMethods;

  SurgeonRepository(BuildContext context) {
    _context = context;
    _surgeonHttpMethods = SurgeonHttpMethods(_context);
  }

  Future<SurgeonHomeModel?> getHome({required String doctorId}) => _surgeonHttpMethods.getHome(doctorId);

  Future<List<PatientModel>> getAllPatientPreOp() => _surgeonHttpMethods.getAllPatientPreOp();

  Future<List<PatientModel>> getAllPatientPostOp() => _surgeonHttpMethods.getAllPatientPostOp();

  Future<List<PatientModel>> getMyPatientPostOp() => _surgeonHttpMethods.getMyPatientPostOp();

  Future<List<PatientModel>> getMyPatientPreOp() => _surgeonHttpMethods.getMyPatientPreOp();

  Future<bool> updateSurgeonProfile(ProfileModel model) => _surgeonHttpMethods.updateSurgeonProfile(model);

  Future<bool> addPatientFirst({required String userId, required AddPatientFirstDto model}) =>
      _surgeonHttpMethods.addPatientFirst(userId, model);

  Future<bool> addPatientSecond(AddPatientSecondDto model) => _surgeonHttpMethods.addPatientSecond(model);

  Future<bool> addPatientThird(AddPatientThirdDto model) => _surgeonHttpMethods.addPatientThird(model);

  Future<bool> addPatientFourth(AddPatientFourthDto model) => _surgeonHttpMethods.addPatientFourth(model);

  Future<bool> addPatientFifth(AddPatientFifthDto model) => _surgeonHttpMethods.addPatientFifth(model);

  Future<bool> addPatientSixth(AddPatientSixthDto model) => _surgeonHttpMethods.addPatientSixth(model);

  Future<LabsResponse?> getAllLabs() => _surgeonHttpMethods.getAllLabs();

  Future<PatientDetailsModel?> getPatientDetails(String patientId) => _surgeonHttpMethods.getPatientDetails(patientId);

  Future<bool> addAppointment(
    String patientId,
    String date,
    String comments,
    String clinicName,
  ) =>
      _surgeonHttpMethods.addAppointment(
        patientId,
        date,
        comments,
        clinicName,
      );

  Future<List<MedicationsOrdersModel>> getMedicationOrders(int index) => _surgeonHttpMethods.getMedicationOrders(index);

  Future<bool> cancelMedicationOrder({required String orderId}) => _surgeonHttpMethods.cancelMedicationOrder(orderId);

  Future<List<PatientNameModel>> getPatientNames() => _surgeonHttpMethods.getPatientNames();

  Future<MedicationModel?> getListMedication(String pageNumber) => _surgeonHttpMethods.getListMedication(pageNumber);

  Future<bool> requestMedicationOrder(Map<String, dynamic> body) => _surgeonHttpMethods.requestMedicationOrder(body);
}
