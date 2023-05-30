part of 'ResetPasswordWidgetsImports.dart';

class BuildPassResetSuccess extends StatelessWidget {
  const BuildPassResetSuccess({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralAlertDialog(
      alertButtonType: AlertButtonType.button,
      alertTextType: AlertContentType.fullTitle,
      alertImageType: AlertImageType.noImg,
      headTitleColor: MyColors.primary,
      buttonTitle: 'Sign In',
      headTitle: "Reset Password",
      subTitle: "Your new password is updated successfully, you can sign in now with your new password",
      customWidget: Image.asset(Res.imagesResetPassword),
      onTapButton: () {
        navigationKey.currentState!.pop();
        Nav.navigateTo(Login(), navigatorType: NavigatorType.pushAndPopUntil);
      },
    );
  }
}
