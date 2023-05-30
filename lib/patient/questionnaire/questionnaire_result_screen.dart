import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../general/constants/MyColors.dart';
import '../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../general/utilities/utils_functions/Navigator.dart';
import '../../general/widgets/GenScaffold.dart';
import '../../res/res.dart';
import '../patient_home/home_screen.dart';

class QuestionnaireResultScreen extends StatelessWidget {
  const QuestionnaireResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: MyText(
            title: "الطب النفسي",
            size: 14,
            color: MyColors.primary,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios, color: MyColors.primary,
              size: 25,
            ),
            onPressed: () => Nav.navigateTo(PatientHomeScreen(),
                navigatorType: NavigatorType.pushAndPopUntil),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SvgPicture.asset(
                Res.patDoneIllustrationSvg,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 28.0),
              MyText(
                title: 'تم إكمال الاستبيان بنجاح!',
                size: 14,
                color: MyColors.primary,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
