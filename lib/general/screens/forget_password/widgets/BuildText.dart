part of 'ForgetPasswordWidgetsImports.dart';

class BuildText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: MyText(
        alien: TextAlign.center,
        title: "An OTP code will be sent to your phone number to help you reset password",
        size: 11,
      ),
    );
  }
}
