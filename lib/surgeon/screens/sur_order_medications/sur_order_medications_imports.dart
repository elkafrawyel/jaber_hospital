import 'dart:convert';
import 'dart:developer';

import 'package:base_flutter/general/utilities/http/dio/dio_helper.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:base_flutter/surgeon/models/dto/medication_dto.dart';
import 'package:base_flutter/surgeon/screens/sur_order_medications/widgets/SurOrderMedicationWidgetImports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../../general/MyApp.dart';
import '../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import '../../../general/utilities/utils_functions/AdaptivePicker.dart';
import '../../../general/utilities/utils_functions/UtilsImports.dart';
import '../../../general/widgets/GenScaffold.dart';
import '../../models/dto/pagination_dto.dart';
import '../../models/medication_model.dart';
import '../../models/patient_name_model.dart';
import '../../resources/SurgeonRepoImports.dart';

part 'sur_order_medications.dart';
part 'sur_order_medications_data.dart';

