part of 'ActiveAccountWidgetsImports.dart';

class BuildText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20,left: 50,right: 50),
      child: MyText(
        alien: TextAlign.center,
        title: 'من فضلك قم بتفعيل حسابك وادخل كود التعفيل',
        size: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
