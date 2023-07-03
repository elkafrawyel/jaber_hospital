import 'package:flutter/material.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';

class InstrumentsItemWidget extends StatelessWidget {
  const InstrumentsItemWidget({Key? key, required this.itemDesc, required this.itemQuantity}) : super(key: key);
  final String? itemDesc;
  final String? itemQuantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(color: MyColors.primary, shape: BoxShape.circle),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: MyText(title: itemDesc ?? "", color: Colors.black, size: 12, fontWeight: FontWeight.bold),
                ),
                MyText(title: itemQuantity ?? "", color: MyColors.primary, size: 13, fontWeight: FontWeight.bold),
              ],
            ),
          )
        ],
      ),
    );
  }
}
