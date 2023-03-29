import 'package:base_flutter/general/MyApp.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/widgets/GeneralAlertDialog.dart';
import 'package:base_flutter/surgeon/models/mdt_patient_model.dart';
import 'package:base_flutter/surgeon/models/patient_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tf_validator/tf_validator.dart';
import 'dart:developer';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import '../../../../general/utilities/tf_custom_widgets/utils/WidgetUtils.dart';
import '../../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../resources/SurgeonRepoImports.dart';
import '../SurMdtDiscussionsImports.dart';
import '../mdt_admin/mdt_admin_data.dart';
import '../tabs/ready_mdt/ready_mdt_data.dart';

part 'BuildAcceptanceDetailsSheet.dart';
part 'BuildBookTimesDialog.dart';
part 'BuildMDTResultSheet.dart';
part 'BuildPatientMDTDurationSheet.dart';
part 'BuildReasonDialog.dart';
part 'BuildSurMdtTabBar.dart';