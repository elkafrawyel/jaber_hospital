part of 'SelectLangImports.dart';

class SelectLang extends StatefulWidget {
  @override
  _SelectLangState createState() => _SelectLangState();
}

class _SelectLangState extends State<SelectLang> {
  SelectLangData selectLangData = SelectLangData();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: AuthScaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),          children: [
            HeaderLogo(),
            BuildLangText(),
            BuildButtonList(selectLangData: selectLangData),
          ],
        ), back: true, title: '',
      ),
      onWillPop: selectLangData.onBackPressed,
    );
  }
}
