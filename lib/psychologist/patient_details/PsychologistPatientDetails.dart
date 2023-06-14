import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tf_validator/tf_validator.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../company/models/update_order_status_response.dart';
import '../../general/blocks/user_cubit/user_cubit.dart';
import '../../general/constants/MyColors.dart';
import '../../general/models/UserModel.dart';
import '../../general/utilities/http/dio/http/GenericHttp.dart';
import '../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../general/utilities/tf_custom_widgets/Inputs/GenericTextField.dart';
import '../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../general/utilities/utils_functions/AdaptivePicker.dart';
import '../../general/utilities/utils_functions/ApiNames.dart';
import '../../general/utilities/utils_functions/LoadingDialog.dart';
import '../../general/widgets/GenScaffold.dart';
import '../../general/widgets/GeneralAlertDialog.dart';
import '../../general/widgets/modal_bottom_sheet.dart';
import '../../patient/models/ques_answer_response.dart';
import '../../res/res.dart';
import '../../surgeon/models/patient_details_model.dart';
import '../../surgeon/models/patient_model.dart';
import 'PsychologistPatientDetailsData.dart';

class PsychologistPatientDetails extends StatefulWidget {
  final String patientId;
  final PatientModel patientModel;

  const PsychologistPatientDetails({Key? key, required this.patientId, required this.patientModel}) : super(key: key);

  @override
  State<PsychologistPatientDetails> createState() => _SurPatientDetailsState();
}

class _SurPatientDetailsState extends State<PsychologistPatientDetails> {
  String? feedbackStatus;
  PsychologistPatientDetailsData psychologistPatientDetailsData = PsychologistPatientDetailsData();
  late UserData? userData;

  @override
  void initState() {
    psychologistPatientDetailsData.init(context, patientId: widget.patientId);
    super.initState();
    userData = context.read<UserCubit>().state.model.userData?[0];
  }

