import 'package:flutter/material.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key, required this.title}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: MyColors.primaryLightBg,
        // borderRadius: BorderRadius.circular(10),
        // border: Border.all(color: MyColors.greyWhite),
      ),
      alignment: Alignment.centerLeft,
      child:MyText(
          title: title??"",
          size: 13,
          fontWeight: FontWeight.bold,
          color: MyColors.primary
      ),
    );
  }
}
