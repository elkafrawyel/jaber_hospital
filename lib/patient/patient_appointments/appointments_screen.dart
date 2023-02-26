import 'package:flutter/material.dart';

import '../../general/widgets/GenScaffold.dart';
import 'tabs/completed/completed_appointments.dart';
import 'tabs/received/received_appointments.dart';
import 'widgets/tab_bar_widget.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GeneralScaffold(back: true, title: "المواعيد", body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBarWidget(),
            Expanded(child: TabBarView(children: [
              PatientReceivedAppointments(),
              PatientCompletedAppointments(),
            ]))
          ],
        ),
      )),
    );
  }
}
