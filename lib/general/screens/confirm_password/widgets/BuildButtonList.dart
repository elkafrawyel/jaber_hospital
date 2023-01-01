part of 'ConfirmPasswordWidgetsImports.dart';

class BuildButtonList extends StatelessWidget {
  final ConfirmPasswordData confirmPasswordData;
  final String userId;

  const BuildButtonList({required this.confirmPasswordData,required this.userId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultButton(
          title: "Confirm",
          onTap: ()=>Nav.navigateTo(ResetPassword(userId: userId), navigatorType: NavigatorType.push),
          // onTap: () => confirmPasswordData.onActiveAccount(context, userId),
          color: MyColors.primary,
          margin: const EdgeInsets.symmetric(
            horizontal: 100,
          ),
        ),
       const  SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              title:tr(context,"noReceiveCode"),
              size: 12,
              color: MyColors.blackOpacity,
            ),
            InkWell(
              // onTap: () =>
              // activeAccountData.onResendCode(context, userId),
              child: MyText(
                title: tr(context,"sendCode"),
                size: 12,
                color: MyColors.primary,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
