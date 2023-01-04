import 'dart:io';
import 'package:base_flutter/customer/screens/home/HomeImports.dart';
import 'package:base_flutter/general/models/QuestionModel.dart';
import 'package:base_flutter/general/resources/handle_http_methods.dart';
import 'package:base_flutter/general/utilities/http/dio/dio_helper.dart';
import 'package:base_flutter/general/utilities/http/dio/http/GenericHttp.dart';
import 'package:base_flutter/general/utilities/utils_functions/ApiNames.dart';
import 'package:base_flutter/general/models/UserModel.dart';
import 'package:base_flutter/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../blocks/auth_cubit/auth_cubit.dart';
import '../constants/MyColors.dart';
import '../screens/confirm_password/ConfirmPasswordImports.dart';
import '../screens/login/LoginImports.dart';
import '../utilities/utils_functions/Navigator.dart';

part 'GeneralRepository.dart';
part 'GeneralHttpMethods.dart';