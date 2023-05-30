part of 'RegisterWidgetsImports.dart';

class BuildRegisterButton extends StatelessWidget {
  final RegisterData registerData;

  const BuildRegisterButton({Key? key, required this.registerData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      btnKey: registerData.btnKey,
      title: 'تسجيل جديد',
      onTap: () => registerData.userRegister(context),
      color: MyColors.primary,
      textColor: MyColors.white,
      margin: const EdgeInsets.symmetric(vertical: 20),
    );
  }
}
