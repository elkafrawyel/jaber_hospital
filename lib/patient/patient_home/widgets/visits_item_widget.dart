import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../../res/res.dart';
import '../../models/patient_appointment_model.dart';
import '../../patient_appointments/appointment_details_screen.dart';

class VisitsItemWidget extends StatelessWidget {
  const VisitsItemWidget({Key? key, required this.index, required this.appointmentModel}) : super(key: key);
  final int index;
  final PatientAppointmentModel appointmentModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ()=> Nav.navigateTo(AppointmentDetailsScreen(appointmentModel: appointmentModel), navigatorType: NavigatorType.push),
      child: Container(
        width: size.width * 0.80,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 68,
                  height: 76,
                  decoration: BoxDecoration(
                      color: MyColors.primaryLightBg,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Image.asset(Res.doctorImage, width: double.infinity, height: double.infinity, fit: BoxFit.cover,),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(title: "${appointmentModel.doctorId?.firstNameAr} ${appointmentModel.doctorId?.lastNameAr}", size: 13, fontWeight: FontWeight.bold),
                      MyText(title: appointmentModel.doctorId?.title??"", size: 12, color:Colors.grey),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Image.asset(
                                  Res.imagesVector,
                                  scale: 3,
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: MyText(
                                    title: appointmentModel.appointmentDate??"",
                                    overflow: TextOverflow.ellipsis,
                                    size: 9,
                                    color: MyColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
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
                                  const SizedBox(width: 2),
                                  MyText(
                                    title: DateFormat("E ,d MMM").format(DateTime.parse(appointmentModel.appointmentDate??"")),
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
                                  const SizedBox(width: 2),
                                  MyText(
                                    title: DateFormat("hh:mm a").format(DateTime.parse(appointmentModel.appointmentDate??"")),
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
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 6.0),
            MyText(title: 'التعليق:', size: 12, fontWeight: FontWeight.bold),
            Text( appointmentModel.comments??"", style: TextStyle(fontSize: 12, color:Colors.grey),maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
