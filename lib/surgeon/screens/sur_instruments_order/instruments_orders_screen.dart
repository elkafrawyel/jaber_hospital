import 'package:flutter/material.dart';

import '../../../general/MyApp.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/utils/WidgetUtils.dart';
import '../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../../general/widgets/GenScaffold.dart';
import '../../models/medications_orders_model.dart';
import '../../resources/SurgeonRepoImports.dart';
import 'request_instruments/request_instruments_screen.dart';
import 'tabs/completed/completed_view.dart';
import 'tabs/in_progress/im_progress_view.dart';
import 'tabs/routed_to_company/routed_to_company.dart';

class SurInstrumentsOrdersScreen extends StatefulWidget {
  const SurInstrumentsOrdersScreen({Key? key}) : super(key: key);

  @override
  State<SurInstrumentsOrdersScreen> createState() => _SurInstrumentsOrdersScreenState();
}

class _SurInstrumentsOrdersScreenState extends State<SurInstrumentsOrdersScreen> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      back: true,
      title: "Instruments Order",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                Tab(child: Text("Routed To\nCompany", textAlign: TextAlign.center,),),
                Tab(child: Text("In Progress"),),
                Tab(child: Text("Completed"),),
              ]),
          Expanded(
            child: TabBarView(
                controller: tabController,
                children: [
                  RoutedToCompanyView(),
                  InProgressView(),
                  CompletedView(),
                ]),
          ),
        ],
      ),
    );
  }
}
