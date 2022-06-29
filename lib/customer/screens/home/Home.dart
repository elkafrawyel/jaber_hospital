part of 'HomeImports.dart';

class Home extends StatefulWidget {
  final int index ;
  const Home({Key? key, required this.index}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>with TickerProviderStateMixin {
  final homeData = HomeData();
  @override
  void initState() {
    homeData.controller = TabController(length: 4, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      notificationIcon: true,
      title: 'الرئيسية',
      back: false,
      bottomNavigationBar: BuildBottomTabBar(homeData: homeData),
      body: BuildTabsView(homeData: homeData),
    );
  }
}
