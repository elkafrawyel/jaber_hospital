import 'package:flutter/material.dart';

import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';

class QuesPageSix extends StatelessWidget {
  const QuesPageSix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: MyText(
      title: "Page Six",
      size: 12,
      fontWeight: FontWeight.bold,
    ),);
  }
}
