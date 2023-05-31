import 'dart:developer';

import 'package:base_flutter/general/widgets/GenScaffold.dart';
import 'package:base_flutter/surgeon/screens/sur_notifications/widgets/SurNotificationsWImports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../company/comp_notifications/notifications_data.dart';
import '../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/models/UserModel.dart';
import '../../../general/models/notification_model.dart';
import '../../../general/models/notifications_response.dart';
import '../../../general/network/api_service.dart';
import '../../../general/utilities/http/dio/http/GenericHttp.dart';
import '../../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/ApiNames.dart';
import '../../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../../general/widgets/loading_widget.dart';
import '../../../patient/models/update_consent_response.dart';
import '../../resources/SurgeonRepoImports.dart';
import '../sur_instruments_order/models/instruments_order_response.dart';

part 'SurNotifications.dart';
part 'SurNotificationsData.dart';