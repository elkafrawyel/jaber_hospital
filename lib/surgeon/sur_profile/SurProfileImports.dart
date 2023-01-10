import 'dart:io';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/models/LocationModel.dart';
import 'package:base_flutter/general/screens/location_address/LocationAddressImports.dart';
import 'package:base_flutter/general/screens/location_address/location_cubit/location_cubit.dart';
import 'package:base_flutter/general/utilities/http/dio/dio_helper.dart';
import 'package:base_flutter/general/utilities/http/dio/utils/GlobalState.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/Inputs/custom_dropDown/CustomDropDown.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/utils/CustomButtonAnimation.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:base_flutter/surgeon/sur_profile/widgets/profileWidgetImports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../general/MyApp.dart';
import '../../../general/models/UserModel.dart';
import '../../general/widgets/GenScaffold.dart';


part 'SurProfile.dart';
part 'SurProfileData.dart';