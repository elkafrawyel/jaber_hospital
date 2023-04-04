import 'package:flutter/material.dart';

import '../../../../../general/constants/MyColors.dart';
import 'access_item_widget.dart';

class OtherStaplingWidget extends StatelessWidget {
  const OtherStaplingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: const Text('Other Stapling'),
        backgroundColor: Color(0xFFD3E0F6),
        iconColor: MyColors.primary,
        children: List.generate(4, (index) => AccessItemWidget()));
  }
}
