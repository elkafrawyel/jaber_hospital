import 'package:flutter/material.dart';

import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';

class QuesPageFour extends StatelessWidget {
  const QuesPageFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: MyText(
      title: "Page Four",
      size: 12,
      fontWeight: FontWeight.bold,
    ),);
  }
}
