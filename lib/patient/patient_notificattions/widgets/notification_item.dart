import 'package:base_flutter/general/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/UtilsImports.dart';

class PatientNotificationItem extends StatelessWidget {
  final NotificationModel item;

  const PatientNotificationItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MyColors.greyWhite),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColors.primary,
                  ),
                  width: 13,
                  height: 13,
                ),
              ),
              Expanded(
                child: Text(
                  "${item.notifcationPatientAr} ${item.doctorId?.firstNameEn} ${item.doctorId?.lastNameEn} بتاريخ ${DateFormat("E ,d MMM y", "ar").format(DateTime.parse(item.createdDate!))}",
                  maxLines: 2,
                ),
              ),
            ],
          ),
          MyText(
            title: DateFormat("E ,d MMM y", "ar").format(DateTime.parse(item.createdAt!)),
            size: 10,
            color: MyColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
