import 'package:flutter/material.dart';
import '../../general/constants/MyColors.dart';
import '../../general/utilities/http/dio/http/GenericHttp.dart';
import '../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../general/utilities/utils_functions/ApiNames.dart';
import '../../general/utilities/utils_functions/Navigator.dart';
import '../../general/utilities/utils_functions/UtilsImports.dart';
import '../../general/widgets/GenScaffold.dart';
import '../../general/widgets/modal_bottom_sheet.dart';
import '../comp_home/home_screen.dart';
import '../instruments/widgets/header_widget.dart';
import '../instruments/widgets/instrument_list_item.dart';
import '../models/comp_order_model.dart';
import '../models/order_model.dart';
import 'dart:developer';

import '../models/update_order_status_response.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key, required this.orderModel})
      : super(key: key);
  final OrderModel orderModel;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  int quantity = 0;

  @override
  void initState() {
    // TODO: implement initState
    widget.orderModel.instrumentsDetails!.forEach((order) =>
    quantity+=(order.quantity??0),
    );
    log("quantity==> $quantity");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GeneralScaffold(
        back: true,
        title: 'Order# ${widget.orderModel.orderNum}',
        actions: [
          if (widget.orderModel.orderStatus == "completed") ...[
            _buildOrderStatus(
                status: widget.orderModel.orderStatus ?? "",
                txtColor: MyColors.green),
          ] else ...[
            _buildOrderStatus(
                status: widget.orderModel.orderStatus ?? "",
                txtColor: MyColors.orange),
          ]
        ],
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 10),
                children: [
                  _buildRowItem(
                      title: "Patient Name",
                      value: "${widget.orderModel.patientId?.firstNameEn} ${widget.orderModel.patientId?.lastNameEn}"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  _buildRowItem(
                      title: "Patient Mobile",
                      value: widget.orderModel.mobileNumber?? ""),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  _buildRowItem(
                      title: "Request Time",
                      value: "${Utils.getDate(widget.orderModel.orderStartDate??"")}, ${Utils.getTimeFromStringTimeStamp(widget.orderModel.orderStartDate??"")}"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  _buildRowItem(
                      title: "Quantity",
                      value: quantity.toString()),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: MyText(
                      title: "Request Details",
                      size: 13,
                      fontWeight: FontWeight.bold,
                      color: MyColors.blackHeader,
                    ),
                  ),
                  ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      shrinkWrap: true,
                      itemCount: widget.orderModel.instruments?.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            HeaderWidget(
                              title:
                                  widget.orderModel.instruments?[index].code ??
                                      "",
                            ),
                            InstrumentsItemWidget(
                                itemDesc: widget.orderModel.instruments?[index]
                                        .description ?? "", itemQuantity: (widget.orderModel.instrumentsDetails?[index]
                                .quantity??0).toString() ,),
                          ],
                        );
                      })
                ],
              ),
            ),
            if (widget.orderModel.orderStatus == "routed to company")...[
              DefaultButton(title: "Respond to Order", onTap: () {
                // UpdateAccountData().saveCompProfile(context);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  isDismissible: false,
                  builder: (BuildContext context) {
                    return ModelBottomSheet(
                      child: _buildBottomChangeStatus(widget.orderModel.orderStatus??""),
                      sheetHeight: size.height * 0.38,
                    );
                  },
                );
              },margin: const EdgeInsets.symmetric(horizontal: 100,vertical: 5),),
            ] else if(widget.orderModel.orderStatus == "inprogress")...[
              DefaultButton(title: "Respond to Order", onTap: () {
                // UpdateAccountData().saveCompProfile(context);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  isDismissible: false,
                  builder: (BuildContext context) {
                    return ModelBottomSheet(
                      child: _buildBottomChangeStatus(widget.orderModel.orderStatus??""),
                      sheetHeight: size.height * 0.38,
                    );
                  },
                );
              },margin: const EdgeInsets.symmetric(horizontal: 100,vertical: 5),),
            ],
            const SizedBox(
              height: 16.0,
            ),
          ],
        ));
  }

  Widget _buildRowItem({String? title, String? value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: title ?? "",
            size: 13,
            fontWeight: FontWeight.bold,
            color: MyColors.blackHeader,
          ),
          SizedBox(
            height: 6.0,
          ),
          MyText(
            title: value ?? "",
            size: 11,
            fontWeight: FontWeight.bold,
            color: MyColors.grey,
          )
        ],
      ),
    );
  }

  Widget _buildBottomChangeStatus(String status) {
    String? nStatus;
    return StatefulBuilder(
      builder: (context, setInnerState) => Column(
        children: [
          Center(
            child: MyText(
              title: "Order Status",
              size: 15,
              fontWeight: FontWeight.bold,
              color: MyColors.primary,
            ),
          ),
          const SizedBox(height: 16.0),
          status=="inprogress"? const SizedBox.shrink():RadioListTile(
            title: Text("In Progress"),
            value: "inprogress",
            groupValue: nStatus,
            onChanged: (value) {
              setInnerState(() {
                nStatus = value.toString();
              });
            },
          ),
          RadioListTile(
            title: Text("Completed"),
            value: "completed",
            groupValue: nStatus,
            onChanged: (value) {
              setInnerState(() {
                nStatus = value.toString();
              });
            },
          ),
          const SizedBox(height: 10.0),
          DefaultButton(
            height: 38,
            title: "Update",
            onTap: () async{
              log('fetchHomeCompOrders called...');
              Map<String, dynamic> body ={
                "order_status": nStatus,
              };
              UpdateOrderStatusResponse? result = await GenericHttp<UpdateOrderStatusResponse>(context).callApi(
                name: "${ApiNames.updateCompOrderStatus}?order_id=${widget.orderModel.sId}",
                returnType: ReturnType.Model,
                methodType: MethodType.Put,
                returnDataFun: (data) => data,
                jsonBody: body,
                toJsonFunc: (json) => UpdateOrderStatusResponse.fromJson(json),
              );
              log("data=> ${result?.toJson()}");
              if(result?.success??false){
                Navigator.of(context).pop();
                // Navigator.of(context).pop();
                Nav.navigateTo(ComHomeScreen(), navigatorType: NavigatorType.pushAndPopUntil);
                CustomToast.showSimpleToast(msg: result?.message?.messageEn??"");
              } else{
                CustomToast.showSimpleToast(msg: result?.message?.messageEn??"");
              }
            },
            margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 5),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderStatus({String? status, Color? txtColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: txtColor?.withOpacity(0.2),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: MyText(title: status ?? "", size: 14, color: txtColor),
    );
  }
}
