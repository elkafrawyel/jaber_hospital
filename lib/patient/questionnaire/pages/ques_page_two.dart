import 'package:flutter/material.dart';

import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';

class QuesPageTwo extends StatelessWidget {
  const QuesPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: MyText(
      title: "Page Two",
      size: 12,
      fontWeight: FontWeight.bold,
    ),);
  }
}
