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

  Future<AllPatientPostOpResponse> getAllPatientPostOp({int? page}) =>
      _surgeonHttpMethods.getAllPatientPostOp(page: page);

  Future<AllPatientPostOpResponse> getMyPatientPostOp({int? page}) =>
      _surgeonHttpMethods.getMyPatientPostOp(page: page);

  Future<List<PatientModel>> getMyPatientPreOp() => _surgeonHttpMethods.getMyPatientPreOp();

  Future<bool> updateSurgeonProfile(ProfileModel model) => _surgeonHttpMethods.updateSurgeonProfile(model);

  Future<String?> addPatientFirst({required AddPatientFirstDto model}) => _surgeonHttpMethods.addPatientFirst(model);

  Future<bool> editPatientFirst({
    required String userId,
    required AddPatientFirstDto model,
  }) =>
      _surgeonHttpMethods.editPatientFirst(
        userId,
        model,
      );

  Future<bool> addPatientSecond({
    required String patientId,
    required AddPatientSecondDto model,
  }) =>
      _surgeonHttpMethods.addPatientSecond(
        patientId: patientId,
        model: model,
      );

  Future<bool> addPatientThird({
    required String patientId,
    required AddPatientThirdDto model,
  }) =>
      _surgeonHttpMethods.addPatientThird(
        model: model,
        patientId: patientId,
      );

  Future<bool> addPatientFourth({
    required String patientId,
    required AddPatientFourthDto model,
  }) =>
      _surgeonHttpMethods.addPatientFourth(
        model: model,
        patientId: patientId,
      );

  Future<bool> addPatientFifth({
    required String patientId,
    required AddPatientFifthDto model,
  }) =>
      _surgeonHttpMethods.addPatientFifth(
        model: model,
        patientId: patientId,
      );

  Future<bool> addPatientSixth({
    required String patientId,
    required AddPatientSixthDto model,
  }) =>
      _surgeonHttpMethods.addPatientSixth(
        model: model,
        patientId: patientId,
      );

  Future<List<LabModel>?> getAllLabs() => _surgeonHttpMethods.getAllLabs();

  Future<PatientDetailsModel?> getPatientDetails(String patientId) => _surgeonHttpMethods.getPatientDetails(patientId);

  Future<bool> addAppointment(
    String patientId,
    String date,
    String comments,
    // String clinicName,
  ) =>
      _surgeonHttpMethods.addAppointment(
        patientId,
        date,
        comments,
        // clinicName,
      );

  Future<List<MedicationsOrdersModel>> getMedicationOrders(int index) => _surgeonHttpMethods.getMedicationOrders(index);

  Future<InstrumentOrdersResponse> getInstrumentsRoutedOrders() => _surgeonHttpMethods.getInstrumentsRoutedOrders();

  Future<InstrumentOrdersResponse> getInstrumentsInProgressOrders() =>
      _surgeonHttpMethods.getInProgressInstrumentsOrders();

  Future<InstrumentOrdersResponse> getInstrumentsCompletedOrders() =>
      _surgeonHttpMethods.getCompletedInstrumentsOrders();

  Future<bool> cancelMedicationOrder({required String orderId}) => _surgeonHttpMethods.cancelMedicationOrder(orderId);

  Future<List<PatientNameModel>> getPatientNames() => _surgeonHttpMethods.getPatientNames();

  Future<MedicationModel?> getListMedication(String pageNumber) => _surgeonHttpMethods.getListMedication(pageNumber);

  Future<bool> requestMedicationOrder(Map<String, dynamic> body) => _surgeonHttpMethods.requestMedicationOrder(body);

  Future<NotificationsResponse?> getSurgeonNotifications() => _surgeonHttpMethods.fetchSurgeonNotifications();

  /// Mdt
  Future<MdtPatientsResponse?> requestMdtPatientsByStatus(String mdtStatus) =>
      _surgeonHttpMethods.fetchMdtPatientsByStatus(mdtStatus);

  Future<MdtPatientsResponse?> requestMdtAdminPatients() => _surgeonHttpMethods.fetchMdtAdminPatients();

  Future<MdtPatientsResponse?> requestMdtAllReadyPatients() => _surgeonHttpMethods.fetchMdtAllReadyPatients();

  Future<UpdateConsentResponse?> updateReadyMdtStatus(Map<String, dynamic> body) =>
      _surgeonHttpMethods.updateReadyMdtStatus(body);

  Future<UpdateConsentResponse?> confirmMdtBooking(Map<String, dynamic> body, String patientId) =>
      _surgeonHttpMethods.confirmMdtBooking(body, patientId);

  Future<UpdateConsentResponse?> mdtPatientResult(Map<String, dynamic> body) => _surgeonHttpMethods.sendMdtResult(body);

  Future<UpdateConsentResponse?> rescheduleMdtPatientStatus(String patientId) =>
      _surgeonHttpMethods.rescheduleMdtPatientStatus(patientId);

  Future<AppointmentsResponse?> fetchSurAppointments(bool isUpcoming) =>
      _surgeonHttpMethods.fetchSurAppointments(isUpcoming);

  Future<bool> downloadPatientInfo(String patientId) => _surgeonHttpMethods.downloadPatientInfo(patientId);

  Future<bool> archivePatient(String patientId) => _surgeonHttpMethods.archivePatient(patientId);

  Future<bool> addPatientSeventh({
    required String patientId,
    required AddPatientSeventhDto model,
  }) =>
      _surgeonHttpMethods.addPatientSeventh(
        model: model,
        patientId: patientId,
      );

  Future<bool> uploadFluoroscopyResult({
    required String patientId,
    required File file,
  }) =>
      _surgeonHttpMethods.uploadFluoroscopyResult(
        file: file,
        patientId: patientId,
      );

  Future<bool> uploadEgd({
    required String patientId,
    required File file,
  }) =>
      _surgeonHttpMethods.uploadEgd(file: file, patientId: patientId);

  /// request instruments
  Future<CompaniesResponse?> fetchCompanies() => _surgeonHttpMethods.getCompanies();

  Future<CompanyInstrumentsResponse?> fetchCompanyInstruments(String companyId) =>
      _surgeonHttpMethods.fetchCompanyInstruments(companyId);
}
