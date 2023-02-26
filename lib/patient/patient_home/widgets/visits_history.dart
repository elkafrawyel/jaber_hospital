import 'package:flutter/material.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'visits_item_widget.dart';

class VisitsHistory extends StatelessWidget {
  const VisitsHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
                title: 'تاريخ الزيارات', size: 12, fontWeight: FontWeight.bold),
            MyText(
              title: 'عرض الكل',
              size: 10,
              fontWeight: FontWeight.bold,
              color: MyColors.primary,
              decoration: TextDecoration.underline,
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(4, (index) => VisitsItemWidget(index: index)),
            ],
          ),
        ),
        // Container(
        //   height: 176,
        //   child: ListView.builder(
        //     padding: const EdgeInsets.symmetric(vertical: 10),
        //     scrollDirection: Axis.horizontal,
        //     itemCount: 4,
        //     itemBuilder: (context, index) => VisitsItemWidget(index: index,),
        //   ),
        // ),
      ],
    );
  }
}