  @override
  Widget build(BuildContext context) {
    log("patientFeedBack==> ${widget.patientModel.finalFeedback}");
    final size = MediaQuery.of(context).size;
    return GeneralScaffold(
      back: true,
      title: "Patient Details",
      actions: [
        Row(
          children: [
            Image.asset(Res.imagesDownload, scale: 2.5),
            const SizedBox(width: 16),
          ],
        )
      ],
      body: BlocBuilder<GenericBloc<PatientDetailsModel?>, GenericState<PatientDetailsModel?>>(
        bloc: psychologistPatientDetailsData.patientDetailsCubit,
        builder: (context, state) {
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
                                          child: Row(
                                        children: [
                                          MyText(
                                            title: state.data?.patient?.fNameEn ?? "",
                                            size: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          MyText(
                                            title: state.data?.patient?.lNameEn ?? "",
                                            size: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      )),
                                      psychologistPatientDetailsData.isReadyPatient
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
                                  MyText(
                                      title: "#${state.data?.patient?.civilId ?? ""}",
                                      size: 12,
                                      color: MyColors.blackOpacity),
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
                                    title: state.data?.patient?.telephone1 ?? "",
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
                                  title: state.data?.patient?.publicId ?? "Not set yet",
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
                      SizedBox(
                        width: size.width,
                        height: 60,
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
                                  size: 9,
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
                                  size: 9,
                                  color: state.data?.patient?.feedback == 'Clear' ? MyColors.primary : Colors.red,
                                ),
                              ),
                            ),
                            Expanded(
                              child: TimelineTile(
                                axis: TimelineAxis.horizontal,
                                alignment: TimelineAlign.center,
                                beforeLineStyle: LineStyle(
                                  color: (state.data?.patient?.watchedClip ?? false) ? MyColors.primary : Colors.red,
                                  thickness: 6,
                                ),
                                afterLineStyle: LineStyle(
                                  color: (state.data?.patient?.watchedClip ?? false) ? MyColors.primary : Colors.red,
                                  thickness: 6,
                                ),
                                indicatorStyle: IndicatorStyle(
                                  height: 26,
                                  color: (state.data?.patient?.watchedClip ?? false) ? MyColors.primary : Colors.red,
                                  iconStyle: IconStyle(
                                    color: Colors.white,
                                    iconData: Icons.check,
                                  ),
                                ),
                                endChild: MyText(
                                  title: "Education",
                                  size: 9,
                                  color: (state.data?.patient?.watchedClip ?? false) ? MyColors.primary : Colors.red,
                                ),
                              ),
                            ),
                            Expanded(
                              child: TimelineTile(
                                axis: TimelineAxis.horizontal,
                                alignment: TimelineAlign.center,
                                isLast: true,
                                beforeLineStyle: LineStyle(
                                  color: state.data?.patient?.finalFeedback == 'Clear' ? MyColors.primary : Colors.red,
                                  thickness: 6,
                                ),
                                indicatorStyle: IndicatorStyle(
                                  height: 26,
                                  color: state.data?.patient?.finalFeedback == 'Clear' ? MyColors.primary : Colors.red,
                                  iconStyle: IconStyle(
                                    color: Colors.white,
                                    iconData: Icons.check,
                                  ),
                                ),
                                endChild: MyText(
                                  title: "Psychology",
                                  size: 9,
                                  color: state.data?.patient?.finalFeedback == 'Clear' ? MyColors.primary : Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: MyColors.grey),
                      Padding(
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
                                      backgroundColor: MyColors.primary,
                                      radius: 12.0,
                                      child: Icon(Icons.check, color: Colors.white, size: 15),
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
                                      child: Icon(state.data?.patient?.surgionVisit == true ? Icons.check : Icons.close,
                                          color: Colors.white, size: 15),
                                    ),
                                    const SizedBox(width: 10),
                                    MyText(title: "Surgery OPD", size: 9),
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
                const SizedBox(height: 10),
                MyText(title: "Doctors Info", size: 14, fontWeight: FontWeight.bold, color: MyColors.primary),
                const SizedBox(height: 10),
                Row(
                  children: [
                    MyText(title: "Surgeon:", size: 12, fontWeight: FontWeight.bold),
                    const SizedBox(width: 4),
                    MyText(
                      title:
                          '${state.data?.patient?.surgeonId?.firstNameEn ?? ''} ${state.data?.patient?.surgeonId?.lastNameEn ?? ''}',
                      size: 12,
                      color: MyColors.blackOpacity,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    MyText(title: "Dietitian:", size: 12, fontWeight: FontWeight.bold),
                    const SizedBox(width: 4),
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
                    const SizedBox(width: 4),
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
                    const SizedBox(width: 4),
                    MyText(
                      title:
                          '${state.data?.patient?.psychologistId?.firstNameEn ?? ''} ${state.data?.patient?.psychologistId?.lastNameEn ?? ''}',
                      size: 12,
                      color: MyColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  height: 20,
                ),
                MyText(title: "Assessment Score:", size: 14, color: MyColors.primary, fontWeight: FontWeight.bold),
                const SizedBox(height: 10),
                BlocBuilder<GenericBloc<QuesAnswerResponse?>, GenericState<QuesAnswerResponse?>>(
                  bloc: psychologistPatientDetailsData.patScoreCubit,
                  builder: (context, assState) {
                    if (assState is GenericUpdateState) {
                      if (assState.data!.data!.isNotEmpty) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                MyText(title: "Depression Assessment Score: ", size: 11, fontWeight: FontWeight.bold),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Expanded(
                                  child: MyText(
                                    title: assState.data!.data![0].depressionScore ?? '',
                                    size: 12,
                                    color: MyColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                MyText(title: "Depression Assessment Result:", size: 11, fontWeight: FontWeight.bold),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Expanded(
                                  child: MyText(
                                    title: assState.data!.data![0].depressionScoreLevel ?? '',
                                    size: 12,
                                    color: MyColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                MyText(title: "Anxiety Assessment Score:", size: 11, fontWeight: FontWeight.bold),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Expanded(
                                  child: MyText(
                                    //convert date to 12 aug 2021
                                    title: assState.data!.data![0].anxietyScore ?? '',
                                    size: 12,
                                    color: MyColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                MyText(title: "Anxiety Assessment Result:", size: 11, fontWeight: FontWeight.bold),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Expanded(
                                  child: MyText(
                                    title: assState.data!.data![0].anxietyScoreLevel ?? '',
                                    size: 12,
                                    color: MyColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                MyText(title: "Feedback:", size: 11, fontWeight: FontWeight.bold),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Expanded(
                                  child: MyText(
                                    title: (widget.patientModel.finalFeedback ?? '').replaceAll('_', ' '),
                                    size: 12,
                                    color: MyColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyText(
                                title:
                                    "Upcoming Appointment With\n${'${context.read<UserCubit>().state.model.userData![0].firstNameEn ?? ''} ${context.read<UserCubit>().state.model.userData![0].lastNameEn ?? ''}'}",
                                size: 14,
                                color: MyColors.primary,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            if (state.data!.appointments!.isNotEmpty)
                              SizedBox(
                                height: 130,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.data?.appointments?.length ?? 0,
                                  itemBuilder: (BuildContext context, int index) {
                                    DateTime? dateTime =
                                        DateTime.tryParse(state.data!.appointments![index].appointmentDate!);
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.80),
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
                                            borderRadius: BorderRadius.circular(5),
                                          ),
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
                                                if (dateTime != null)
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            Res.imagesVector,
                                                            scale: 3,
                                                          ),
                                                          const SizedBox(width: 5),
                                                          MyText(
                                                            title: DateFormat("E ,d MMM y").format(dateTime),
                                                            overflow: TextOverflow.ellipsis,
                                                            size: 10,
                                                            color: MyColors.primary,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(width: 15),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            Res.imagesClockIcon,
                                                            scale: 3,
                                                          ),
                                                          const SizedBox(width: 5),
                                                          MyText(
                                                            title: DateFormat("hh:mm a").format(dateTime),
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
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            widget.patientModel.finalFeedback != "Clear"
                                ? Row(
                                    children: [
                                      Expanded(
                                        child: DefaultButton(
                                          title: "Edit Feedback",
                                          fontSize: 10,
                                          onTap: () {
                                            showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              backgroundColor: Colors.transparent,
                                              isDismissible: false,
                                              builder: (BuildContext context) {
                                                return ModelBottomSheet(
                                                  child: StatefulBuilder(
                                                    builder: (BuildContext context, StateSetter setState) => Column(
                                                      children: [
                                                        Center(
                                                          child: MyText(
                                                            title: "Your Feedback",
                                                            size: 15,
                                                            fontWeight: FontWeight.bold,
                                                            color: MyColors.primary,
                                                          ),
                                                        ),
                                                        const SizedBox(height: 16.0),
                                                        RadioListTile(
                                                          title: Text("Clear"),
                                                          value: "Clear",
                                                          groupValue: feedbackStatus,
                                                          onChanged: (value) {
                                                            log("value=> $value");
                                                            setState(() {
                                                              feedbackStatus = value.toString();
                                                            });
                                                          },
                                                        ),
                                                        const SizedBox(height: 10.0),
                                                        RadioListTile(
                                                          title: Text("Not Clear"),
                                                          value: "Not_Clear",
                                                          groupValue: feedbackStatus,
                                                          onChanged: (value) {
                                                            log("value=> $value");
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
                                                            log('fetchHomeCompOrders called...');
                                                            Map<String, dynamic> body = {
                                                              "final_feedback": feedbackStatus,
                                                            };
                                                            UpdateOrderStatusResponse? result =
                                                                await GenericHttp<UpdateOrderStatusResponse>(context)
                                                                    .callApi(
                                                              name:
                                                                  "${ApiNames.feedbackStatus}?user_id=${widget.patientModel.sId}",
                                                              returnType: ReturnType.Model,
                                                              methodType: MethodType.Put,
                                                              returnDataFun: (data) => data,
                                                              jsonBody: body,
                                                              toJsonFunc: (json) =>
                                                                  UpdateOrderStatusResponse.fromJson(json),
                                                            );
                                                            log("data=> ${result?.toJson()}");
                                                            if (result?.success ?? false) {
                                                              Navigator.of(context).pop();
                                                              CustomToast.showSimpleToast(
                                                                  msg: result?.message?.messageEn ?? "");
                                                            } else {
                                                              CustomToast.showSimpleToast(
                                                                  msg: result?.message?.messageEn ?? "");
                                                            }
                                                          },
                                                          margin:
                                                              const EdgeInsets.symmetric(horizontal: 100, vertical: 5),
                                                        ),
                                                        const SizedBox(height: 16.0),
                                                      ],
                                                    ),
                                                  ),
                                                  sheetHeight: size.height * 0.45,
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 6.0),
                                      Expanded(
                                        child: DefaultButton(
                                          title: "Book Appointment",
                                          fontSize: 12,
                                          onTap: () async {
                                            _bookAppointment(context);
                                          },
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox.shrink(),
                          ],
                        );
                      } else {
                        return Center(
                          child: MyText(
                            title: "Patient didn't submit his answers",
                            size: 12,
                            color: MyColors.grey,
                          ),
                        );
                      }
                    } else {
                      return Shimmer.fromColors(
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
                      );
                    }
                  },
                ),
                const SizedBox(height: 28),
              ],
            );
          } else {
            return Center(child: LoadingDialog.showLoadingView());
          }
        },
      ),
    );
  }

  DateTime? appointmentDate;

  void _bookAppointment(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());

    showCupertinoModalPopup(
      context: context,
      builder: (_) => CupertinoTheme(
        data: CupertinoThemeData(
          brightness: Brightness.light,
          textTheme: CupertinoTextThemeData(primaryColor: Theme.of(context).primaryColor),
          primaryContrastingColor: Theme.of(context).primaryColor,
        ),
        child: CupertinoActionSheet(
          cancelButton: CupertinoButton(
            onPressed: () async {
              if (appointmentDate != null) {
                Map<String, dynamic> body = {
                  "doctor_id": psychologistPatientDetailsData.patSurgeonId ?? '',
                  "patient_id": widget.patientModel.sId ?? "",
                  "appointment_date": appointmentDate!.toIso8601String(),
                };
                UpdateOrderStatusResponse? result = await GenericHttp<UpdateOrderStatusResponse>(context).callApi(
                  name: ApiNames.bookAppointmentDate,
                  returnType: ReturnType.Model,
                  methodType: MethodType.Post,
                  returnDataFun: (data) => data,
                  jsonBody: body,
                  toJsonFunc: (json) => UpdateOrderStatusResponse.fromJson(json),
                );
                log("data=> ${result?.toJson()}");
                if (result?.success ?? false) {
                  Navigator.of(context).pop();
                  CustomToast.showSimpleToast(msg: result?.message?.messageEn ?? "");
                  psychologistPatientDetailsData.getPatientDetails(context, widget.patientId);
                } else {
                  CustomToast.showSimpleToast(msg: result?.message?.messageEn ?? "");
                }
              }
            },
            color: Theme.of(context).scaffoldBackgroundColor,
            child: MyText(
              title: "Confirm Date",
              size: 14,
              color: MyColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                minimumDate: DateTime.now(),
                maximumDate: DateTime(2050),
                onDateTimeChanged: (DateTime picked) {
                  appointmentDate = picked;
                },
              ),
            ),
          ],
        ),
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
        key: PsychologistPatientDetailsData().formKey,
        child: ListView(
          shrinkWrap: true,
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
              bloc: PsychologistPatientDetailsData().dateBloc,
              listener: (context, state) {
                PsychologistPatientDetailsData().appointmentDate.text = state.data ?? '';
              },
              builder: (context, state) {
                return GenericTextField(
                  hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
                  fieldTypes: FieldTypes.clickable,
                  fillColor: MyColors.textFields,
                  hint: "Appointment Date",
                  controller: PsychologistPatientDetailsData().appointmentDate,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  action: TextInputAction.next,
                  onTab: () => PsychologistPatientDetailsData().chooseFromDate(context),
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
            MyText(title: "Clinic Name", size: 12, fontWeight: FontWeight.bold),
            GenericTextField(
              hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
              fieldTypes: FieldTypes.normal,
              fillColor: MyColors.textFields,
              hint: "Clinic Name",
              controller: PsychologistPatientDetailsData().clinicName,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.text,
              validate: (value) => value!.validateEmpty(context),
            ),
            MyText(title: "Notes", size: 12, fontWeight: FontWeight.bold),
            GenericTextField(
              hintColor: Theme.of(context).textTheme.subtitle1?.color?.withOpacity(.8),
              fieldTypes: FieldTypes.normal,
              fillColor: MyColors.textFields,
              hint: "Notes",
              controller: PsychologistPatientDetailsData().notes,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.text,
              validate: (value) => value!.validateEmpty(context),
            ),
            DefaultButton(
                title: "Confirm Date",
                onTap: () {
                  PsychologistPatientDetailsData().addAppointment(context, patientId);
                },
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
          ],
        ),
      ),
    );
  }
}
