part of 'ActiveAccountImports.dart';

class ActiveAccount extends StatefulWidget {
  final String userId;
  final  String email;

  const ActiveAccount({required this.userId, required this.email});

  @override
  _ActiveAccountState createState() => _ActiveAccountState();
}

class _ActiveAccountState extends State<ActiveAccount> {
  ActiveAccountData activeAccountData = new ActiveAccountData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'تفعيل الحساب',
      back: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            HeaderLogo(),
            BuildText(),
            BuildFormInputs(activeAccountData: activeAccountData),
            BuildButtonList(
              activeAccountData: activeAccountData,
              userId: widget.userId, email: widget.email,
            ),
          ],
        ),
      ),
    );
  }
}
