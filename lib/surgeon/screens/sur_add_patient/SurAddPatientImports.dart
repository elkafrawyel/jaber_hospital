import 'dart:io';

import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/surgeon/models/dto/add_patient_fifth_dto.dart';
import 'package:base_flutter/surgeon/models/dto/add_patient_sixth_dto.dart';
import 'package:base_flutter/surgeon/resources/SurgeonRepoImports.dart';
import 'package:base_flutter/surgeon/screens/sur_add_patient/pages/PagesWImports.dart';
import 'package:base_flutter/surgeon/screens/sur_add_patient/widgets/SurAddPatientWImports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../customer/model/dto/add_patient_dto.dart';
import '../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/models/UserModel.dart';
import '../../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../../general/utilities/utils_functions/UtilsImports.dart';
import '../../models/add_patient_models.dart';
import '../../models/dto/add_patient_fourth_dto.dart';
import '../../models/dto/add_patient_second_dto.dart';
import '../../models/dto/add_patient_third_dto.dart';
import '../../models/labs_response.dart';
import '../../models/significant_labs_model.dart';

part 'SurAddPatient.dart';
part 'SurAddPatientData.dart';