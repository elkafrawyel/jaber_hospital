part of 'SurPatientWImports.dart';

class BuildPreOpItem extends StatelessWidget {
  final int index;

  // final PatientModel patientModel;

  const BuildPreOpItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PatientModel> list = SurPatientData().patientsCubit.state.data;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Nav.navigateTo(
                SurPatientDetails(patientId: list[index].sId ?? ''),
                navigatorType: NavigatorType.push,
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  CachedImage(
                    url: list[index].image ?? 'https://picsum.photos/180',
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
                                title: '${list[index].fNameEn ?? ""} ${list[index].lNameEn ?? ""}',
                                size: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            list[index].finalFeedback == "true"
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
                                  '${list[index].surgeonId?.firstNameEn ?? ""} ${list[index].surgeonId?.lastNameEn ?? ""}',
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
                                  '${list[index].dietationId?.firstNameEn ?? "-"} ${list[index].dietationId?.lastNameEn ?? "-"}',
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
                            title: "Surgery OPD",
                            size: 8,
                            color: MyColors.primary,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TimelineTile(
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.center,
                          beforeLineStyle: LineStyle(
                            color: (list[index].dietationFeedbackDecision ?? '').isNotEmpty
                                ? MyColors.primary
                                : Colors.red,
                            thickness: 6,
                          ),
                          afterLineStyle: LineStyle(
                            color: (list[index].dietationFeedbackDecision ?? '').isNotEmpty
                                ? MyColors.primary
                                : Colors.red,
                            thickness: 6,
                          ),
                          indicatorStyle: IndicatorStyle(
                            height: 26,
                            color: (list[index].dietationFeedbackDecision ?? '').isNotEmpty
                                ? MyColors.primary
                                : Colors.red,
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.check,
                            ),
                          ),
                          endChild: MyText(
                            title: "Dietitian",
                            size: 8,
                            color: (list[index].dietationFeedbackDecision ?? '').isNotEmpty
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
                            color: (list[index].feedback ?? '').isNotEmpty ? MyColors.primary : Colors.red,
                            thickness: 6,
                          ),
                          afterLineStyle: LineStyle(
                            color: (list[index].feedback ?? '').isNotEmpty ? MyColors.primary : Colors.red,
                            thickness: 6,
                          ),
                          indicatorStyle: IndicatorStyle(
                            height: 26,
                            color: (list[index].feedback ?? '').isNotEmpty ? MyColors.primary : Colors.red,
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.check,
                            ),
                          ),
                          endChild: MyText(
                            title: "Physiotherapy",
                            size: 8,
                            color: (list[index].feedback ?? '').isNotEmpty ? MyColors.primary : Colors.red,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TimelineTile(
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.center,
                          beforeLineStyle: LineStyle(
                            color: (list[index].watchedClip ?? false) ? MyColors.primary : Colors.red,
                            thickness: 6,
                          ),
                          afterLineStyle: LineStyle(
                            color: (list[index].watchedClip ?? false) ? MyColors.primary : Colors.red,
                            thickness: 6,
                          ),
                          indicatorStyle: IndicatorStyle(
                            height: 26,
                            color: (list[index].watchedClip ?? false) ? MyColors.primary : Colors.red,
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.check,
                            ),
                          ),
                          endChild: MyText(
                            title: "Education",
                            size: 8,
                            color: (list[index].watchedClip ?? false) ? MyColors.primary : Colors.red,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TimelineTile(
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.center,
                          isLast: true,
                          beforeLineStyle: LineStyle(
                            color: list[index].finalFeedback == "true" ? MyColors.primary : Colors.red,
                            thickness: 6,
                          ),
                          indicatorStyle: IndicatorStyle(
                            height: 26,
                            color: list[index].finalFeedback == "true" ? MyColors.primary : Colors.red,
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.check,
                            ),
                          ),
                          endChild: MyText(
                            title: "Psychology",
                            size: 8,
                            color: list[index].finalFeedback == "true" ? MyColors.primary : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                //open
                onTap: () => SurPatientData().openOpdDetailsCard(context, list, index),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(list[index].isOpen == true ? Icons.keyboard_arrow_down : Icons.arrow_forward_ios,
                      size: list[index].isOpen == true ? 22 : 15),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Visibility(visible: list[index].isOpen == true, child: Divider(color: MyColors.grey)),
          Visibility(
            visible: list[index].isOpen == true,
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
                            backgroundColor: list[index].egd == true ? MyColors.primary : Colors.red,
                            radius: 12.0,
                            child: Icon(list[index].egd == true ? Icons.check : Icons.close,
                                color: Colors.white, size: 15),
                          ),
                          const SizedBox(width: 10),
                          MyText(title: "EGD", size: 9),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: list[index].ultrasound == true ? MyColors.primary : Colors.red,
                            radius: 12.0,
                            child: Icon(list[index].ultrasound == true ? Icons.check : Icons.close,
                                color: Colors.white, size: 15),
                          ),
                          const SizedBox(width: 10),
                          MyText(title: "US", size: 9),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: list[index].surgionVisit == true ? MyColors.primary : Colors.red,
                            radius: 12.0,
                            child: Icon(
                              list[index].surgionVisit == true ? Icons.check : Icons.close,
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
