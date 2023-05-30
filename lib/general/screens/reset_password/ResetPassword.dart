part of 'ResetPasswordImports.dart';

class ResetPassword extends StatefulWidget {
  final String userId;

  const ResetPassword({required this.userId});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  ResetPasswordData resetPasswordData = ResetPasswordData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            HeaderLogo(title: 'Reset Password'),
            BuildText(),
            BuildFormInputs(
              resetPasswordData: resetPasswordData,
              userId: widget.userId,
            ),
            BuildButton(
              resetPasswordData: resetPasswordData,
              userId: widget.userId,
            ),
          ],
        ),
      ),
      back: true,
    );
  }
}
