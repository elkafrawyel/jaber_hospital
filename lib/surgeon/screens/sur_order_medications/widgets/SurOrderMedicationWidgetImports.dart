import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_validator/tf_validator.dart';

import '../../../../general/MyApp.dart';
import '../../../../general/constants/MyColors.dart';
import '../../../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../../../general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../models/medication_model.dart';
import '../../../models/patient_name_model.dart';
import '../../../reuseable_widgets/BuildPaginationLoadingIndicator.dart';
import '../sur_order_medications_imports.dart';

part 'BuildPatientNameBottomSheet.dart';
part 'BuildMedicationBottomSheet.dart';