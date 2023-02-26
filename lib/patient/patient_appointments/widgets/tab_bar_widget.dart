import 'package:flutter/material.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/utils/WidgetUtils.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
        onTap: (index) {},
        indicatorColor: MyColors.primary,
        labelColor: MyColors.primary,
        indicatorWeight: 3,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelStyle: WidgetUtils.textStyle.copyWith(color: MyColors.grey,fontSize: 14),
        labelStyle: WidgetUtils.textStyle.copyWith(color: MyColors.primary,fontSize: 14,fontWeight: FontWeight.bold),
        unselectedLabelColor: MyColors.grey,
        tabs: [
          Tab(
            child: Text("المواعيد القادمة"),
          ),
          Tab(
            child: Text("المواعيد السابقة"),
          ),
        ]);
  }
}
