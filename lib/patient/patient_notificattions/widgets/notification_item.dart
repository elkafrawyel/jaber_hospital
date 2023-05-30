import 'package:flutter/material.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';


class PatientNotificationItem extends StatelessWidget {
  const PatientNotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: MyColors.greyWhite)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Icon(Icons.circle,color: MyColors.primary,size: 10,),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  title: "نص الاشعار٫٫٫٫٫",
                  size: 12,
                  color: MyColors.black,
                ),
                const SizedBox(
                  height: 5,
                ),
                MyText(
                  title: "13:29 PM",
                  size: 10,
                  color: MyColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
