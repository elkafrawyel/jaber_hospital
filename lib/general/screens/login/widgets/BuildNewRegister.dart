part of 'LoginWidgetsImports.dart';

class BuildNewRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: MyText(
              title: tr(context, "don'tHaveAccount"),
              size: 11,
              alien: TextAlign.center,
              color: MyColors.primary,
              // fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () => Nav.navigateTo(
              context,
              Register(),
              navigatorType: NavigatorType.push,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: MyText(
                title: 'قم بأنشاء حساب',
                size: 11,
                decoration: TextDecoration.underline,
                alien: TextAlign.center,
                color: MyColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
