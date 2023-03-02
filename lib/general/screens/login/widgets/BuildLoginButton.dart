part of 'LoginWidgetsImports.dart';

class BuildLoginButton extends StatelessWidget {
  final LoginData loginData;

  const BuildLoginButton({required this.loginData});

  @override
  Widget build(BuildContext context) {
    // return DefaultButton(title: 'title',onTap: (){
    //   Nav.navigateTo( Home(), navigatorType: NavigatorType.push);
    // },);
    return LoadingButton(
      btnKey: loginData.btnKey,
      title: 'Sign In',

      onTap: () => loginData.userLogin(context),
      color: MyColors.primary,
      textColor: MyColors.white,
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 100),
    );
  }
}
