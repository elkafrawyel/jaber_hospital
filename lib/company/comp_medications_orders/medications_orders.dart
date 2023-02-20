import 'package:flutter/material.dart';

import '../../general/widgets/GenScaffold.dart';
import 'tabs/completed/completed_orders.dart';
import 'tabs/inProgress/inProgress_orders.dart';
import 'tabs/received/received_medication_orders.dart';
import 'widgets/build_orders_tabBar.dart';

class CompMedicationsOrders extends StatefulWidget {
  const CompMedicationsOrders({Key? key}) : super(key: key);

  @override
  State<CompMedicationsOrders> createState() => _CompMedicationsOrdersState();
}

class _CompMedicationsOrdersState extends State<CompMedicationsOrders> {

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(back: true, title: "Medications Orders", body: DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildMedicationsOrdersTabBar(),
          Expanded(child: TabBarView(children: [
            ReceivedMedicationOrders(),
            InProgressMedicationOrders(),
            CompletedMedicationOrders(),
          ]))
        ],
      ),
    ));
  }
}
