import 'dart:developer';

import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/surgeon/screens/sur_mdt_discussions/specific_day_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/widgets/loading_widget.dart';
import '../../../models/mdt_patient_model.dart';
import '../../../models/mdt_patients_response.dart';
import '../SurMdtDiscussionsImports.dart';
import '../widgets/SurMdtDiscussionsWImports.dart';
import 'booked_mdt/booked_mdt_data.dart';
import 'discussion_mdt/decision_mdt_data.dart';
import 'ready_mdt/ready_mdt_data.dart';

part 'BuildResultDecision.dart';
part 'booked_mdt/booked_mdt.dart';
part 'discussion_mdt/decision_mdt.dart';
part 'ready_mdt/ready_mdt.dart';