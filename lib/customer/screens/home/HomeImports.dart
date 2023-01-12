import 'dart:developer';

import 'package:base_flutter/general/resources/GeneralRepoImports.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/widgets/GeneralAlertDialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../../../general/MyApp.dart';
import '../../../general/blocks/lang_cubit/lang_cubit.dart';
import '../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../general/constants/GlobalNotification.dart';
import '../../../general/constants/MyColors.dart';

part 'Home.dart';
part 'HomeData.dart';