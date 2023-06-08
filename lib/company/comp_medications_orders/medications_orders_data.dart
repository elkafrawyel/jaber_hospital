import 'dart:developer';

import 'package:flutter/material.dart';

import '../../general/models/notification_model.dart';
import '../../general/models/notifications_response.dart';
import '../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../resources/CompanyRepository.dart';

class MedicationsOrdersData{
  MedicationsOrdersData._();
  static final MedicationsOrdersData _instance = MedicationsOrdersData._();
  factory MedicationsOrdersData() => _instance;

  late TabController tabController;

  void init(BuildContext context, SingleTickerProviderStateMixin ticker) {
    tabController = TabController(length: 3, vsync: ticker);
  }
}