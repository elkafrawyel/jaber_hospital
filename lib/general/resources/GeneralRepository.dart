part of 'GeneralRepoImports.dart';

class GeneralRepository {
  late BuildContext _context;
  late GeneralHttpMethods _generalHttpMethods;

  GeneralRepository(BuildContext context) {
    _context = context;
    _generalHttpMethods = new GeneralHttpMethods(_context);
  }

  Future<bool> userLogin({required String email, required String pass, required String role}) =>
      _generalHttpMethods.userLogin(email, pass, role);

  Future<bool> patientLogin({required String civilId, required String pass, required String role}) =>
      _generalHttpMethods.patientLogin(civilId, pass, role);

  Future<bool> doctorRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String gender,
  }) =>
      _generalHttpMethods.doctorRegister(
        firstName: firstName,
        lastName: lastName,
        email: email,
        gender: gender,
        password: password,
      );

  Future<bool> sendCode({required String code, required String userId}) => _generalHttpMethods.sendCode(code, userId);

  Future<bool> resendCode({required String userId, required String email}) =>
      _generalHttpMethods.resendCode(userId, email);

  Future<String?> aboutApp() => _generalHttpMethods.aboutApp();

  Future<String?> terms() => _generalHttpMethods.terms();

  Future<bool> switchNotify() => _generalHttpMethods.switchNotify();

  Future<bool> forgetPassword(String email) => _generalHttpMethods.forgetPassword(email);

  Future<bool> resetUserPassword({required String userId, required String pass}) =>
      _generalHttpMethods.resetUserPassword(userId, pass);

  Future<List<QuestionModel>> frequentQuestions() => _generalHttpMethods.frequentQuestions();

  Future<bool> registerButton() => _generalHttpMethods.registerButton();

  Future<bool> sendMessage({String? name, String? mail, String? message}) =>
      _generalHttpMethods.sendMessage(name, mail, message);

  Future<bool> changePass({required String password}) => _generalHttpMethods.changePass(password);
}
