part of 'profileWidgetImports.dart';

class BuildProfileButtons extends StatelessWidget {
  const BuildProfileButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      title: 'Save Changes',
      // onTap: () => SurProfileData().saveUserProfile(context),
      onTap: () {},
      color: MyColors.primary,
      margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      btnKey: SurProfileData().btnKey,
    );
  }
}
