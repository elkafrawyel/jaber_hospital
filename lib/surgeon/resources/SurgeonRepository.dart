part of 'SurgeonRepoImports.dart';


class SurgeonRepository {
  late BuildContext _context;
  late SurgeonHttpMethods _surgeonHttpMethods;

  SurgeonRepository(BuildContext context) {
    _context = context;
    _surgeonHttpMethods =  SurgeonHttpMethods(_context);
  }

  Future<SurgeonHomeModel?> getHome({required String doctorId})=>_surgeonHttpMethods.getHome(doctorId);


}
