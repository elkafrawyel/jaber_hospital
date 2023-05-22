import 'package:base_flutter/general/MyApp.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:base_flutter/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:base_flutter/general/widgets/GenScaffold.dart';
import 'package:base_flutter/res/res.dart';
import 'package:base_flutter/surgeon/models/medication_model.dart';
import 'package:base_flutter/surgeon/screens/sur_medications_order/widgets/SurMedicationOrderWImports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/models/company_model.dart';
import '../../../general/utilities/tf_custom_widgets/utils/WidgetUtils.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../models/medications_orders_model.dart';
import '../../resources/SurgeonRepoImports.dart';
import '../sur_medication_request_details/sur_medication_request_details_imports.dart';
import '../sur_order_medications/sur_order_medications_imports.dart';

part 'sur_medications_order.dart';
part 'sur_medications_order_data.dart';