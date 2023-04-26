import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:base_flutter/surgeon/screens/sur_patient_details/SurPatientDetailsImports.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../models/patient_model.dart';

class BuildPreOpItem extends StatelessWidget {
  final PatientModel patientModel;
  final VoidCallback togglePathway;
  final VoidCallback onPatientArchive;

  const BuildPreOpItem({
    Key? key,
    required this.patientModel,
    required this.togglePathway,
    required this.onPatientArchive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () async {
              bool? result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SurPatientDetails(patientId: patientModel.sId ?? ''),
                ),
              );

              if (result ?? false) {
                onPatientArchive();
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  CachedImage(
                    url: patientModel.image ?? 'https://picsum.photos/180',
                    height: 60,
                    width: 60,
                    borderRadius: BorderRadius.circular(10),
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: MyText(
                                title: '${patientModel.fNameEn ?? ""} ${patientModel.lNameEn ?? ""}',
                                size: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            patientModel.overallStatus ?? false
                                ? Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: Color(0xffaff7c3),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: MyText(
                                      title: 'Ready',
                                      size: 9,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: Color(0xffFBD6BC),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: MyText(
                                      title: 'Not Ready',
                                      size: 9,
                                      color: Color(0xFFEB7826),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ],
                        ),
                        Row(
                          children: [
                            MyText(
                              title: 'Surgeon : ',
                              size: 11,
                              color: MyColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            MyText(
                              title:
                                  '${patientModel.surgeonId?.firstNameEn ?? ""} ${patientModel.surgeonId?.lastNameEn ?? ""}',
                              size: 11,
                              color: MyColors.grey,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MyText(
                              title: 'Dietitian : ',
                              size: 11,
                              color: MyColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            MyText(
                              title:
                                  '${patientModel.dietationId?.firstNameEn ?? "-"} ${patientModel.dietationId?.lastNameEn ?? "-"}',
                              size: 11,
                              color: MyColors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(color: MyColors.grey),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 58,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TimelineTile(
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.center,
                          isFirst: true,
                          indicatorStyle: IndicatorStyle(
                            height: 26,
                            color: (patientModel.egd ?? false) &&
                                    (patientModel.ultrasound ?? false) &&
                                    (patientModel.surgionVisit ?? false)
                                ? MyColors.primary
                                : Colors.red,
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.check,
                            ),
                          ),
                          beforeLineStyle: LineStyle(
                            color: (patientModel.egd ?? false) &&
                                    (patientModel.ultrasound ?? false) &&
                                    (patientModel.surgionVisit ?? false)
                                ? MyColors.primary
                                : Colors.red,
                            thickness: 6,
                          ),
                          endChild: MyText(
                            title: "Surgery OPD",
                            size: 8,
                            color: (patientModel.egd ?? false) &&
                                    (patientModel.ultrasound ?? false) &&
                                    (patientModel.surgionVisit ?? false)
                                ? MyColors.primary
                                : Colors.red,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TimelineTile(
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.center,
                          beforeLineStyle: LineStyle(
                            color: patientModel.dietationFeedbackDecision == 'Clear' ? MyColors.primary : Colors.red,
                            thickness: 6,
                          ),
                          afterLineStyle: LineStyle(
                            color: patientModel.dietationFeedbackDecision == 'Clear' ? MyColors.primary : Colors.red,
                            thickness: 6,
                          ),
                          indicatorStyle: IndicatorStyle(
                            height: 26,
                            color: patientModel.dietationFeedbackDecision == 'Clear' ? MyColors.primary : Colors.red,
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.check,
                            ),
                          ),
                          endChild: MyText(
                            title: "Dietitian",
                            size: 8,
                            color: patientModel.dietationFeedbackDecision == 'Clear' ? MyColors.primary : Colors.red,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TimelineTile(
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.center,
                          beforeLineStyle: LineStyle(
                            color: patientModel.feedback == 'Clear' ? MyColors.primary : Colors.red,
                            thickness: 6,
                          ),
                          afterLineStyle: LineStyle(
                            color: patientModel.feedback == 'Clear' ? MyColors.primary : Colors.red,
                            thickness: 6,
                          ),
                          indicatorStyle: IndicatorStyle(
                            height: 26,
                            color: patientModel.feedback == 'Clear' ? MyColors.primary : Colors.red,
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.check,
                            ),
                          ),
                          endChild: MyText(
                            title: "Physiotherapy",
                            size: 8,
                            color: patientModel.feedback == 'Clear' ? MyColors.primary : Colors.red,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TimelineTile(
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.center,
                          beforeLineStyle: LineStyle(
                            color: (patientModel.watchedClip ?? false) ? MyColors.primary : Colors.red,
                            thickness: 6,
                          ),
                          afterLineStyle: LineStyle(
                            color: (patientModel.watchedClip ?? false) ? MyColors.primary : Colors.red,
                            thickness: 6,
                          ),
                          indicatorStyle: IndicatorStyle(
                            height: 26,
                            color: (patientModel.watchedClip ?? false) ? MyColors.primary : Colors.red,
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.check,
                            ),
                          ),
                          endChild: MyText(
                            title: "Education",
                            size: 8,
                            color: (patientModel.watchedClip ?? false) ? MyColors.primary : Colors.red,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TimelineTile(
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.center,
                          isLast: true,
                          beforeLineStyle: LineStyle(
                            color: patientModel.finalFeedback == 'Clear' ? MyColors.primary : Colors.red,
                            thickness: 6,
                          ),
                          indicatorStyle: IndicatorStyle(
                            height: 26,
                            color: patientModel.finalFeedback == 'Clear' ? MyColors.primary : Colors.red,
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.check,
                            ),
                          ),
                          endChild: MyText(
                            title: "Psychology",
                            size: 8,
                            color: patientModel.finalFeedback == 'Clear' ? MyColors.primary : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                //open
                onTap: togglePathway,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    patientModel.isOpen == true ? Icons.keyboard_arrow_down : Icons.arrow_forward_ios,
                    size: patientModel.isOpen == true ? 22 : 15,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Visibility(visible: patientModel.isOpen == true, child: Divider(color: MyColors.grey)),
          Visibility(
            visible: patientModel.isOpen == true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(title: "Surgery OPD Details;", size: 10, fontWeight: FontWeight.bold),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: patientModel.egd == true ? MyColors.primary : Colors.red,
                            radius: 12.0,
                            child: Icon(patientModel.egd == true ? Icons.check : Icons.close,
                                color: Colors.white, size: 15),
                          ),
                          const SizedBox(width: 10),
                          MyText(title: "EGD", size: 9),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: patientModel.ultrasound == true ? MyColors.primary : Colors.red,
                            radius: 12.0,
                            child: Icon(
                              patientModel.ultrasound == true ? Icons.check : Icons.close,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                          const SizedBox(width: 10),
                          MyText(title: "US", size: 9),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: patientModel.surgionVisit == true ? MyColors.primary : Colors.red,
                            radius: 12.0,
                            child: Icon(
                              patientModel.surgionVisit == true ? Icons.check : Icons.close,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                          const SizedBox(width: 10),
                          MyText(title: "Surgery OPD", size: 9),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
