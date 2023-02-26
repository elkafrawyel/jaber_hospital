import 'package:flutter/material.dart';

import '../../general/widgets/GenScaffold.dart';
import '../../surgeon/screens/sur_notifications/widgets/SurNotificationsWImports.dart';

class CompNotificationsScreen extends StatelessWidget {
  const CompNotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
        back: true,
        title: "Notifications",
        body: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            itemCount: 10,
            itemBuilder: (context, index) => BuildNotificationItem()));
  }
}
