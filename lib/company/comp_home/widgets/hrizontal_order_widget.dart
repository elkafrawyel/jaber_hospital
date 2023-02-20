import 'package:base_flutter/company/models/order_model.dart';
import 'package:flutter/material.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../../general/utilities/utils_functions/UtilsImports.dart';
import '../../../res/res.dart';
import '../../order_details/order_details_screen.dart';

class HorizontalOrderWidget extends StatelessWidget {
  const HorizontalOrderWidget({Key? key, required this.index, required this.orderModel}) : super(key: key);
  final int? index;
  final OrderModel? orderModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ()=> Nav.navigateTo(OrderDetailsScreen(orderModel: orderModel!), navigatorType: NavigatorType.push),
      child: Container(
        width: size.width * 0.76,
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
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: MyColors.primaryLightBg,
                shape: BoxShape.circle,
              ),
              child: Image.asset(Res.imagesOrder, width: 30, height: 30),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(title: 'Order# ${orderModel?.orderNum}', size: 13, fontWeight: FontWeight.bold),
                const SizedBox(height: 4),
                if(orderModel!.instruments!.isNotEmpty)...[
                  Wrap(
                    children: [
                      ...List.generate(orderModel?.instruments?.length??0, (index) => MyText(
                          title: "${orderModel?.instruments?[index].code}, ",
                          color: MyColors.grey,
                          size: 10,
                          fontWeight: FontWeight.bold)),
                    ],
                  ),
                ]else...[
                  Wrap(
                    children: [
                      ...List.generate(orderModel?.medications?.length??0, (index) => MyText(
                          title: "${orderModel?.medications?[index].medicationName}, ",
                          color: MyColors.grey,
                          size: 10,
                          fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
                const SizedBox(height: 6),
                Row(
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
                          title: Utils.getDate(orderModel?.createdAt??""),
                          overflow: TextOverflow.ellipsis,
                          size: 9,
                          color: MyColors.primary,
                        ),
                      ],
                    ),
                    const SizedBox(width: 30),
                    Row(
                      children: [
                        Image.asset(
                          Res.imagesClockIcon,
                          scale: 3,
                        ),
                        const SizedBox(width: 5),
                        MyText(
                          title: Utils.getTimeFromStringTimeStamp(orderModel?.createdAt??""),
                          size: 9,
                          overflow: TextOverflow.ellipsis,
                          color: MyColors.primary,
                        ),
                      ],
                    ),
                  ],
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
