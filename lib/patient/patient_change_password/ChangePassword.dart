part of 'ChangePasswordImports.dart';

class PatientChangePassword extends StatefulWidget {
  final String userId;

  const PatientChangePassword({super.key, required this.userId});

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<PatientChangePassword> {
  final ChangePasswordData changePasswordData = new ChangePasswordData();

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
        back: true,
        title: "تغيير كلمة السر",
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            PasswordBodyForm(changePasswordData: changePasswordData),
            LoadingButton(
              btnKey: changePasswordData.btnKey,
              title: 'حفظ التعديلات',
              textColor: MyColors.white,
              color: MyColors.primary,
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 100),
              onTap: () => changePasswordData.setChangePassword(context),
            ),
          ],
        ));
  }
}
