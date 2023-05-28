import 'dart:io';

import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/screens/change_password/ChangePasswordImports.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:base_flutter/general/widgets/GenScaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../general/blocks/auth_cubit/auth_cubit.dart';
import '../../../general/blocks/lang_cubit/lang_cubit.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/models/UserModel.dart';
import '../../../general/screens/login/LoginImports.dart';
import '../../../general/utilities/http/dio/http/GenericHttp.dart';
import '../../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../../general/utilities/http/dio/utils/GlobalState.dart';
import '../../../general/utilities/utils_functions/ApiNames.dart';
import '../../../general/utilities/utils_functions/UtilsImports.dart';
import '../../../res/res.dart';
import '../sur_patient_details/app_dialog.dart';
import '../sur_profile/SurProfileImports.dart';

part 'SurAccountSetting.dart';
part 'SurAccountSettingData.dart';