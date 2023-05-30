part of 'RegisterImports.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final registerData = RegisterData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'انشاء حساب',
      back: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            BuildRegisterPic(registerData: registerData),
            BuildRegisterInputs(registerData: registerData),
            BuildRegisterButton(registerData: registerData),
          ],
        ),
      ),
    );
  }
}
