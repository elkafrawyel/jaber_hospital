import 'dart:collection';
import 'dart:convert';

import 'package:base_flutter/general/utilities/http/dio/dio_helper.dart';
import 'package:base_flutter/general/utilities/http/dio/http/GenericHttp.dart';
import 'package:base_flutter/general/utilities/utils_functions/ApiNames.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../customer/model/dto/add_patient_dto.dart';
import '../../general/blocks/user_cubit/user_cubit.dart';
import '../../general/models/UserModel.dart';
import '../../general/utilities/utils_functions/UtilsImports.dart';
import '../models/dto/add_patient_fourth_dto.dart';
import '../models/dto/add_patient_second_dto.dart';
import '../models/dto/add_patient_third_dto.dart';
import '../models/dto/medication_dto.dart';
import '../models/dto/profile_entities.dart';
import '../models/medication_model.dart';
import '../models/medications_orders_model.dart';
import '../models/patient_details_model.dart';
import '../models/patient_model.dart';
import '../models/patient_name_model.dart';
import '../models/surgeon_home_model.dart';

part 'SurgeonHttpMethods.dart';
part 'SurgeonRepository.dart';