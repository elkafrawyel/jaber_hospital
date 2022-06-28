part of 'LoginWidgetsImports.dart';

class BuildVisitorButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: MyText(
        alien: TextAlign.center,
        title: 'الدخول كزائر',
        size: 12,
        decoration: TextDecoration.underline,
        // fontWeight: FontWeight.bold,
        color: MyColors.primary,
      ),
    );
  }
}
