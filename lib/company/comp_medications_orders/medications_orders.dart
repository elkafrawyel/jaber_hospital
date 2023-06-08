import 'package:flutter/material.dart';

import '../../general/widgets/GenScaffold.dart';
import 'medications_orders_data.dart';
import 'tabs/completed/completed_orders.dart';
import 'tabs/inProgress/inProgress_orders.dart';
import 'tabs/received/received_medication_orders.dart';
import 'widgets/build_orders_tabBar.dart';

class CompMedicationsOrders extends StatefulWidget {
  const CompMedicationsOrders({Key? key}) : super(key: key);

  @override
  State<CompMedicationsOrders> createState() => _CompMedicationsOrdersState();
}

class _CompMedicationsOrdersState extends State<CompMedicationsOrders> with SingleTickerProviderStateMixin {
  MedicationsOrdersData medicationsOrdersData = MedicationsOrdersData();

  @override
  void initState() {
    // TODO: implement initState
    medicationsOrdersData.init(context, this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(back: true, title: "Medications Orders", body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildMedicationsOrdersTabBar(),
        Expanded(child: TabBarView(
            controller: medicationsOrdersData.tabController,
            children: [
          ReceivedMedicationOrders(),
          InProgressMedicationOrders(),
          CompletedMedicationOrders(),
        ]))
      ],
    ),);
  }
}
