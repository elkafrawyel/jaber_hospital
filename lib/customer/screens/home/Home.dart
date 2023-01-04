part of 'HomeImports.dart';

class Home extends StatefulWidget {
  final int index;
  const Home({Key? key, required this.index}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final homeData = HomeData();
  @override
  void initState() {
    homeData.controller = TabController(length: 4, vsync: this);
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      log(' =========== >>>>> message $message');
      log('where r u 4');
      if (message != null) {
        if (message.data != {}) {
          handleNotificationsTap(
            message.data.toString(),
          );
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(title: 'Home', size: 15),
            const SizedBox(height: 20),
            DefaultButton(
              title: 'sign out',
              onTap: () => GeneralHttpMethods(context).logOut(),
            ),
          ],
        ),
      ),
    );
  }
}
// return AuthScaffold(
//   notificationIcon: true,
//   title: 'الرئيسية',
//   back: false,
//   bottomNavigationBar: BuildBottomTabBar(homeData: homeData),
//   body: BuildTabsView(homeData: homeData),
// );
