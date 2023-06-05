import 'dart:convert';
import 'dart:developer';

import 'package:base_flutter/general/utilities/http/dio/dio_helper.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:base_flutter/surgeon/models/dto/medication_dto.dart';
import 'package:base_flutter/surgeon/screens/sur_order_medications/widgets/SurOrderMedicationWidgetImports.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../../general/MyApp.dart';
import '../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/models/company_model.dart';
import '../../../general/network/api_service.dart';
import '../../../general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import '../../../general/utilities/utils_functions/AdaptivePicker.dart';
import '../../../general/utilities/utils_functions/ApiNames.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../../general/utilities/utils_functions/UtilsImports.dart';
import '../../../general/widgets/GenScaffold.dart';
import '../../../general/widgets/app_drop_menu.dart';
import '../../models/comp_medications_response.dart';
import '../../models/companies_response.dart';
import '../../models/company_instruments_response.dart';
import '../../models/dto/pagination_dto.dart';
import '../../models/medication_model.dart';
import '../../models/patient_name_model.dart';
import '../../models/selected_medication_model.dart';
import '../../resources/SurgeonRepoImports.dart';
import '../sur_instruments_order/models/instruments_order_response.dart';
import '../sur_medications_order/sur_medications_order_imports.dart';
import '../sur_notifications/SurNotificationsImports.dart';

part 'sur_order_medications.dart';
part 'sur_order_medications_data.dart';

