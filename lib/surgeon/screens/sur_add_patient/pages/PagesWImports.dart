import 'dart:developer';
import 'dart:io';

import 'package:base_flutter/general/utilities/http/dio/dio_helper.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/res/res.dart';
import 'package:base_flutter/surgeon/models/labs_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import '../../../../general/utilities/utils_functions/AdaptivePicker.dart';
import '../../../models/significant_labs_model.dart';
import '../SurAddPatientImports.dart';

part 'AddPatientFifthPage.dart';
part 'AddPatientFirstPage.dart';
part 'AddPatientFourthPage.dart';
part 'AddPatientSecondPage.dart';
part 'AddPatientSeventhPage.dart';
part 'AddPatientSixthPage.dart';
part 'AddPatientThirdPage.dart';