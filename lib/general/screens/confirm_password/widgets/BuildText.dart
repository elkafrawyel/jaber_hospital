part of 'ConfirmPasswordWidgetsImports.dart';

class BuildText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: MyText(
        alien: TextAlign.center,
        title: "Please enter the OTP that has just been sent to your phone number",
        size: 10,
        color: MyColors.black.withOpacity(.6),
      ),
    );
  }
}
