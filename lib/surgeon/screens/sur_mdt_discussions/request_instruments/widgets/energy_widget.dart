import 'package:flutter/material.dart';

import '../../../../../general/constants/MyColors.dart';
import '../../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'access_item_widget.dart';
import 'reloads_item_widget.dart';

class EnergyWidget extends StatelessWidget {
  const EnergyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: MyText(title: 'Energy', size: 10, color: Color(0XFF136CFB)),
        backgroundColor: Color(0xFFD3E0F6),
        iconColor: MyColors.primary,
        children: List.generate(4, (index) => ReloadsItemWidget()));
  }
}
