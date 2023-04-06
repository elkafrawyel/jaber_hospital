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

  Future<bool> editPatientFirst({
    required String userId,
    required AddPatientFirstDto model,
  }) =>
      _surgeonHttpMethods.editPatientFirst(
        userId,
        model,
      );
  Future<bool> addPatientSecond(AddPatientSecondDto model) => _surgeonHttpMethods.addPatientSecond(model);

  Future<bool> addPatientThird(AddPatientThirdDto model) => _surgeonHttpMethods.addPatientThird(model);

  Future<bool> addPatientFourth(AddPatientFourthDto model) => _surgeonHttpMethods.addPatientFourth(model);

  Future<bool> addPatientFifth(AddPatientFifthDto model) => _surgeonHttpMethods.addPatientFifth(model);

  Future<bool> addPatientSixth(AddPatientSixthDto model) => _surgeonHttpMethods.addPatientSixth(model);

  Future<List<LabModel>?> getAllLabs() => _surgeonHttpMethods.getAllLabs();

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

  Future<NotificationsResponse?> getSurgeonNotifications()=> _surgeonHttpMethods.fetchSurgeonNotifications();

  /// Mdt
  Future<MdtPatientsResponse?> requestMdtPatientsByStatus(String mdtStatus) => _surgeonHttpMethods.fetchMdtPatientsByStatus(mdtStatus);
  Future<MdtPatientsResponse?> requestMdtAdminPatients() => _surgeonHttpMethods.fetchMdtAdminPatients();
  Future<MdtPatientsResponse?> requestMdtAllReadyPatients() => _surgeonHttpMethods.fetchMdtAllReadyPatients();
  Future<UpdateConsentResponse?> updateReadyMdtStatus(Map<String, dynamic> body) =>
      _surgeonHttpMethods.updateReadyMdtStatus(body);
  Future<UpdateConsentResponse?> confirmMdtBooking(Map<String, dynamic> body, String patientId) => _surgeonHttpMethods.confirmMdtBooking(body, patientId);
  Future<UpdateConsentResponse?> mdtPatientResult(Map<String, dynamic> body) => _surgeonHttpMethods.sendMdtResult(body);
  Future<UpdateConsentResponse?> rescheduleMdtPatientStatus(String patientId) =>
      _surgeonHttpMethods.rescheduleMdtPatientStatus(patientId);

  Future<AppointmentsResponse?> fetchSurAppointments(bool isUpcoming) =>
      _surgeonHttpMethods.fetchSurAppointments(isUpcoming);

  Future<bool> downloadPatientInfo(String patientId) => _surgeonHttpMethods.downloadPatientInfo(patientId);

  Future<bool> addPatientSeventh(AddPatientSeventhDto model) => _surgeonHttpMethods.addPatientSeventh(model);

  Future<bool> uploadFluoroscopyResult(File file) => _surgeonHttpMethods.uploadFluoroscopyResult(file);

  Future<bool> uploadEgd(File file) => _surgeonHttpMethods.uploadEgd(file);

  /// request instruments
  Future<CompaniesResponse?> fetchCompanies() => _surgeonHttpMethods.getCompanies();
  Future<CompanyInstrumentsResponse?> fetchCompanyInstruments(String companyId) => _surgeonHttpMethods.fetchCompanyInstruments(companyId);

}
