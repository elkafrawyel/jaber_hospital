import 'dart:developer';

import 'package:base_flutter/general/resources/GeneralRepoImports.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/utils/CustomButtonAnimation.dart';
import 'package:base_flutter/general/widgets/AuthScaffold.dart';
import 'package:base_flutter/general/widgets/HeaderLogo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../res/res.dart';
import '../../blocks/user_cubit/user_cubit.dart';
import '../../utilities/http/dio/modals/LoadingDialog.dart';
import '../../utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import 'widgets/LoginWidgetsImports.dart';

part 'Login.dart';
part 'LoginData.dart';
