import 'package:base_flutter/general/MyApp.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:base_flutter/general/widgets/GenScaffold.dart';
import 'package:base_flutter/general/widgets/GeneralAlertDialog.dart';
import 'package:base_flutter/res/res.dart';
import 'package:base_flutter/surgeon/resources/SurgeonRepoImports.dart';
import 'package:base_flutter/surgeon/screens/sur_add_patient/SurAddPatientImports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:tf_validator/tf_validator.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import '../../models/patient_details_model.dart';
import '../sur_order_medications/sur_order_medications_imports.dart';
import 'app_dialog.dart';

part   'SurPatientDetails.dart';
part   'SurPatientDetailsData.dart';
