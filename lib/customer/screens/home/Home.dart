part of 'HomeImports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      notificationIcon: true,
      title: 'الرئيسية',
      back: true,
      body: CustomScrollView(),
    );
  }
}
