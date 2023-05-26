import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../general/constants/MyColors.dart';
import '../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../general/widgets/GenScaffold.dart';
import '../../res/res.dart';

class QuestionnaireResultScreen extends StatelessWidget {
  const QuestionnaireResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GeneralScaffold(
        back: true,
        title: "الطب النفسي",
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
            SvgPicture.asset(Res.patDoneIllustrationSvg, fit: BoxFit.fill,),
          const SizedBox(height: 28.0),
          MyText(
            title: 'تم إكمال الاستبيان بنجاح!',
            size: 14,
            color: MyColors.primary,
          ),
          const SizedBox(height: 8),
          Row(children: [
            MyText(
              title: 'التقييم:',
              size: 14,
              color: MyColors.primary,
            ),
            MyText(
              title: 'واضح',
              size: 14,
              color: Colors.black,
            ),
          ],),
          ],
        ),
      ),
    ),);
  }
}
