part of 'LoginWidgetsImports.dart';

class BuildNewRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: MyText(
              title:tr(context,"don'tHaveAccount"),
              size: 10,
              alien: TextAlign.center,
              color: MyColors.primary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: MyText(
              title:'قم بأنشاء حساب',
              size: 10,
              decoration: TextDecoration.underline,
              alien: TextAlign.center,
              color: MyColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
