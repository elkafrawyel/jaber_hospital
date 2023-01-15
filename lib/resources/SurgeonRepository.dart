part of 'SurgeonHttpImports.dart';

class SurgeonRepository {
  late BuildContext _context;
  late SurgeonHttpMethods _customerHttpMethods;

  SurgeonRepository(BuildContext context) {
    _context = context;
    _customerHttpMethods = new SurgeonHttpMethods(_context);
  }


}
