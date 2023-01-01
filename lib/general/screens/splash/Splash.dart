part of 'SplashImports.dart';

class Splash extends StatefulWidget {


  const Splash();

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
      setupNotifications();
      // GlobalNotification.instance.setupNotification(context);
      Future.delayed(Duration(milliseconds: 2000), () {
        Utils.manipulateSplashData(context);
      });
    }

  }

  @override
  Widget build(BuildContext context) {

    // bool dark = context.watch<ThemeCubit>().state.isDark;
    return Scaffold(
        body: Center(
          child: AnimationContainer(
              index: 0,
              vertical: true,
              duration: Duration(milliseconds: 2000),
              distance: MediaQuery.of(context).size.height * .3,
              child: Hero(
                tag: Res.imagesLogo,
                child: Image.asset(
                  Res.imagesLogoTeal,
                  width: 250,
                  height: 250,
                ),
              )),
        ),
          // child: TweenAnimationBuilder<double>(
          //     tween: Tween(begin: 3.0, end: 0.0),
          //     duration: const Duration(milliseconds: 1000),
          //     curve: Curves.elasticOut,
          //     builder: (_, double value, child) {
          //       return Transform.translate(
          //         offset: Offset(value *500 , 0),
          //         child: child,
          //       );
          //     },
          //   child:Image.asset(
          //     Res.logo,
          //     width: 200,
          //     height: 150,
          //     fit: BoxFit.contain,
          //   ),
          //    ),
        );
  }
}
