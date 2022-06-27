part of 'LoginWidgetsImports.dart';

class BuildVisitorButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyText(
      alien: TextAlign.center,
      title: 'الدخول كزائر',
      size: 11,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.bold,
      color: MyColors.primary,
    );
  }
}
