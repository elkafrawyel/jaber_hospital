import 'package:flutter/material.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/utilities/tf_custom_widgets/utils/WidgetUtils.dart';
import '../../../../general/widgets/GenScaffold.dart';
import 'tabs/ready/all_ready_patients.dart';
import 'tabs/today_patients/mdt_todays_patient.dart';

class MdtAdmin extends StatefulWidget {
  const MdtAdmin({Key? key}) : super(key: key);

  @override
  State<MdtAdmin> createState() => _MdtAdminState();
}

class _MdtAdminState extends State<MdtAdmin> with SingleTickerProviderStateMixin{
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      back: true,
      title: "MDT (Admin)",
      body: Column(
        children: [
          TabBar(
              controller: tabController,
              onTap: (index) {},
              indicatorColor: MyColors.primary,
              labelColor: MyColors.primary,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelStyle: WidgetUtils.textStyle
                  .copyWith(color: MyColors.grey, fontSize: 14),
              labelStyle: WidgetUtils.textStyle.copyWith(
                  color: MyColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              unselectedLabelColor: MyColors.grey,
              tabs: [
                Tab(
                  child: Text("Today's Patients"),
                ),
                Tab(
                  child: Text("Ready Patients"),
                ),
              ]),
          Expanded(
            child: TabBarView(
                controller: tabController,
                children: [
                  MdtTodaysPatients(),
                  AllReadyPatients(),
                ]),
          )
        ],
      ),
    );
  }
}
