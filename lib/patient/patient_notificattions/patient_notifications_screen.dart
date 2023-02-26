import 'package:flutter/material.dart';

import '../../general/widgets/GenScaffold.dart';
import '../../surgeon/screens/sur_notifications/widgets/SurNotificationsWImports.dart';
import 'widgets/notification_item.dart';

class PatientNotificationsScreen extends StatelessWidget {
  const PatientNotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GeneralScaffold(
          back: true,
          title: "الإشعارات",
          body: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              itemCount: 10,
              itemBuilder: (context, index) => PatientNotificationItem())),
    );
  }
}
