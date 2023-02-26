import 'package:flutter/material.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../res/res.dart';

class AppointmentItemWidget extends StatelessWidget {
  const AppointmentItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Container(
        width: size.width * 0.76,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.only(right: 10),
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
              decoration: BoxDecoration(
                  color: MyColors.primaryLightBg,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Image.asset(Res.doctorImage, width: 68, height: 86, fit: BoxFit.fill,),
            ),
            const SizedBox(width: 10),
            Column(
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
                    const SizedBox(width: 30),
                    Row(
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
            )
          ],
        ),
      ),
    );
  }
}
