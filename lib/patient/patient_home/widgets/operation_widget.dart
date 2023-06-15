import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../res/res.dart';
import '../../../surgeon/models/patient_details_model.dart';

class OperationWidget extends StatelessWidget {
  const OperationWidget({Key? key, required this.patientInfo}) : super(key: key);
  final PatientDetailsModel? patientInfo;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.99,
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
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
                color: MyColors.primaryLightBg,
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Image.asset(Res.operationIcon, width: 48, height: 56, color: MyColors.primary,),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  MyText(
                      title: 'تمت العملية في:',
                      size: 13,
                      fontWeight: FontWeight.bold),
                  const SizedBox(width: 5.0),
                  MyText(
                    title: Utils.getDate(patientInfo?.patient?.operationDate??""),
                    overflow: TextOverflow.ellipsis,
                    size: 13,
                    color: MyColors.primary,
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyText(title: patientInfo?.patient?.surgeonId?.firstNameEn??"", size: 13, fontWeight: FontWeight.bold),
                  MyText(title: patientInfo?.patient?.surgeonId?.lastNameEn??"", size: 13, fontWeight: FontWeight.bold),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
