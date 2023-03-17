// @dart=2.9

import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/theme_cubit/theme_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb, kReleaseMode;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'general/MyApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Firebase.initializeApp();
  }
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeCubit>(
        create: (BuildContext context) => ThemeCubit(),
      ),
      BlocProvider<LangCubit>(
        create: (BuildContext context) => LangCubit(),
      ),
    ],
    child: BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return DevicePreview(
          enabled: !kReleaseMode,
            builder: (context) => MyApp(isDark: themeState.isDark));
      },
    ),
  ));
}
