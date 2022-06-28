part of 'ForgetPasswordWidgetsImports.dart';

class BuildText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: MyText(
        alien: TextAlign.center,
        title: 'من فضلك ادخل رقم جوالك',
        size: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
