import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../general/MyApp.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/UtilsImports.dart';
import '../../../general/widgets/GenScaffold.dart';
import '../../../general/widgets/GeneralAlertDialog.dart';
import '../../models/instrument_order_model.dart';
import 'instruments_orders_data.dart';
import 'tabs/routed_to_company/routed_to_company_data.dart';

class SurInstrumentRequestDetails extends StatefulWidget {
  final int index;
  final InstrumentOrderModel instrumentOrderModel;
  const SurInstrumentRequestDetails({Key? key, required this.index, required this.instrumentOrderModel});

  @override
  State<SurInstrumentRequestDetails> createState() => _SurInstrumentRequestDetailsState();
}

class _SurInstrumentRequestDetailsState extends State<SurInstrumentRequestDetails> {
  SurInstrumentsOrdersData surInstrumentsOrdersData = SurInstrumentsOrdersData();

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
        CustomTitle: Row(
          children: [
            Expanded(
              child: MyText(
                title: "Instrument Request Details",
                size: 14,
                color: MyColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (widget.instrumentOrderModel.orderStatus != "routed to company")
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                      color: widget.instrumentOrderModel.orderStatus == "inprogress"
                          ? Color(0xffFFF2D9)
                          : Color(0xffB2FFC3),
                      borderRadius: BorderRadius.circular(10)),
                  child: MyText(
                    title: widget.instrumentOrderModel.orderStatus ?? '',
                    size: 12,
                    color: widget.instrumentOrderModel.orderStatus == "inprogress"
                        ? Color(0xffEB7826)
                        : Colors.green,
                  ))
          ],
        ),
        back: true,
        title: "Instrument Request Details",
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    MyText(
                      title: "Patient Name: ",
                      size: 12,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    MyText(
                      title: "${widget.instrumentOrderModel.patientId?.firstNameEn} "
                          "${widget.instrumentOrderModel.patientId?.lastNameEn}",
                      size: 12,
                      color: MyColors.blackOpacity,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    MyText(
                      title: "Patient Mobile Number: ",
                      size: 12,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    MyText(
                      title: widget.instrumentOrderModel.patientId?.mobile ?? "",
                      size: 12,
                      color: MyColors.blackOpacity,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    MyText(
                      title: "Date: ",
                      size: 12,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    MyText(
                      title: Utils.getDate(widget.instrumentOrderModel.orderStartDate ?? ""),
                      size: 12,
                      color: MyColors.blackOpacity,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    MyText(
                      title: "Company: ",
                      size: 12,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    MyText(
                      title: widget.instrumentOrderModel.companyId?.companyNameEn ?? "",
                      size: 12,
                      color: MyColors.blackOpacity,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                MyText(
                  title: "Instrument: ",
                  size: 12,
                  color: MyColors.black,
                  fontWeight: FontWeight.bold,
                ),
                Wrap(
                  children: widget.instrumentOrderModel.instruments!.map((e) =>
                      MyText(
                        title: "${e.code} (${e.description}), ",
                        size: 12,
                        color: MyColors.blackOpacity,
                      ),).toList(),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    MyText(
                      title: "Quantity: ",
                      size: 12,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    MyText(
                      title: "${widget.instrumentOrderModel.medicationsDetails?.length ?? 0}",
                      size: 12,
                      color: MyColors.blackOpacity,
                    ),
                  ],
                ),
                if (widget.instrumentOrderModel.orderStatus != "completed")
                  DefaultButton(
                    title: "Cancel Order",
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => GeneralAlertDialog(
                            alertButtonType: AlertButtonType.dueButton,
                            alertTextType: AlertContentType.title,
                            alertImageType: AlertImageType.noImg,
                            headTitle: "Are you sure you want to cancel ?",
                            rightButtonTitle: "Yes",
                            leftButtonTitle: "No",
                            onTapLeftButton: () {
                              navigationKey.currentState!.pop();
                            },
                            onTapRightButton: () async {
                              bool result = await SurInstrumentsOrdersData()
                                  .cancelOrder(context, orderId: widget.instrumentOrderModel.sId.toString(),);
                              if (result) {
                                log("index=> ${widget.index}");
                                RoutedToCompanyData().routedCompanyInstruments?.removeAt(widget.index);
                                RoutedToCompanyData()
                                    .routedCompanyCubit
                                    .onUpdateData(RoutedToCompanyData().routedCompanyInstruments);
                              }
                            },
                          ));
                    },
                    borderColor: Colors.red,
                    color: Colors.white,
                    textColor: Colors.red,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20),
                  )
              ],
            )
          ],
        ));
  }
}
