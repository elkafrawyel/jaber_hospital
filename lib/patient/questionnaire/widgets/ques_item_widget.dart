import 'package:flutter/material.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';

class QuestionItemWidget extends StatelessWidget {
  const QuestionItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(title: "الطب النفسي", size: 11, color: MyColors.black, fontWeight: FontWeight.bold,),
        ],
      ),
    );
  }
}
