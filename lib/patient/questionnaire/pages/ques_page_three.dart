import 'package:flutter/material.dart';

import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';

class QuesPageThree extends StatelessWidget {
  const QuesPageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: MyText(
    title: "Page Three",
    size: 12,
        fontWeight: FontWeight.bold,
    ),);
  }
}
