import 'dart:developer';

import 'package:base_flutter/general/widgets/GenScaffold.dart';
import 'package:base_flutter/surgeon/screens/sur_notifications/widgets/SurNotificationsWImports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../company/comp_notifications/notifications_data.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/models/notification_model.dart';
import '../../../general/models/notifications_response.dart';
import '../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/widgets/loading_widget.dart';
import '../../resources/SurgeonRepoImports.dart';

part 'SurNotifications.dart';
part 'SurNotificationsData.dart';