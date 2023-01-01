part of 'LoginWidgetsImports.dart';

class BuildNewRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
            Register(),
            navigatorType: NavigatorType.push,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: MyText(
              title: 'Register',
              size: 11,
              decoration: TextDecoration.underline,
              alien: TextAlign.center,
              color: MyColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
