part of 'ChangePasswordImports.dart';

class ChangePassword extends StatefulWidget {
  final String userId;

  const ChangePassword({super.key, required this.userId});
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final ChangePasswordData changePasswordData = new ChangePasswordData();

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
        back: true,
        title: "Change Password",
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            BuildChangeForm(changePasswordData: changePasswordData),
            BuildSaveButton(changePasswordData: changePasswordData),
          ],
        ));
  }
}
