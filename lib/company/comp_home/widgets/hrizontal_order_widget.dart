import 'package:base_flutter/company/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../../general/utilities/utils_functions/UtilsImports.dart';
import '../../../res/res.dart';
import '../../models/comp_order_model.dart';
import '../../order_details/medications_order_details.dart';
import '../../order_details/order_details_screen.dart';

class HorizontalOrderWidget extends StatelessWidget {
  const HorizontalOrderWidget(
      {Key? key, required this.index, required this.orderModel})
      : super(key: key);
  final int? index;
  final OrderModel? orderModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    DateTime? dateTime = DateTime.tryParse(orderModel?.orderStartDate ?? "");
    return InkWell(
      onTap: () {
        if (orderModel!.instruments!.isNotEmpty)
          Nav.navigateTo(OrderDetailsScreen(orderModel: orderModel!),
              navigatorType: NavigatorType.push);
        else
          Nav.navigateTo(MedicationsOrderDetailsScreen(orderModel: orderModel!),
              navigatorType: NavigatorType.push);
      },
      child: Container(
        width: size.width * 0.78,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(title: 'Order# ${orderModel?.orderNum}',
                      size: 13,
                      fontWeight: FontWeight.bold),
                  const SizedBox(height: 4),
                  Expanded(
                    child: Wrap(
                      children: [
                        if(orderModel!.instruments!.isNotEmpty)...[
                          ...List.generate(orderModel?.instruments?.length ??
                              0, (index) =>
                              Column(
                                children: [
                                  MyText(
                                      title: "${orderModel?.instruments?[index]
                                          .code} - ${orderModel
                                          ?.instruments?[index].description}, ",
                                      color: MyColors.grey,
                                      size: 10,
                                      fontWeight: FontWeight.bold),
                                ],
                              )),
                        ] else
                          ...[
                            ...List.generate(orderModel?.medications?.length ??
                                0, (index) =>
                                Column(
                                  children: [
                                    MyText(
                                        title: "${orderModel
                                            ?.medications?[index]
                                            .medicationName}, ",
                                        color: MyColors.grey,
                                        size: 10,
                                        fontWeight: FontWeight.bold)
                                  ],
                                )),
                          ],

                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              Res.imagesVector,
                              scale: 3,
                            ),
                            const SizedBox(width: 2),
                            Expanded(
                              child: MyText(
                                // title: orderModel?.orderStartDate??"",
                                title: Utils.getDate(orderModel?.orderStartDate ?? ""),
                                overflow: TextOverflow.ellipsis,
                                size: 9,
                                color: MyColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 30),
                      Row(
                        children: [
                          Image.asset(
                            Res.imagesClockIcon,
                            scale: 3,
                          ),
                          const SizedBox(width: 2),
                          MyText(
                            title: DateFormat("hh:mm a").format(dateTime!),
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
