part of 'ConfirmPasswordImports.dart';

class ConfirmPassword extends StatefulWidget {
  final String userId;
  final String email;

  const ConfirmPassword({super.key, required this.userId, required this.email});
  @override
  _ConfirmPasswordState createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  final ConfirmPasswordData confirmPasswordData = new ConfirmPasswordData();
  @override
  void initState() {
    confirmPasswordData.startTimeout();
    confirmPasswordData.checkSendCubit.onUpdateData(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          HeaderLogo(title: "OTP Verification "),
          BuildText(),
          BuildFormInputs(
            confirmPasswordData: confirmPasswordData, userId: widget.userId,
          ),
          BuildButtonList(
            confirmPasswordData: confirmPasswordData,
            userId: widget.userId,
            email: widget.email,
          ),
        ],
      ),
      back: true,
    );
  }
}
