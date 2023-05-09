part of 'SurPatientDetailsImports.dart';

class SurPatientDetails extends StatefulWidget {
  final String patientId;

  const SurPatientDetails({Key? key, required this.patientId}) : super(key: key);

  @override
  State<SurPatientDetails> createState() => _SurPatientDetailsState();
}

class _SurPatientDetailsState extends State<SurPatientDetails> {
  @override
  void initState() {
    SurPatientDetailsData().init(context, patientId: widget.patientId);
    super.initState();
  }

  String? feedbackStatus;
  String? physiotherapyFeedbackStatus;

  bool isOpened = false;

  toggleTimeLine() {
    isOpened = !isOpened;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      back: true,
      title: "Patient Details",
      actions: [
        Row(
          children: [
            InkWell(
              onTap: () {
                scaleAlertDialog(
                  context: context,
                  title: 'Archive',
                  body: 'Are you sure you want to archive this patient?',
                  cancelText: 'Cancel',
                  confirmText: 'Submit',
                  barrierDismissible: true,
                  onCancelClick: () {
                    Navigator.pop(context);
                  },
                  onConfirmClick: () async {
                    Navigator.pop(context);
                    bool result = await SurPatientDetailsData().archivePatient(context);
                    if (result) {
                      Navigator.pop(context, result);
                    }
                  },
                );
              },
              child: SvgPicture.asset(
                Res.imagesArchive,
                width: 30,
                height: 30,
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                Nav.navigateTo(
                    SurAddPatient(
                      patientDetailsModel: SurPatientDetailsData().patientDetailsCubit.state.data,
                    ),
                    navigatorType: NavigatorType.push);
              },
              child: Image.asset(Res.imagesAddPatient, scale: 2.5),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                SurPatientDetailsData().downloadInfo(context);
              },
              child: Image.asset(Res.imagesDownload, scale: 2.5),
            ),
            const SizedBox(width: 16),
          ],
        )
      ],
      body: BlocBuilder<GenericBloc<PatientDetailsModel?>, GenericState<PatientDetailsModel?>>(
        bloc: SurPatientDetailsData().patientDetailsCubit,
        builder: (context, state) {
          bool isReady = (state.data?.patient?.egd ?? false) &&
              (state.data?.patient?.ultrasound ?? false) &&
              (state.data?.patient?.surgionVisit ?? false) &&
              (state.data?.patient?.dietationFeedbackDecision == 'Clear') &&
              (state.data?.patient?.feedback == 'Clear') &&
              (state.data?.patient?.watchedClip ?? false) &&
              (state.data?.patient?.finalFeedback == 'Clear');
          if (state is GenericUpdateState<PatientDetailsModel?>) {
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                CachedImage(
                                  url: state.data?.patient?.image ?? '',
                                  height: 60,
                                  width: 60,
                                  borderRadius: BorderRadius.circular(10),
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  bottom: -5,
                                  right: -5,
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: MyColors.primary,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Icon(
                                      Icons.visibility,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: MyText(
                                          title:
                                              '${state.data?.patient?.fNameEn ?? ""} ${state.data?.patient?.lNameEn ?? ""}',
                                          size: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      isReady
                                          ? Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                              decoration: BoxDecoration(
                                                color: Color(0xffaff7c3),
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                child: MyText(
                                                  title: 'Ready',
                                                  size: 9,
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          : Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                                              decoration: BoxDecoration(
                                                color: Color(0xffFBD6BC),
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                child: MyText(
                                                  title: 'Not Ready',
                                                  size: 9,
                                                  color: Color(0xFFEB7826),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                                  MyText(
                                    title: "#${state.data?.patient?.civilId ?? ""}",
                                    size: 12,
                                    color: MyColors.blackOpacity,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.3,
                              child: Row(
                                children: [
                                  Image.asset(Res.imagesPhone, scale: 3),
                                  const SizedBox(width: 10),
                                  MyText(
                                    title: state.data?.patient?.telephone1 ?? "-",
                                    size: 12,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(Res.imagesFileIcon, scale: 3),
                                const SizedBox(width: 10),
                                MyText(
                                  title: state.data?.patient?.publicId ?? "-",
                                  size: 12,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.3,
                              child: Row(
                                children: [
                                  Image.asset(Res.imagesWeightIcon, scale: 3),
                                  const SizedBox(width: 10),
                                  MyText(
                                    title: '${state.data?.patient?.weight} KG',
                                    size: 12,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(Res.imagesHeightIcon, scale: 3),
                                const SizedBox(width: 10),
                                MyText(
                                  title: '${state.data?.patient?.height} CM',
                                  size: 12,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
                                        color: (state.data?.patient?.egd ?? false) &&
                                                (state.data?.patient?.ultrasound ?? false) &&
                                                (state.data?.patient?.surgionVisit ?? false)
                                            ? MyColors.primary
                                            : Colors.red,
                                        iconStyle: IconStyle(
                                          color: Colors.white,
                                          iconData: Icons.check,
                                        ),
                                      ),
                                      beforeLineStyle: LineStyle(
                                        color: (state.data?.patient?.egd ?? false) &&
                                                (state.data?.patient?.ultrasound ?? false) &&
                                                (state.data?.patient?.surgionVisit ?? false)
                                            ? MyColors.primary
                                            : Colors.red,
                                        thickness: 6,
                                      ),
                                      endChild: MyText(
                                        title: "Surgery OPD",
                                        size: 8,
                                        color: (state.data?.patient?.egd ?? false) &&
                                                (state.data?.patient?.ultrasound ?? false) &&
                                                (state.data?.patient?.surgionVisit ?? false)
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
                                        color: state.data?.patient?.dietationFeedbackDecision == 'Clear'
                                            ? MyColors.primary
                                            : Colors.red,
                                        thickness: 6,
                                      ),
                                      afterLineStyle: LineStyle(
                                        color: state.data?.patient?.dietationFeedbackDecision == 'Clear'
                                            ? MyColors.primary
                                            : Colors.red,
                                        thickness: 6,
                                      ),
                                      indicatorStyle: IndicatorStyle(
                                        height: 26,
                                        color: state.data?.patient?.dietationFeedbackDecision == 'Clear'
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
                                        color: state.data?.patient?.dietationFeedbackDecision == 'Clear'
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
                                        color: state.data?.patient?.feedback == 'Clear' ? MyColors.primary : Colors.red,
                                        thickness: 6,
                                      ),
                                      afterLineStyle: LineStyle(
                                        color: state.data?.patient?.feedback == 'Clear' ? MyColors.primary : Colors.red,
                                        thickness: 6,
                                      ),
                                      indicatorStyle: IndicatorStyle(
                                        height: 26,
                                        color: state.data?.patient?.feedback == 'Clear' ? MyColors.primary : Colors.red,
                                        iconStyle: IconStyle(
                                          color: Colors.white,
                                          iconData: Icons.check,
                                        ),
                                      ),
                                      endChild: MyText(
                                        title: "Physiotherapy",
                                        size: 8,
                                        color: state.data?.patient?.feedback == 'Clear' ? MyColors.primary : Colors.red,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TimelineTile(
                                      axis: TimelineAxis.horizontal,
                                      alignment: TimelineAlign.center,
                                      beforeLineStyle: LineStyle(
                                        color:
                                            (state.data?.patient?.watchedClip ?? false) ? MyColors.primary : Colors.red,
                                        thickness: 6,
                                      ),
                                      afterLineStyle: LineStyle(
                                        color:
                                            (state.data?.patient?.watchedClip ?? false) ? MyColors.primary : Colors.red,
                                        thickness: 6,
                                      ),
                                      indicatorStyle: IndicatorStyle(
                                        height: 26,
                                        color:
                                            (state.data?.patient?.watchedClip ?? false) ? MyColors.primary : Colors.red,
                                        iconStyle: IconStyle(
                                          color: Colors.white,
                                          iconData: Icons.check,
                                        ),
                                      ),
                                      endChild: MyText(
                                        title: "Education",
                                        size: 8,
                                        color:
                                            (state.data?.patient?.watchedClip ?? false) ? MyColors.primary : Colors.red,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TimelineTile(
                                      axis: TimelineAxis.horizontal,
                                      alignment: TimelineAlign.center,
                                      isLast: true,
                                      beforeLineStyle: LineStyle(
                                        color: state.data?.patient?.finalFeedback == 'Clear'
                                            ? MyColors.primary
                                            : Colors.red,
                                        thickness: 6,
                                      ),
                                      indicatorStyle: IndicatorStyle(
                                        height: 26,
                                        color: state.data?.patient?.finalFeedback == 'Clear'
                                            ? MyColors.primary
                                            : Colors.red,
                                        iconStyle: IconStyle(
                                          color: Colors.white,
                                          iconData: Icons.check,
                                        ),
                                      ),
                                      endChild: MyText(
                                        title: "Psychology",
                                        size: 8,
                                        color: state.data?.patient?.finalFeedback == 'Clear'
                                            ? MyColors.primary
                                            : Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            //open
                            onTap: () => toggleTimeLine(),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Icon(isOpened ? Icons.keyboard_arrow_down : Icons.arrow_forward_ios,
                                  size: isOpened ? 22 : 15),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Visibility(visible: isOpened, child: Divider(color: MyColors.grey)),
                      Visibility(
                        visible: isOpened,
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
                                        backgroundColor:
                                            state.data?.patient?.egd == true ? MyColors.primary : Colors.red,
                                        radius: 12.0,
                                        child: Icon(
                                          state.data?.patient?.egd == true ? Icons.check : Icons.close,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      MyText(title: "EGD", size: 9),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            state.data?.patient?.ultrasound == true ? MyColors.primary : Colors.red,
                                        radius: 12.0,
                                        child: Icon(state.data?.patient?.ultrasound == true ? Icons.check : Icons.close,
                                            color: Colors.white, size: 15),
                                      ),
                                      const SizedBox(width: 10),
                                      MyText(title: "US", size: 9),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            state.data?.patient?.surgionVisit == true ? MyColors.primary : Colors.red,
                                        radius: 12.0,
                                        child: Icon(
                                            state.data?.patient?.surgionVisit == true ? Icons.check : Icons.close,
                                            color: Colors.white,
                                            size: 15),
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
                ),
                const SizedBox(height: 10),
                MyText(title: "Doctors Info", size: 14, fontWeight: FontWeight.bold, color: MyColors.primary),
                const SizedBox(height: 10),
                Row(
                  children: [
                    MyText(title: "Surgeon:", size: 12, fontWeight: FontWeight.bold),
                    SizedBox(width: 10),
                    MyText(
                      title:
                          '${state.data?.patient?.surgeonId?.firstNameEn ?? ''} ${state.data?.patient?.surgeonId?.lastNameEn ?? ''}',
                      size: 12,
                      fontWeight: FontWeight.bold,
                      color: MyColors.blackOpacity,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    MyText(title: "Dietitian:", size: 12, fontWeight: FontWeight.bold),
                    SizedBox(width: 10),
                    MyText(
                      title:
                          '${state.data?.patient?.dietationId?.firstNameEn ?? ''} ${state.data?.patient?.dietationId?.lastNameEn ?? ''}',
                      size: 12,
                      color: MyColors.blackOpacity,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    MyText(title: "Physiotherapist:", size: 12, fontWeight: FontWeight.bold),
                    SizedBox(width: 10),
                    MyText(
                      title:
                          '${state.data?.patient?.physiotherapyId?.firstNameEn ?? ''} ${state.data?.patient?.physiotherapyId?.lastNameEn ?? ''}',
                      size: 12,
                      color: MyColors.blackOpacity,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    MyText(title: "Educator:", size: 12, fontWeight: FontWeight.bold),
                    SizedBox(width: 10),
                    MyText(
                      title:
                          '${state.data?.patient?.surgeon2Id?.firstNameEn ?? ''} ${state.data?.patient?.surgeon2Id?.lastNameEn ?? ''}',
                      size: 12,
                      color: MyColors.blackOpacity,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    MyText(title: "Psychologist:", size: 12, fontWeight: FontWeight.bold),
                    SizedBox(width: 10),
                    MyText(
                      title:
                          '${state.data?.patient?.psychologistId?.firstNameEn ?? ''} ${state.data?.patient?.psychologistId?.lastNameEn ?? ''}',
                      size: 12,
                      color: MyColors.blackOpacity,
                    ),
                  ],
                ),
                if (context.read<UserCubit>().state.model.userData![0].doctorRoleId?.roleNameEn == 'Dietitian' &&
                    (state.data?.patient?.dietation_feedback_decision ?? '').isNotEmpty)
                  const Divider(thickness: 1, height: 20),
                if (context.read<UserCubit>().state.model.userData![0].doctorRoleId?.roleNameEn == 'Dietitian' &&
                    (state.data?.patient?.dietation_feedback_decision ?? '').isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: MyText(
                      title: 'Your Feedback',
                      size: 12,
                      color: MyColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (context.read<UserCubit>().state.model.userData![0].doctorRoleId?.roleNameEn == 'Dietitian' &&
                    (state.data?.patient?.dietation_feedback_decision ?? '').isNotEmpty)
                  Row(
                    children: [
                      MyText(
                        title: 'Doctor Feedback:',
                        size: 12,
                      ),
                      SizedBox(width: 10),
                      MyText(
                        title: state.data?.patient?.dietation_feedback_decision ?? '',
                        size: 12,
                        color: MyColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                if (context.read<UserCubit>().state.model.userData![0].doctorRoleId?.roleNameEn == 'physiotherapist' &&
                    (state.data?.patient?.feedback ?? '').isNotEmpty)
                  const Divider(thickness: 1, height: 20),
                if (context.read<UserCubit>().state.model.userData![0].doctorRoleId?.roleNameEn == 'physiotherapist' &&
                    (state.data?.patient?.feedback ?? '').isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: MyText(
                      title: 'Your Feedback',
                      size: 12,
                      color: MyColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (context.read<UserCubit>().state.model.userData![0].doctorRoleId?.roleNameEn == 'physiotherapist' &&
                    (state.data?.patient?.feedback ?? '').isNotEmpty)
                  Row(
                    children: [
                      MyText(
                        title: 'Doctor Feedback:',
                        size: 12,
                      ),
                      SizedBox(width: 10),
                      MyText(
                        title: state.data?.patient?.feedback ?? '',
                        size: 12,
                        color: MyColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                if ((state.data?.patient?.operationDate ?? '').isNotEmpty) const Divider(thickness: 1, height: 20),
                if ((state.data?.patient?.operationDate ?? '').isNotEmpty)
                  MyText(title: "Operation Details", size: 14, color: MyColors.primary, fontWeight: FontWeight.bold),
                if ((state.data?.patient?.operationDate ?? '').isNotEmpty) const SizedBox(height: 10),
                if ((state.data?.patient?.operationDate ?? '').isNotEmpty)
                  Row(
                    children: [
                      MyText(title: "Operation Type: ", size: 12, fontWeight: FontWeight.bold),
                      SizedBox(width: 10),
                      MyText(
                        title: state.data?.patient?.operationType ?? '',
                        size: 12,
                        color: MyColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                if ((state.data?.patient?.operationDate ?? '').isNotEmpty) const SizedBox(height: 10),
                if ((state.data?.patient?.operationDate ?? '').isNotEmpty)
                  Row(
                    children: [
                      MyText(title: "Operation Done On:", size: 12, fontWeight: FontWeight.bold),
                      SizedBox(width: 10),
                      MyText(
                        title: DateFormat('yyyy-MM-dd').format(DateTime.parse(state.data!.patient!.operationDate!)),
                        size: 12,
                        color: MyColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                if ((state.data?.patient?.operationDate ?? '').isNotEmpty) const SizedBox(height: 10),
                if ((state.data?.patient?.operationDate ?? '').isNotEmpty)
                  Row(
                    children: [
                      MyText(title: "MDT Status:", size: 12, fontWeight: FontWeight.bold),
                      SizedBox(width: 10),
                      MyText(
                        title: state.data?.patient?.mdtStatus ?? '-',
                        size: 12,
                        color: MyColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                const Divider(thickness: 1, height: 20),
                MyText(
                  title: "Patient’s Weekly Exercise Overview",
                  size: 14,
                  color: MyColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 7,
                        padding: const EdgeInsets.only(bottom: 0, left: 20, right: 20, top: 20),
                        decoration: BoxDecoration(
                          color: Color(0xff24C647),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              Res.imagesStepsIcon,
                              scale: 3,
                            ),
                            const SizedBox(height: 5),
                            MyText(
                              title: '0',
                              size: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            Flexible(
                              child: MyText(
                                  alien: TextAlign.center,
                                  title: 'Steps Moved',
                                  size: 9,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 7,
                        padding: const EdgeInsets.only(bottom: 0, left: 20, right: 20, top: 20),
                        decoration: BoxDecoration(
                          color: Color(0xffEB7826),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              Res.imagesMinutesIcon,
                              scale: 3,
                            ),
                            const SizedBox(height: 5),
                            MyText(
                              title: '0',
                              size: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            Flexible(
                              child: MyText(
                                  alien: TextAlign.center,
                                  title: 'Minutes Spent',
                                  size: 9,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 7,
                        padding: const EdgeInsets.only(bottom: 0, left: 20, right: 20, top: 20),
                        decoration: BoxDecoration(
                          color: Color(0xffD84545),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              Res.imagesWeightLossIcon,
                              scale: 3,
                            ),
                            const SizedBox(height: 5),
                            MyText(
                              title: '0',
                              size: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            Flexible(
                              child: MyText(
                                  alien: TextAlign.center,
                                  title: 'Calories Burned',
                                  size: 9,
                                  // overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(thickness: 1, height: 30),
                MyText(
                  title:
                      "Upcoming Appointment With ${'${state.data?.patient?.surgeonId?.firstNameEn ?? ''} ${state.data?.patient?.surgeonId?.lastNameEn ?? ''}'}",
                  size: 14,
                  color: MyColors.primary,
                  fontWeight: FontWeight.w800,
                ),
                if (state.data!.appointments!.isNotEmpty)
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.data?.appointments?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.86),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedImage(
                                  url: state.data?.patient?.image ?? "",
                                  height: 56,
                                  width: 50,
                                  borderRadius: BorderRadius.circular(5)),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      title:
                                          '${state.data?.patient?.fNameEn ?? ''} ${state.data?.patient?.lNameEn ?? ''}',
                                      size: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(height: 4),
                                    MyText(
                                      title: (state.data?.appointments?[index].comments ?? '').isNotEmpty
                                          ? state.data!.appointments![index].comments!
                                          : 'Scheduled Appointment',
                                      color: MyColors.grey,
                                      size: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                                              title: DateFormat("E ,d MMM y").format(
                                                DateTime.parse(state.data!.appointments![index].appointmentDate!),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              size: 12,
                                              color: MyColors.primary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            Image.asset(
                                              Res.imagesClockIcon,
                                              scale: 3,
                                            ),
                                            const SizedBox(width: 5),
                                            MyText(
                                              title: DateFormat("hh:mm a").format(
                                                DateTime.parse(state.data!.appointments![index].appointmentDate!),
                                              ),
                                              size: 10,
                                              overflow: TextOverflow.ellipsis,
                                              color: MyColors.primary,
                                              fontWeight: FontWeight.bold,
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
                        );
                      },
                    ),
                  ),
                if (state.data!.appointments!.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: MyText(
                        alien: TextAlign.center,
                        title: "No Upcoming Appointments",
                        size: 10,
                        color: MyColors.black,
                        fontWeight: FontWeight.bold),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: DefaultButton(
                          title: "Add Appointment",
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) => buildAddAppointmentSheet(patientId: widget.patientId));
                          },
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      if (context.read<UserCubit>().state.model.userData![0].doctorRoleId?.roleNameEn == 'Dietitian' &&
                          (state.data?.patient?.dietation_feedback_decision ?? '') != 'Clear')
                        Expanded(
                          child: DefaultButton(
                            title: "Add Diet Plan",
                            onTap: () async {
                              await Nav.navigateTo(
                                DietitionAddPatientDietData(patient: state.data!.patient!),
                                navigatorType: NavigatorType.push,
                              );
                              await showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                isDismissible: true,
                                builder: (BuildContext context) {
                                  return ModelBottomSheet(
                                    child: StatefulBuilder(
                                      builder: (BuildContext context, StateSetter setState) => SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: MyText(
                                                title: "Your Feedback",
                                                size: 15,
                                                fontWeight: FontWeight.bold,
                                                color: MyColors.primary,
                                              ),
                                            ),
                                            RadioListTile(
                                              title: Text("Clear"),
                                              value: "Clear",
                                              groupValue: feedbackStatus,
                                              onChanged: (value) {
                                                setState(() {
                                                  feedbackStatus = value.toString();
                                                });
                                              },
                                            ),
                                            RadioListTile(
                                              title: Text("Need Visit"),
                                              value: "Need Visit",
                                              groupValue: feedbackStatus,
                                              onChanged: (value) {
                                                setState(() {
                                                  feedbackStatus = value.toString();
                                                });
                                              },
                                            ),
                                            RadioListTile(
                                              title: Text("Need Second Visit"),
                                              value: "Need Second Visit",
                                              groupValue: feedbackStatus,
                                              onChanged: (value) {
                                                setState(() {
                                                  feedbackStatus = value.toString();
                                                });
                                              },
                                            ),
                                            const SizedBox(height: 10.0),
                                            DefaultButton(
                                              height: 38,
                                              title: "Update",
                                              onTap: () async {
                                                final Map<String, dynamic> body = {
                                                  'dietation_feedback_decision': feedbackStatus,
                                                };
                                                dynamic data = await GenericHttp<PatientDetailsModel>(context).callApi(
                                                  name:
                                                      ApiNames.patientDietation + '?user_id=${state.data!.patient!.id}',
                                                  returnType: ReturnType.Type,
                                                  methodType: MethodType.Put,
                                                  returnDataFun: (data) => data,
                                                  jsonBody: body,
                                                  showLoader: true,
                                                );
                                                if (data != null) {
                                                  Navigator.pop(context);
                                                  CustomToast.showSnackBar(context, data["message"]["message_en"]);
                                                  SurPatientDetailsData().getPatientDetails(context, widget.patientId);
                                                }
                                              },
                                              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                                            ),
                                            const SizedBox(height: 16.0),
                                          ],
                                        ),
                                      ),
                                    ),
                                    sheetHeight: MediaQuery.of(context).size.height * 0.45,
                                  );
                                },
                              );
                              setState(() {});
                              // }
                            },
                          ),
                        ),
                      if (context.read<UserCubit>().state.model.userData![0].doctorRoleId?.roleNameEn ==
                              'physiotherapist' &&
                          (state.data?.patient?.dietation_feedback_decision ?? '') != 'Clear')
                        Expanded(
                          child: DefaultButton(
                            title: "Add Physiotherapy Data",
                            onTap: () async {
                              await Nav.navigateTo(
                                PhysiotherapyAddPatientData(patient: state.data!.patient!),
                                navigatorType: NavigatorType.push,
                              );
                              await showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                isDismissible: true,
                                builder: (BuildContext context) {
                                  return ModelBottomSheet(
                                    child: StatefulBuilder(
                                      builder: (BuildContext context, StateSetter setState) => SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: MyText(
                                                title: "Your Feedback",
                                                size: 15,
                                                fontWeight: FontWeight.bold,
                                                color: MyColors.primary,
                                              ),
                                            ),
                                            RadioListTile(
                                              title: Text("Clear"),
                                              value: "Clear",
                                              groupValue: physiotherapyFeedbackStatus,
                                              onChanged: (value) {
                                                setState(() {
                                                  physiotherapyFeedbackStatus = value.toString();
                                                });
                                              },
                                            ),
                                            RadioListTile(
                                              title: Text("Not Clear"),
                                              value: "Not Clear",
                                              groupValue: physiotherapyFeedbackStatus,
                                              onChanged: (value) {
                                                setState(() {
                                                  physiotherapyFeedbackStatus = value.toString();
                                                });
                                              },
                                            ),
                                            const SizedBox(height: 10.0),
                                            DefaultButton(
                                              height: 38,
                                              title: "Update",
                                              onTap: () async {
                                                final Map<String, dynamic> body = {
                                                  'feedback': physiotherapyFeedbackStatus,
                                                };
                                                dynamic data = await GenericHttp<PatientDetailsModel>(context).callApi(
                                                  name:
                                                      ApiNames.patientPhysiotherapy + '?user_id=${state.data!.patient!.id}',
                                                  returnType: ReturnType.Type,
                                                  methodType: MethodType.Put,
                                                  returnDataFun: (data) => data,
                                                  jsonBody: body,
                                                  showLoader: true,
                                                );
                                                if (data != null) {
                                                  Navigator.pop(context);
                                                  CustomToast.showSnackBar(context, data["message"]["message_en"]);
                                                  SurPatientDetailsData().getPatientDetails(context, widget.patientId);
                                                }
                                              },
                                              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                                            ),
                                            const SizedBox(height: 16.0),
                                          ],
                                        ),
                                      ),
                                    ),
                                    sheetHeight: MediaQuery.of(context).size.height * 0.35,
                                  );
                                },
                              );
                              setState(() {});
                              // }
                            },
                          ),
                        ),
                      if (state.data!.appointments!.isNotEmpty && state.data?.patient?.operationStatus == "Post-op")
                        Expanded(
                          child: DefaultButton(
                            title: "Order Instruments",
                            onTap: () => Nav.navigateTo(RequestInstrumentsScreen(patientModel: state.data!),
                                navigatorType: NavigatorType.push),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(child: LoadingDialog.showLoadingView());
          }
        },
      ),
    );
  }
}

class buildAddAppointmentSheet extends StatelessWidget {
  final String patientId;

  const buildAddAppointmentSheet({
    Key? key,
    required this.patientId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralAlertDialog(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      alertButtonType: AlertButtonType.noButton,
      alertTextType: AlertContentType.noTitle,
      alertImageType: AlertImageType.noImg,
      customWidget: Form(
        key: SurPatientDetailsData().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: "Add Appointment",
              size: 14,
              alien: TextAlign.center,
              color: MyColors.primary,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10),
            MyText(title: "Appointment Date", size: 12, fontWeight: FontWeight.bold),
            BlocConsumer<GenericBloc<String?>, GenericState<String?>>(
              bloc: SurPatientDetailsData().dateBloc,
              listener: (context, state) {
                SurPatientDetailsData().appointmentDate.text = state.data ?? '';
              },
              builder: (context, state) {
                return GenericTextField(
                  hintColor: Theme.of(context).textTheme.displaySmall?.color?.withOpacity(.8),
                  fieldTypes: FieldTypes.clickable,
                  fillColor: MyColors.textFields,
                  hint: "Appointment Date",
                  controller: SurPatientDetailsData().appointmentDate,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.next,
                  onTab: () => SurPatientDetailsData().chooseFromDate(context),
                  suffixIcon: Image.asset(
                    Res.imagesCalendar,
                    scale: 3,
                    color: MyColors.primary,
                  ),
                  type: TextInputType.text,
                  validate: (value) => value!.validateEmpty(context),
                );
              },
            ),
            // MyText(title: "Clinic Name", size: 12, fontWeight: FontWeight.bold),
            // GenericTextField(
            //   hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
            //   fieldTypes: FieldTypes.normal,
            //   fillColor: MyColors.textFields,
            //   hint: "Clinic Name",
            //   controller: SurPatientDetailsData().clinicName,
            //   margin: const EdgeInsets.symmetric(vertical: 10),
            //   action: TextInputAction.next,
            //   type: TextInputType.text,
            //   validate: (value) => value!.validateEmpty(context),
            // ),
            MyText(title: "Notes", size: 12, fontWeight: FontWeight.bold),
            GenericTextField(
              hintColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
              fieldTypes: FieldTypes.normal,
              fillColor: MyColors.textFields,
              hint: "Notes",
              controller: SurPatientDetailsData().notes,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.text,
              validate: (value) => null,
            ),
            DefaultButton(
              title: "Confirm Date",
              onTap: () {
                SurPatientDetailsData().addAppointment(context, patientId);
              },
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            ),
          ],
        ),
      ),
    );
  }
}
