import 'package:flutter/material.dart';
import '../../../../../../../general/constants/MyColors.dart';
import '../../../../../../../general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../../../../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';

import '../../../../../../models/mdt_patient_model.dart';

class PatientReadyWidget extends StatelessWidget {
  const PatientReadyWidget({Key? key, required this.patientModel}) : super(key: key);
  final MdtPatientModel patientModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Color(0xfff2f2f2),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CachedImage(
                  url: patientModel.image??'https://picsum.photos/122',
                  height: 60,
                  width: 60,
                  borderRadius: BorderRadius.circular(10),
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MyText(
                              title: patientModel.fullNameEn??"",
                              size: 12,
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
                            title: patientModel.surgeonId?.fullNameEn??"",
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
                            title: patientModel.dietationId?.fullNameEn??"",
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
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                MyText(
                  title: 'MDT Date : ',
                  size: 11,
                  color: MyColors.black,
                  fontWeight: FontWeight.bold,
                ),
                Expanded(
                  child: MyText(
                    title: patientModel.mdtDateTime??"",
                    size: 11,
                    color: MyColors.primary,
                  ),
                ),
                InkWell(
                  onTap: () async{
                    // showDialog(
                    //   context: context,
                    //   builder: (context) =>
                    //       BuildBookTimesDialog(),
                    // );
                    // await mdtAdminData.rescheduleMdtPatient(context, state.data?[index].id??"", index);
                  },
                  child: MyText(
                    title: '(Change)',
                    size: 11,
                    decoration: TextDecoration.underline,
                    color: MyColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // DefaultButton(
          //   width: 160,
          //   margin: const EdgeInsets.symmetric(
          //       horizontal: 16, vertical: 5),
          //   title: "Enter Result",
          //   onTap: () {
          //     showModalBottomSheet(
          //         context: context,
          //         backgroundColor: Colors.transparent,
          //         builder: (context) => BuildMDTResultSheet(patient: state.data![index], index: index,));
          //   },
          // ),
        ],
      ),
    );
  }
}
