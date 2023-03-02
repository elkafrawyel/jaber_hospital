import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';

class GeneralProgress extends StatelessWidget {
  GeneralProgress({Key? key}) : super(key: key);

  List<String> generalProgressList = [
    "الجراحة", "التغذية", "العلاج الطبيعي", "التعليم", "النفسية"
  ];

  @override
  Widget build(BuildContext context) {
    final size  =MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                  title: 'التقدم العام', size: 12, fontWeight: FontWeight.bold),
            ],
          ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width,
              height: 60,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  // scrollDirection: Axis.horizontal,
                  // shrinkWrap: false,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TimelineTile(
                        axis: TimelineAxis.horizontal,
                        alignment: TimelineAlign.center,
                        isLast: true,
                        indicatorStyle: IndicatorStyle(
                          height: 26,
                          color: MyColors.primary,
                          iconStyle: IconStyle(
                            color: Colors.white,
                            iconData: Icons.check,
                          ),
                        ),
                        beforeLineStyle: LineStyle(
                          color: MyColors.primary,
                          thickness: 6,
                        ),
                        endChild: MyText(title: "الجراحة", size: 9, color: MyColors.primary,),
                      ),
                    ),
                    Expanded(
                      child: TimelineTile(
                        axis: TimelineAxis.horizontal,
                        alignment: TimelineAlign.center,
                        beforeLineStyle: LineStyle(
                          color: MyColors.primary,
                          thickness: 6,
                        ),
                        afterLineStyle: LineStyle(
                          color: MyColors.primary,
                          thickness: 6,
                        ),
                        indicatorStyle:  IndicatorStyle(
                            height: 26,
                            color: MyColors.primary,
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.check,
                            ),
                          ),
                        endChild: MyText(title: "التغذية", size: 9, color: MyColors.primary,),
                      ),
                    ),
                    Expanded(
                      child: TimelineTile(
                        axis: TimelineAxis.horizontal,
                        alignment: TimelineAlign.center,
                        beforeLineStyle: LineStyle(
                          color: MyColors.primary,
                          thickness: 6,
                        ),
                        afterLineStyle: LineStyle(
                          color: MyColors.primary,
                          thickness: 6,
                        ),
                        indicatorStyle:  IndicatorStyle(
                          height: 26,
                          color: MyColors.primary,
                          iconStyle: IconStyle(
                            color: Colors.white,
                            iconData: Icons.check,
                          ),
                        ),
                        endChild: MyText(title: "العلاج الطبيعي", size: 9, color: MyColors.primary,),
                      ),
                    ),
                    Expanded(
                      child: TimelineTile(
                        axis: TimelineAxis.horizontal,
                        alignment: TimelineAlign.center,
                        beforeLineStyle: LineStyle(
                          color: MyColors.primary,
                          thickness: 6,
                        ),
                        afterLineStyle: LineStyle(
                          color: MyColors.primary,
                          thickness: 6,
                        ),
                        indicatorStyle:  IndicatorStyle(
                          height: 26,
                          color: MyColors.primary,
                          iconStyle: IconStyle(
                            color: Colors.white,
                            iconData: Icons.check,
                          ),
                        ),
                        endChild: MyText(title: "التعليم", size: 9, color: MyColors.primary,),
                      ),
                    ),
                    Expanded(
                      child: TimelineTile(
                        axis: TimelineAxis.horizontal,
                        alignment: TimelineAlign.center,
                        isFirst: true,
                        afterLineStyle: LineStyle(
                          color: MyColors.primary,
                          thickness: 6,
                        ),
                        indicatorStyle: IndicatorStyle(
                          height: 26,
                          color: MyColors.primary,
                          iconStyle: IconStyle(
                            color: Colors.white,
                            iconData: Icons.check,
                          ),
                        ),
                        endChild: MyText(title: "النفسية", size: 9, color: MyColors.primary,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // const SizedBox(height: 10),
            // Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           Expanded(
            //             child: Padding(
            //               padding: const EdgeInsets.only(left: 2),
            //               child: Container(),
            //             ),
            //           ),
            //           Expanded(
            //             child: Padding(
            //               padding: const EdgeInsets.only(left: 2),
            //               child:  FittedBox(
            //                 fit: BoxFit.scaleDown,
            //                 child: MyText(
            //                   alien: TextAlign.center,
            //                   title: "التغذية",
            //                   size: 9,
            //                   color: MyColors.primary,
            //                 ),
            //               ),
            //             ),
            //           ),
            //           Expanded(
            //             child: Padding(
            //               padding: const EdgeInsets.only(left: 2),
            //               child:  FittedBox(
            //                 fit: BoxFit.scaleDown,
            //                 child: MyText(
            //                   alien: TextAlign.center,
            //                   title: "العلاج الطبيعي",
            //                   size: 9,
            //                   color: MyColors.primary,
            //                 ),
            //               ),
            //             ),
            //           ),
            //           Expanded(
            //             child: Padding(
            //               padding: const EdgeInsets.only(left: 2),
            //               child: FittedBox(
            //                 fit: BoxFit.scaleDown,
            //                 child: MyText(
            //                   alien: TextAlign.center,
            //                   title: "التعليم",
            //                   size: 9,
            //                   color: MyColors.primary,
            //                 ),
            //               ),
            //             ),
            //           ),
            //           Expanded(
            //             child: Padding(
            //               padding: const EdgeInsets.only(left: 2),
            //               child:  FittedBox(
            //                 fit: BoxFit.scaleDown,
            //                 child: MyText(
            //                   alien: TextAlign.center,
            //                   title: "النفسية",
            //                   size: 9,
            //                   color: MyColors.primary,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),

            Divider(color: Colors.grey),
            const SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                      title: "تفاصيل الجراحة:",
                      size: 10,
                      fontWeight: FontWeight.bold),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: MyColors.primary,
                            radius: 12.0,
                            child: Icon(Icons.check,
                                color: Colors.white,
                                size: 15),
                          ),
                          const SizedBox(width: 4),
                          MyText(title: "الجراحة", size: 9),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:  MyColors.primary,
                            radius: 12.0,
                            child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 15),
                          ),
                          const SizedBox(width: 4),
                          MyText(title: "التنظير", size: 9),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:  MyColors.primary,
                            radius: 12.0,
                            child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 15),
                          ),
                          const SizedBox(width: 4),
                          MyText(title: "الموجات فوق الصوتية", size: 9),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }
}
