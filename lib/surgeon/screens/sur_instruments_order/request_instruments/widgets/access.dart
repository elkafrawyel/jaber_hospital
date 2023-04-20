import 'package:flutter/material.dart';

import '../../../../../general/constants/MyColors.dart';
import '../../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'access_item_widget.dart';
import 'reloads_item_widget.dart';

class AccessWidget extends StatelessWidget {
  AccessWidget({Key? key}) : super(key: key);
  List<String> data = ["item1", "item2", "item3"];

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: MyText(title: 'Access', size: 10, color: Color(0XFF136CFB)),
        backgroundColor: Color(0xFFD3E0F6),
        iconColor: MyColors.primary,
        children:  data.map((data) {
          return ReloadsItemWidget();
        }).toList());
  }
}
