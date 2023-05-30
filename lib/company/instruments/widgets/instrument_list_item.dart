import 'package:flutter/material.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';

class InstrumentsItemWidget extends StatelessWidget {
  const InstrumentsItemWidget({Key? key, required this.itemDesc}) : super(key: key);
  final String? itemDesc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
              color: MyColors.primary,
              shape: BoxShape.circle
            ),
          ),
          const SizedBox(width: 10.0,),
          MyText(
              title: itemDesc??"",
              color:Colors.black,
              size: 12,
              fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
}
