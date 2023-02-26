import 'package:flutter/material.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'doctor_item_widget.dart';

class ComingAppointments extends StatelessWidget {
  const ComingAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
                title: 'المواعيد القادمة', size: 12, fontWeight: FontWeight.bold),
            MyText(
              title: 'عرض الكل',
              size: 10,
              fontWeight: FontWeight.bold,
              color: MyColors.primary,
              decoration: TextDecoration.underline,
            ),
          ],
        ),
        Container(
          height: 116,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) => DoctorItemWidget(index: index,),
          ),
        ),
      ],
    );
  }
}
