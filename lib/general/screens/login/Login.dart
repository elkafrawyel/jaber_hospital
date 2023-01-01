part of 'LoginImports.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginData = new LoginData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      back: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            Hero(
                tag: Res.imagesLogo,
            child: HeaderLogo(back: false,title: 'Sign In',)),
            BuildSelectAuthType(loginData: loginData),
            BuildFormInputs(loginData: loginData),
            BuildForgetText(),
            BuildLoginButton(loginData: loginData),
            BuildNewRegister(),
          ],
        ),
      ),
    );
  }
}
