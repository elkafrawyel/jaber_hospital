part of 'ForgetPasswordImports.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  ForgerPasswordData forgerPasswordData = new ForgerPasswordData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'استعادة كلمة المرور',
      back: true,
      body: GestureDetector(
        onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            HeaderLogo(),
            BuildText(),
            BuildFormInputs(forgerPasswordData: forgerPasswordData),
            BuildButton(forgerPasswordData: forgerPasswordData),
          ],
        ),
      ),
    );
  }
}
