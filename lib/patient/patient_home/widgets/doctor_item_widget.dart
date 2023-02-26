import 'package:flutter/material.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../../res/res.dart';
import '../../education_screen.dart';

class DoctorItemWidget extends StatelessWidget {
  const DoctorItemWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ()=> Nav.navigateTo(EducationScreen(), navigatorType: NavigatorType.push),
      child: Container(
        width: size.width * 0.80,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 6.0),
        decoration: BoxDecoration(
          color: MyColors.textFields,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: MyColors.greyWhite,
              spreadRadius: .1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 68,
              height: 76,
              decoration: BoxDecoration(
                  color: MyColors.primaryLightBg,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Image.asset(Res.doctorImage, width: double.infinity, height: double.infinity, fit: BoxFit.cover,),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                      title: 'د/راضي هاني',
                      size: 13,
                      fontWeight: FontWeight.bold),
                  MyText(title: 'أخصائي تغذية', size: 12, color: Colors.grey),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            Res.imagesVector,
                            scale: 3,
                          ),
                          const SizedBox(width: 5),
                          MyText(
                            title: "14 AUG 2022",
                            overflow: TextOverflow.ellipsis,
                            size: 9,
                            color: MyColors.primary,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            Res.imagesClockIcon,
                            scale: 3,
                          ),
                          const SizedBox(width: 5),
                          MyText(
                            title: "14:30 PM",
                            size: 9,
                            overflow: TextOverflow.ellipsis,
                            color: MyColors.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
