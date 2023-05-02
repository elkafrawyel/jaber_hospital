import 'package:flutter/material.dart';

import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';

class QuesPageFive extends StatelessWidget {
  const QuesPageFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: MyText(
      title: "Page Five",
      size: 12,
      fontWeight: FontWeight.bold,
    ),);
  }
}
