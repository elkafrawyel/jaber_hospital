import 'package:flutter/material.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../models/patient_model.dart';
import '../sur_patient_details/SurPatientDetailsImports.dart';

class BuildPrePostItem extends StatelessWidget {
  final PatientModel patientModel;
  final VoidCallback togglePathway;
  final VoidCallback onPatientArchive;

  const BuildPrePostItem({
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
        children: [
          InkWell(
            onTap: () async {
              bool? result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SurPatientDetails(patientId: patientModel.sId ?? ''),
                ),
              );

              // if (result ?? false) {
              //   onPatientArchive();
              // }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  CachedImage(
                    url: patientModel.image ?? 'https://picsum.photos/182',
                    height: 60,
                    width: 60,
                    borderRadius: BorderRadius.circular(10),
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              title: '${patientModel.fNameEn ?? ""} ${patientModel.lNameEn ?? ""}',
                              size: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            if (patientModel.isArchived ?? false)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),

                                child: MyText(
                                  title: 'Archived',
                                  size: 9,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              title: 'Surgeon : ',
                              size: 11,
                              color: MyColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            Expanded(
                              child: MyText(
                                title:
                                    '${patientModel.surgeonId?.firstNameEn ?? ""} ${patientModel.surgeonId?.lastNameEn ?? ""}',
                                size: 11,
                                color: MyColors.grey,
                              ),
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
                                  '${patientModel.dietationId?.firstNameEn ?? ""} ${patientModel.dietationId?.lastNameEn ?? ""}',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    MyText(
                      title: 'Operation Type : ',
                      size: 11,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    MyText(
                      title: patientModel.operationType ?? '',
                      size: 11,
                      color: MyColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyText(
                      title: 'Operation Done On : ',
                      size: 11,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    MyText(
                      title: patientModel.operationDate?.split("T").first ?? '',
                      size: 11,
                      color: MyColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
