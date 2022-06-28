part of 'ResetPasswordWidgetsImports.dart';

class BuildText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20,right: 50,left: 50),
      child: MyText(
        alien: TextAlign.center,
        title: 'تم ارسال الكود الي الرقم الذي تم اداخلة من فضلك تحقق من الكود',
        size: 10,
        color: Theme.of(context).textTheme.subtitle1?.color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
