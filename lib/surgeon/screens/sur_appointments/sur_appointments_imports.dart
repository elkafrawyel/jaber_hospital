import 'dart:developer';

import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/widgets/GenScaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../general/constants/MyColors.dart';
import '../../models/apointments_response.dart';
import '../../models/appointment_model.dart';
import '../../resources/SurgeonRepoImports.dart';
import 'tabs/past_appointments/past_appointments.dart';
import 'tabs/upcoming_appointments/upcoming_appointments.dart';
import 'widgets/SurFollowUpsTabBarWImports.dart';

part 'sur_appointments.dart';
part 'tabs/upcoming_appointments/sur_appointments_data.dart';