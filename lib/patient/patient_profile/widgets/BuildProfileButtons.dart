part of 'profileWidgetImports.dart';

class BuildPatientProfileButtons extends StatelessWidget {
  const BuildPatientProfileButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      title: 'حفظ التعديلات',
      onTap: () => SurProfileData().saveUserProfile(context),
      color: MyColors.primary,
      margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      btnKey: SurProfileData().btnKey,
    );
  }
}
