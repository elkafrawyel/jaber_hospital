part of 'SplashImports.dart';

class Splash extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const Splash({required this.navigatorKey});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _checkingData();
    super.initState();
  }

  _checkingData() async {
    if (!kIsWeb) {
      GlobalNotification.instance.setupNotification(context);
    }
    Future.delayed(Duration(milliseconds: 2000), () {
      Utils.manipulateSplashData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: MyColors.white,
            child: Center(
              child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 5.0, end: 0.0),
                  duration:  Duration(milliseconds: 1200),
                  curve: Curves.elasticOut,
                  builder: (_, double value, child) {
                    return Transform.translate(
                      offset: Offset(value *1000 , 0),
                      child: child,
                    );
                  },
                child:Hero(
                  tag: Res.logo,
                  child: Image.asset(
                    Res.logo,
                    width: 200,
                    height: 150,
                  ),
                ),
                 ),
            )



            ));
  }
}
//   // child: AnimationContainer(
//   //     index: 0,
//   //     vertical: true,
//   //     duration: Duration(milliseconds: 1500),
//   //     distance: MediaQuery.of(context).size.height * .3,
//   //     child: Hero(
//   //       tag: Res.logo,
//   //       child: Image.asset(
//   //         Res.logo,
//   //         width: 200,
//   //         height: 150,
//   //       ),
//   //     )),
// ),