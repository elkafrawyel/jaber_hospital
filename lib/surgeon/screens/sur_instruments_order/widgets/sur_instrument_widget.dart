import 'package:flutter/material.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../../general/utilities/utils_functions/Navigator.dart';
import '../../../../general/utilities/utils_functions/UtilsImports.dart';
import '../../../../res/res.dart';
import '../../../models/instrument_order_model.dart';
import '../instrument_order_details.dart';

class SurInstrumentOrderWidget extends StatelessWidget {
  const SurInstrumentOrderWidget({Key? key, required this.index, required this.ordersModel}) : super(key: key);
  final int  index ;
  final InstrumentOrderModel ordersModel;

  @override
  Widget build(BuildContext context) {
    // var model = SurMedicationsOrderData().medicationsOrdersCubit.state.data[index];
    return InkWell(
      onTap: () =>Nav.navigateTo(SurInstrumentRequestDetails(index: index,instrumentOrderModel: ordersModel,), navigatorType: NavigatorType.push),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Color(0xffF2F2F2),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: MyColors.grey, spreadRadius: 1, blurRadius: 5)
            ]),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: MyColors.primary.withOpacity(.1),
                        borderRadius: BorderRadius.circular(100)),
                    child: Image.asset(
                      Res.imagesOrdersDrawer,
                      color: MyColors.primary,
                      scale: 3,
                    )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            title: "Order #${ordersModel.orderNum}",
                            size: 12,
                            color: MyColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(width: 16,),
                          Expanded(
                            child: MyText(
                              title: '${ordersModel.patientId?.firstNameEn?? ''} ${ordersModel.patientId?.lastNameEn?? ''}',
                              size: 12,
                              color: MyColors.primary,
                              fontWeight: FontWeight.bold,
                              alien: TextAlign.end,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        children: [
                          ...List.generate(ordersModel.instruments!.length, (index) => MyText(
                            title: ordersModel.instruments?[index].description??""+", ",
                            size: 10,
                            color: Colors.black87,
                            // color: MyColors.blackOpacity,
                          ),)
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(Res.imagesCalendar,
                                    scale: 3, color: MyColors.primary),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: MyText(
                                    title: Utils.getDate(ordersModel.orderStartDate??''),
                                    size: 10,
                                    color: MyColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Row(
                          //   children: [
                          //     Image.asset(Res.imagesTime,
                          //         scale: 2, color: MyColors.primary),
                          //     const SizedBox(width: 2),
                          //     MyText(
                          //       title: "14:30 PM",
                          //       size: 10,
                          //       color: MyColors.primary,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
