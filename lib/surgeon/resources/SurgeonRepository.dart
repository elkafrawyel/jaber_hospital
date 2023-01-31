part of 'SurgeonRepoImports.dart';


class SurgeonRepository {
  late BuildContext _context;
  late SurgeonHttpMethods _surgeonHttpMethods;

  SurgeonRepository(BuildContext context) {
    _context = context;
    _surgeonHttpMethods =  SurgeonHttpMethods(_context);
  }

  Future<SurgeonHomeModel?> getHome({required String doctorId})=>_surgeonHttpMethods.getHome(doctorId);

  Future<List<PatientModel>> getAllPatientPreOp()=>_surgeonHttpMethods.getAllPatientPreOp();

  Future<List<PatientModel>> getAllPatientPostOp()=>_surgeonHttpMethods.getAllPatientPostOp();

  Future<List<PatientModel>> getMyPatientPostOp()=>_surgeonHttpMethods.getMyPatientPostOp();

  Future<List<PatientModel>> getMyPatientPreOp()=>_surgeonHttpMethods.getMyPatientPreOp();

  Future<bool> updateSurgeonProfile(ProfileModel model)=>_surgeonHttpMethods.updateSurgeonProfile(model);



}
