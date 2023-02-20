import 'package:flutter/material.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/UtilsImports.dart';
import '../../../res/res.dart';
import '../../models/order_model.dart';
import '../../order_details/order_details_screen.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';

class MedicationOrderWidget extends StatelessWidget {
  const MedicationOrderWidget({Key? key, required this.index, required this.order}) : super(key: key);
  final int index;
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ()=> Nav.navigateTo(OrderDetailsScreen(orderModel: order, isMedication: true,), navigatorType: NavigatorType.push),
      child: Container(
        width: size.width,
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
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: MyColors.primaryLightBg,
                shape: BoxShape.circle,
              ),
              child: Image.asset(Res.imagesOrder, width: 36, height: 36,),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(title: 'Order# ${order.orderNum}', size: 13, fontWeight: FontWeight.bold),
                      // Container(
                      //   padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                      //   decoration: BoxDecoration(
                      //     color: MyColors.primaryLightBg,
                      //     borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      //   ),
                      //   child: MyText(title: 'Medication', size: 11),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  if(order.instruments!=null)...[
                    Wrap(
                      children: [
                        ...List.generate(order.instruments?.length??0, (index) => MyText(
                            title: "${order.instruments?[index].code}, ",
                            color: MyColors.grey,
                            size: 10,
                            fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ] else...[
                    Wrap(
                      children: [
                        ...List.generate(order.medications?.length??0, (index) => MyText(
                            title: "${order.medications?[index].medicationName}, ",
                            color: MyColors.grey,
                            size: 10,
                            fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],

                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
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
                              title: Utils.getDate(order.createdAt??""),
                              overflow: TextOverflow.ellipsis,
                              size: 9,
                              color: MyColors.primary,
                            ),
                          ],
                        ),
                        // const SizedBox(width: 30),
                        Row(
                          children: [
                            Image.asset(
                              Res.imagesClockIcon,
                              scale: 3,
                            ),
                            const SizedBox(width: 5),
                            MyText(
                              title: Utils.getTimeFromStringTimeStamp(order.createdAt??""),
                              size: 9,
                              overflow: TextOverflow.ellipsis,
                              color: MyColors.primary,
                            ),
                          ],
                        ),
                      ],
                    ),
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
