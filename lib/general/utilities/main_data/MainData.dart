part of 'MainDataImports.dart';


class MainData {

  static String chatUrl="https://harajawamer.ip4s.com/chatHub";

  static ThemeData defaultThem=ThemeData(
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    primarySwatch: Colors.grey,
    focusColor: MyColors.primary,
    accentColor: MyColors.primary,
    primaryColor: MyColors.primary,
    appBarTheme: AppBarTheme(
      color: MyColors.primary,
    ),
    fontFamily: GoogleFonts.cairo().fontFamily,
    textTheme: TextTheme(
      subtitle1:GoogleFonts.cairo(fontSize: 14,color: Colors.black),
    ),
    splashColor: Colors.white,
  );

  static ThemeData darkThem=ThemeData(
    scaffoldBackgroundColor: Colors.black,
    backgroundColor: Colors.black,
    primarySwatch: Colors.grey,
    focusColor: MyColors.white,
    accentColor: MyColors.white,
    primaryColor: Colors.black,
    primaryColorDark: Colors.black,
    appBarTheme: AppBarTheme(
      color: MyColors.primary,
    ),
    fontFamily: GoogleFonts.cairo().fontFamily,
    textTheme: TextTheme(
      subtitle1:GoogleFonts.cairo(fontSize: 14,color: Colors.white),
    ),
      splashColor: Colors.black
  );

  static List<BlocProvider>  providers(BuildContext context)=>[
    BlocProvider<AuthCubit>(
      create: (BuildContext context)=> AuthCubit(),
    ),
  ];


}