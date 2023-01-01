part of 'LoginWidgetsImports.dart';

class BuildForgetText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(value: true, onChanged: (value){}),
              MyText(
                title: 'Remember Me',
                size: 11,
                color: MyColors.blackOpacity,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          InkWell(
            onTap: () => Nav.navigateTo(ForgetPassword(),
              navigatorType: NavigatorType.push,

            ),
            child: MyText(
              title: 'Forget Password ?',
              size: 10,
              decoration: TextDecoration.underline,
              color: MyColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
