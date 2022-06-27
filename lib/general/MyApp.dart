import 'package:base_flutter/general/blocks/theme_cubit/theme_cubit.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/screens/splash/SplashImports.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tf_validator/localization/SetLocalization.dart';
import 'blocks/lang_cubit/lang_cubit.dart';
import 'utilities/main_data/MainDataImports.dart';

class MyApp extends StatefulWidget {
  final bool isDark;
  const MyApp({Key? key, required this.isDark}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = new GlobalKey<NavigatorState>();
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
     context.watch<ThemeCubit>().changeAppTheme(context);
    return MultiBlocProvider(
      providers: MainData.providers(context),
      child:  BlocBuilder<LangCubit, LangState>(
        builder: (context, state) {
          return MaterialApp(
            // color:widget.isDark?Colors.black:Colors.white ,
              debugShowCheckedModeBanner: false,
              theme: !widget.isDark
                  ? MainData.defaultThem
                  : MainData.darkThem,
              home: Splash(navigatorKey: navigatorKey),
              title: "ورقكم",
              supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
              localizationsDelegates: [
                SetLocalization.localizationsDelegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: state.locale,
              // routerDelegate: _appRouter.delegate(
              //     initialRoutes: [SplashRoute(navigatorKey: navigatorKey)]),
              // routeInformationParser: _appRouter.defaultRouteParser(),
              builder: (ctx, child) {
                child = FlutterEasyLoading(child: child); //do something
                return child;
              }
          );
        },
      )
    );
  }
}
