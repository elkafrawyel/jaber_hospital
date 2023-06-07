import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../res/res.dart';
import 'home_data.dart';
import 'widgets/BuildHomeDrawer.dart';
import 'widgets/build_in_progress_orders.dart';
import 'widgets/build_new_orders.dart';
import 'widgets/com_appBar.dart';
import 'widgets/overall_progress.dart';

class ComHomeScreen extends StatefulWidget {
  const ComHomeScreen({Key? key}) : super(key: key);

  @override
  State<ComHomeScreen> createState() => _ComHomeScreenState();
}

class _ComHomeScreenState extends State<ComHomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    CompHomeData().init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildComHomeAppBar(),
      drawer: BuildCompHomeDrawer(),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        children: [
          BuildNewOrders(),
          const SizedBox(height: 8.0),
          BuildInProgressOrders(),
          BuildOverallProgress(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: MyText(
                title: 'Orders Statistics',
                size: 12,
                fontWeight: FontWeight.bold),
          ),
          SvgPicture.asset(Res.surBarChartSvg, fit: BoxFit.fill,),
          const SizedBox(height: 28.0),
        ],
      ),
    );
  }
}
