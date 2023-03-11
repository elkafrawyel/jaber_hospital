import 'package:flutter/material.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../../res/res.dart';
import '../../education_screen.dart';
import '../../models/patient_appointment_model.dart';

class ComingAppointmentWidget extends StatelessWidget {
  const ComingAppointmentWidget({Key? key, required this.index, required this.appointmentModel}) : super(key: key);
  final int index;
  final PatientAppointmentModel appointmentModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ()=> Nav.navigateTo(EducationScreen(), navigatorType: NavigatorType.push),
      child: Container(
        width: size.width * 0.80,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 6.0),
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
              width: 68,
              height: 76,
              decoration: BoxDecoration(
                  color: MyColors.primaryLightBg,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Image.asset(Res.doctorImage, width: double.infinity, height: double.infinity, fit: BoxFit.cover,),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                      title: appointmentModel.doctorId?.fullNameAr??"",
                      size: 13,
                      fontWeight: FontWeight.bold),
                  MyText(title:appointmentModel.doctorId?.title??"", size: 12, color: Colors.grey),
                  const SizedBox(height: 4),
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
                          const SizedBox(width: 5),
                          MyText(
                            title: appointmentModel.appointmentDate??"",
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
