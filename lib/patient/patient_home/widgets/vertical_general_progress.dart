import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../education_screen.dart';
import '../../models/general_progress_response.dart';
import '../../questionnaire/questionaire_screen.dart';
import 'coming_appointments.dart';

class VerticalGeneralProgress extends StatelessWidget {
  const VerticalGeneralProgress({Key? key, required this.generalProgress}) : super(key: key);
  final GeneralProgressResponse generalProgress;

  @override
  Widget build(BuildContext context) {
    bool surgionVisit = generalProgress.data!.surgionVisit ?? false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ComingAppointments(),
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MyText(title: 'التقدم العام', size: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TimelineTile(
                    axis: TimelineAxis.vertical,
                    alignment: TimelineAlign.start,
                    isFirst: true,
                    indicatorStyle: IndicatorStyle(
                      width: 36,
                      height: 36,
                      drawGap: true,
                      indicator: Container(
                        decoration: BoxDecoration(
                          color: (generalProgress.data?.egd ?? false) &&
                                  (generalProgress.data?.ultrasound ?? false) &&
                                  (generalProgress.data?.surgionVisit ?? false)
                              ? MyColors.primary
                              : Colors.red,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: surgionVisit
                            ? Icon(Icons.check, color: Colors.white)
                            : MyText(title: "1", size: 11, color: Colors.white),
                      ),
                    ),
                    beforeLineStyle: LineStyle(
                      color: (generalProgress.data?.egd ?? false) &&
                              (generalProgress.data?.ultrasound ?? false) &&
                              (generalProgress.data?.surgionVisit ?? false)
                          ? MyColors.primary
                          : Colors.red,
                      thickness: 6,
                    ),
                    endChild: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MyText(
                            title: "الجراحة",
                            size: 12,
                            color: (generalProgress.data?.egd ?? false) &&
                                    (generalProgress.data?.ultrasound ?? false) &&
                                    (generalProgress.data?.surgionVisit ?? false)
                                ? MyColors.primary
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        generalProgress.data?.surgionVisit == true ? MyColors.primary : Colors.red,
                                    radius: 9.0,
                                    child: Icon(generalProgress.data?.surgionVisit == true ? Icons.check : Icons.close,
                                        color: Colors.white, size: 14),
                                  ),
                                  const SizedBox(width: 4),
                                  MyText(title: "الجراحة", size: 9),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: generalProgress.data?.egd == true ? MyColors.primary : Colors.red,
                                    radius: 9.0,
                                    child: Icon(generalProgress.data?.egd == true ? Icons.check : Icons.close,
                                        color: Colors.white, size: 14),
                                  ),
                                  const SizedBox(width: 4),
                                  MyText(title: "التنظير", size: 9),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        generalProgress.data?.ultrasound == true ? MyColors.primary : Colors.red,
                                    radius: 9.0,
                                    child: Icon(generalProgress.data?.ultrasound == true ? Icons.check : Icons.close,
                                        color: Colors.white, size: 14),
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
                  ),
                ),
                Expanded(
                  child: TimelineTile(
                    axis: TimelineAxis.vertical,
                    alignment: TimelineAlign.start,
                    beforeLineStyle: LineStyle(
                      color: generalProgress.data?.dietationFeedbackDecision == 'Clear' ? MyColors.primary : Colors.red,
                      thickness: 6,
                    ),
                    afterLineStyle: LineStyle(
                      color: generalProgress.data?.dietationFeedbackDecision == 'Clear' ? MyColors.primary : Colors.red,
                      thickness: 6,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 36,
                      height: 36,
                      drawGap: true,
                      indicator: Container(
                        decoration: BoxDecoration(
                          color: generalProgress.data?.dietationFeedbackDecision == 'Clear'
                              ? MyColors.primary
                              : Colors.red,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: generalProgress.data?.dietationFeedbackDecision == 'Clear'
                            ? Icon(Icons.check, color: Colors.white)
                            : MyText(title: "2", size: 11, color: Colors.white),
                      ),
                    ),
                    endChild: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MyText(
                            title: "التغذية",
                            size: 12,
                            color: generalProgress.data?.dietationFeedbackDecision == 'Clear'
                                ? MyColors.primary
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TimelineTile(
                    axis: TimelineAxis.vertical,
                    alignment: TimelineAlign.start,
                    beforeLineStyle: LineStyle(
                      color: generalProgress.data?.feedback == 'Clear' ? MyColors.primary : Colors.red,
                      thickness: 6,
                    ),
                    afterLineStyle: LineStyle(
                      color: generalProgress.data?.feedback == 'Clear' ? MyColors.primary : Colors.red,
                      thickness: 6,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 36,
                      height: 36,
                      color: generalProgress.data?.feedback == 'Clear' ? MyColors.primary : Colors.red,
                      indicator: Container(
                        decoration: BoxDecoration(
                          color: generalProgress.data?.feedback == 'Clear' ? MyColors.primary : Colors.red,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: generalProgress.data?.feedback == 'Clear'
                            ? Icon(Icons.check, color: Colors.white)
                            : MyText(title: "3", size: 11, color: Colors.white),
                      ),
                    ),
                    endChild: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MyText(
                            title: "العلاج الطبيعي",
                            size: 12,
                            color: generalProgress.data?.feedback == 'Clear' ? MyColors.primary : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          // MyText(
                          //   title: "تم الإنهاء في 25 أغسطس 2022",
                          //   size: 9,
                          //   color: MyColors.black,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   mainAxisSize: MainAxisSize.min,
                          //   children: [
                          //     MyText(
                          //       title: "النتيجة:",
                          //       size: 9,
                          //       color: MyColors.black,
                          //     ),
                          //     MyText(
                          //       title: "زيارة ثانية في 25 سبتمبر 2022",
                          //       size: 9,
                          //       color: MyColors.primary,
                          //     ),
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TimelineTile(
                    axis: TimelineAxis.vertical,
                    alignment: TimelineAlign.start,
                    beforeLineStyle: LineStyle(
                      color: (generalProgress.data?.watchedClip ?? false) ? MyColors.primary : Colors.red,
                      thickness: 6,
                    ),
                    afterLineStyle: LineStyle(
                      color: (generalProgress.data?.watchedClip ?? false) ? MyColors.primary : Colors.red,
                      thickness: 6,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 36,
                      height: 50,
                      indicator: Container(
                        decoration: BoxDecoration(
                          color: (generalProgress.data?.watchedClip ?? false) ? MyColors.primary : Colors.red,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: (generalProgress.data?.watchedClip ?? false)
                            ? Icon(Icons.check, color: Colors.white)
                            : MyText(title: "4", size: 11, color: Colors.white),
                      ),
                    ),
                    endChild: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: [
                          MyText(
                            title: "التعليم",
                            size: 12,
                            color: (generalProgress.data?.watchedClip ?? false) ? MyColors.primary : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          if (!(generalProgress.data?.watchedClip ?? false))
                            DefaultButton(
                              width: 200,
                              height: 35,
                              title: "مشاهدة الفيديو التعليمي",
                              onTap: () => Nav.navigateTo(
                                EducationScreen(),
                                navigatorType: NavigatorType.push,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TimelineTile(
                    axis: TimelineAxis.vertical,
                    alignment: TimelineAlign.start,
                    isLast: true,
                    beforeLineStyle: LineStyle(
                      color: generalProgress.data?.finalFeedback == 'Clear' ? MyColors.primary : Colors.red,
                      thickness: 6,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 36,
                      height: 36,
                      indicator: Container(
                        decoration: BoxDecoration(
                          color: generalProgress.data?.finalFeedback == 'Clear' ? MyColors.primary : Colors.red,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: generalProgress.data?.finalFeedback == 'Clear'
                            ? Icon(Icons.check, color: Colors.white)
                            : MyText(title: "5", size: 11, color: Colors.white),
                      ),
                    ),
                    endChild: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyText(
                            title: "الطب النفسي",
                            size: 12,
                            color: generalProgress.data?.finalFeedback == 'Clear' ? MyColors.primary : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          if (generalProgress.data?.finalFeedback != 'Clear')
                            DefaultButton(
                              height: 35,
                              title: "إكمال الاستبيان",
                              onTap: () => Nav.navigateTo(
                                QuestionnaireCompletedScreen(),
                                navigatorType: NavigatorType.push,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
