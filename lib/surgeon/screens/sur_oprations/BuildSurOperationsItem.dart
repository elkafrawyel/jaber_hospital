import 'package:base_flutter/surgeon/models/future_operations_response.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../res/res.dart';
import '../sur_patient_details/SurPatientDetailsImports.dart';

class BuildSurOperationsItem extends StatelessWidget {
  final FutureOperationModel operation;

  const BuildSurOperationsItem({
    Key? key,
    required this.operation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime? dateTime = DateTime.tryParse(operation.operationDate ?? '');
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SurPatientDetails(patientId: operation.id?? ''),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  CachedImage(
                    url: operation.image ?? '',
                    height: 65,
                    width: 55,
                    borderRadius: BorderRadius.circular(10),
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          title: '${operation.firstNameEn ?? ''} ${operation.lastNameEn ?? ''}',
                          size: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 5),
                        MyText(
                          title: operation.operationType ?? '',
                          size: 11,
                          color: MyColors.grey,
                        ),
                        const SizedBox(height: 5),
                        dateTime == null
                            ? SizedBox()
                            : Row(
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
                                        title: DateFormat("E ,d MMM y").format(dateTime),
                                        size: 9,
                                        color: MyColors.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        Res.imagesClockIcon,
                                        scale: 3,
                                      ),
                                      const SizedBox(width: 5),
                                      MyText(
                                        title: DateFormat("hh:mm a").format(dateTime),
                                        size: 9,
                                        color: MyColors.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
