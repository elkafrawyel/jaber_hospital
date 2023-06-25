part of 'LoginWidgetsImports.dart';

class BuildNewRegister extends StatefulWidget {
  @override
  State<BuildNewRegister> createState() => _BuildNewRegisterState();
}

class _BuildNewRegisterState extends State<BuildNewRegister> {
  bool hideButton = true;

  @override
  void initState() {
    super.initState();
    _checkButton();
  }

  @override
  Widget build(BuildContext context) {
    return hideButton
        ? SizedBox()
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    MyText(
                      title: tr(context, "don'tHaveAccount"),
                      size: 11,
                      alien: TextAlign.center,
                      color: MyColors.primary,
                      // fontWeight: FontWeight.bold,
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Nav.navigateTo(
                          RegisterScreen(),
                          navigatorType: NavigatorType.push,
                        );
                      },
                      child: MyText(
                        title: 'Register',
                        size: 13,
                        alien: TextAlign.center,
                        color: MyColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }

  void _checkButton() async {
    var showButton = await GeneralRepository(context).registerButton();

    print("============>$showButton");
    setState(() {
      hideButton = !showButton;
    });

  }
}
