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
      ],
    );
  }
}
