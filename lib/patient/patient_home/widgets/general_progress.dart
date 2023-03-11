import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/models/UserModel.dart';
import '../../../general/utilities/http/dio/http/GenericHttp.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/ApiNames.dart';
import '../../../general/widgets/loading_widget.dart';
import '../../models/general_progress_response.dart';
import 'coming_appointments.dart';
import 'operations.dart';
import 'vertical_general_progress.dart';
import 'visits_history.dart';
import 'week_progress.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _GeneralProgressState();
}

class _GeneralProgressState extends State<HomeView> {
  List<String> generalProgressList = [
    "الجراحة",
    "التغذية",
    "العلاج الطبيعي",
    "التعليم",
    "النفسية"
  ];
  late GeneralProgressResponse generalProgress;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    fetchProgressData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return isLoading? Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: MyColors.greyWhite,
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
        height: MediaQuery.of(context).size.height / 6,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: MyColors.white,
        ),
      ),
    ):generalProgress.data?.finalFeedback != "true"
        ? _horizontalProgressView(size)
        : VerticalGeneralProgress(generalProgress: generalProgress,);
  }

  Widget _horizontalProgressView(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ComingAppointments(),
            const SizedBox(height: 12.0),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                          title: 'التقدم العام',
                          size: 12,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Color(0xfff2f2f2),
                        borderRadius: BorderRadius.circular(15)),
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
                                    endChild: MyText(
                                      title: "الجراحة",
                                      size: 9,
                                      color: MyColors.primary,
                                    ),
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
                                    indicatorStyle: IndicatorStyle(
                                      height: 26,
                                      color: MyColors.primary,
                                      iconStyle: IconStyle(
                                        color: Colors.white,
                                        iconData: Icons.check,
                                      ),
                                    ),
                                    endChild: MyText(
                                      title: "التغذية",
                                      size: 9,
                                      color: MyColors.primary,
                                    ),
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
                                    indicatorStyle: IndicatorStyle(
                                      height: 26,
                                      color: MyColors.primary,
                                      iconStyle: IconStyle(
                                        color: Colors.white,
                                        iconData: Icons.check,
                                      ),
                                    ),
                                    endChild: MyText(
                                      title: "العلاج الطبيعي",
                                      size: 9,
                                      color: MyColors.primary,
                                    ),
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
                                    indicatorStyle: IndicatorStyle(
                                      height: 26,
                                      color: MyColors.primary,
                                      iconStyle: IconStyle(
                                        color: Colors.white,
                                        iconData: Icons.check,
                                      ),
                                    ),
                                    endChild: MyText(
                                      title: "التعليم",
                                      size: 9,
                                      color: MyColors.primary,
                                    ),
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
                                    endChild: MyText(
                                      title: "النفسية",
                                      size: 9,
                                      color: MyColors.primary,
                                    ),
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
                        const SizedBox(
                          height: 8,
                        ),
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
                                            color: Colors.white, size: 15),
                                      ),
                                      const SizedBox(width: 4),
                                      MyText(title: "الجراحة", size: 9),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: MyColors.primary,
                                        radius: 12.0,
                                        child: Icon(Icons.check,
                                            color: Colors.white, size: 15),
                                      ),
                                      const SizedBox(width: 4),
                                      MyText(title: "التنظير", size: 9),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: MyColors.primary,
                                        radius: 12.0,
                                        child: Icon(Icons.check,
                                            color: Colors.white, size: 15),
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
            ),
            const SizedBox(height: 12.0),
            OperationsDate(),
            const SizedBox(height: 12.0),
            BuildWeekProgress(),
            const SizedBox(height: 16.0),
            VisitsHistory(),
            const SizedBox(height: 28.0),
          ],
        ),
      ),
    );
  }

  Future<void> fetchProgressData() async {
    setState(() {
      isLoading = true;
    });
    UserModel user = context.read<UserCubit>().state.model;
    generalProgress =
        await GenericHttp<GeneralProgressResponse>(context).callApi(
      name:
          "${ApiNames.patientPathwayPath}?patient_id=${user.userData?[0].sId}",
      returnType: ReturnType.Model,
      methodType: MethodType.Get,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => GeneralProgressResponse.fromJson(json),
    );
    log("surgionVisit=> ${generalProgress.data?.surgionVisit}");
    log("dietationFeedbackDecision=> ${generalProgress.data?.dietationFeedbackDecision}");
    log("feedback=> ${generalProgress.data?.feedback}");
    log("watchedClip=> ${generalProgress.data?.watchedClip}");
    log("finalFeedback=> ${generalProgress.data?.finalFeedback}");
    setState(() {
      isLoading = false;
    });
  }
}
