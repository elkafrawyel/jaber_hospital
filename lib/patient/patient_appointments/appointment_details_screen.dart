import 'package:flutter/material.dart';

import '../../general/constants/MyColors.dart';
import '../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../general/widgets/GenScaffold.dart';
import '../../res/res.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  const AppointmentDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GeneralScaffold(
        back: true,
        title: "تفاصيل الميعاد",
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: const EdgeInsets.all(12),
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
              child: Column(
                children: [
                  Row(
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
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 6),
                  Divider(color: Colors.grey,),
                  const SizedBox(height: 6),
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
            ),
            Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyText(title: "التقدم العام", size: 12, color: MyColors.primary,),
                  const SizedBox(height: 6.0),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 7,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            color: Color(0xff136CFB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                Res.imagesWeightIcon,
                                scale: 3,
                                width: 20,
                                height: 20,
                                fit: BoxFit.fill,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 5),
                              MyText(
                                title: '0',
                                size: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              Expanded(
                                child: Center(
                                  child: MyText(
                                      alien: TextAlign.center,
                                      title: 'الوزن الجديد',
                                      size: 9,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 7,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            color: Color(0xff00116E),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                Res.imagesHeightIcon,
                                scale: 3,
                                width: 20,
                                height: 20,
                                fit:BoxFit.cover,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 5),
                              MyText(
                                title: '0',
                                size: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              Expanded(
                                child: Center(
                                  child: MyText(
                                      alien: TextAlign.center,
                                      title: 'الطول الجديد',
                                      size: 9,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 7,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            color: Color(0xff455BD8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                  Res.imagesWeightLossIcon,
                                  scale: 3,
                                  width: 20,
                                  height: 20,
                                  color: Colors.white,
                                  fit: BoxFit.cover
                              ),
                              const SizedBox(height: 5),
                              MyText(
                                title: '0',
                                size: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              Expanded(
                                child: Center(
                                  child: FittedBox(
                                    child: MyText(
                                        alien: TextAlign.center,
                                        title: 'سعرات حرارية',
                                        size: 9,
                                        // overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 7,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            color: Color(0xff24C647),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                  Res.imagesStepsIcon,
                                  scale: 3,
                                  width: 20,
                                  height: 20,
                                  color: Colors.white,
                                  fit: BoxFit.cover
                              ),
                              const SizedBox(height: 5),
                              MyText(
                                title: '0',
                                size: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              Expanded(
                                child: Center(
                                  child: FittedBox(
                                    child: MyText(
                                        alien: TextAlign.center,
                                        title: 'خطوات تحركت',
                                        size: 9,
                                        // overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 7,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            color: Color(0xffEB7826),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                Res.imagesMinutesIcon,
                                scale: 3,
                                width: 20,
                                height: 20,
                                fit:BoxFit.cover,
                              ),
                              const SizedBox(height: 5),
                              MyText(
                                title: '0',
                                size: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              Expanded(
                                child: Center(
                                  child: MyText(
                                      alien: TextAlign.center,
                                      title: 'دقيقة مقضية',
                                      size: 9,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 7,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            color: Color(0xffD84545),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                Res.caloriesIcon,
                                scale: 3,
                                width: 20,
                                height: 20,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(height: 5),
                              MyText(
                                title: '0',
                                size: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              Expanded(
                                child: Center(
                                  child: MyText(
                                      alien: TextAlign.center,
                                      title: 'سعرات محروقة',
                                      size: 9,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
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
