part of 'LoginWidgetsImports.dart';

class BuildForgetText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () => Nav.navigateTo(
          context,
          ForgetPassword(),
          navigatorType: NavigatorType.push,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MyText(
              title: tr(context, "forgetPassword"),
              size: 10,
              decoration: TextDecoration.underline,
              color: MyColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
