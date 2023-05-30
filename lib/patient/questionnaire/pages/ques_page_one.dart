import 'package:flutter/material.dart';

import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';

class QuesPageOne extends StatelessWidget {
  const QuesPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: MyText(
      title: "Page ONE",
      size: 12,
      fontWeight: FontWeight.bold,
    ),);
  }
}
