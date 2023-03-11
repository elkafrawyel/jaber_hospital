import 'package:flutter/material.dart';

import '../../general/widgets/GenScaffold.dart';

class QuestionnaireCompletedScreen extends StatelessWidget {
  const QuestionnaireCompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GeneralScaffold(
        back: true,
        title: "الطب النفسي",
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

          ],
        ),
      ),
    );
  }
}
