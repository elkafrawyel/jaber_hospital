import 'package:flutter/material.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../res/res.dart';
import '../../../surgeon/models/surgeon_home_model.dart';

class UpComingAppointmentWidget extends StatelessWidget {
  const UpComingAppointmentWidget({Key? key, required this.index, required this.appointment}) : super(key: key);
  final int index;
  final Appointments appointment;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      // onTap: ()=> Nav.navigateTo(EducationScreen(), navigatorType: NavigatorType.push),
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
            CachedImage(
                url: appointment.patientId?.image?? 'https://picsum.photos/201',
                height: 68,
                width: 68,
                borderRadius: BorderRadius.circular(5)),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                      title: appointment.patientId?.fullNameEn??"Loay Hany",
                      size: 13,
                      fontWeight: FontWeight.bold),
                  MyText(title: appointment.patientId?.operationType?? 'Revisional Operation', size: 12, color: Colors.grey),
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
                            title: appointment.appointmentDate??"14 AUG 2022",
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
                            title: appointment.createdAt?.split("-").last.substring(3,8)??"14:30 PM",
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
