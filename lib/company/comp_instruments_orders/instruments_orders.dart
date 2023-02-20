import 'package:flutter/material.dart';

import '../../general/widgets/GenScaffold.dart';
import 'tabs/completed/completed_orders.dart';
import 'tabs/inProgress/inProgress_orders.dart';
import 'tabs/received/received_orders.dart';
import 'widgets/build_orders_tabBar.dart';

class CompOrdersScreen extends StatefulWidget {
  const CompOrdersScreen({Key? key}) : super(key: key);

  @override
  State<CompOrdersScreen> createState() => _CompOrdersScreenState();
}

class _CompOrdersScreenState extends State<CompOrdersScreen> {

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(back: true, title: "Instruments Orders", body: DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildCompOrdersTabBar(),
          Expanded(child: TabBarView(children: [
            ReceivedOrders(),
            InProgressOrders(),
            CompletedOrders(),
          ]))
        ],
      ),
    ));
  }
}
