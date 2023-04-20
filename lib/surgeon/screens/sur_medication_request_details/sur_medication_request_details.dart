part of 'sur_medication_request_details_imports.dart';

class SurMedicationRequestDetails extends StatefulWidget {
  final int index;

  const SurMedicationRequestDetails({Key? key, required this.index})
      : super(key: key);

  @override
  State<SurMedicationRequestDetails> createState() =>
      _SurMedicationRequestDetailsState();
}

class _SurMedicationRequestDetailsState
    extends State<SurMedicationRequestDetails> {
  SurMedicationsOrderData surMedicationsOrderData = SurMedicationsOrderData();

  @override
  Widget build(BuildContext context) {
    var model =
        surMedicationsOrderData.medicationsOrdersCubit.state.data[widget.index];
    return GeneralScaffold(
        CustomTitle: Row(
          children: [
            Expanded(
              child: MyText(
                title: "Medication Request Details",
                size: 14,
                color: MyColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (model.orderStatus != "routed to company")
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                      color: model.orderStatus == "inprogress"
                          ? Color(0xffFFF2D9)
                          : Color(0xffB2FFC3),
                      borderRadius: BorderRadius.circular(10)),
                  child: MyText(
                    title: model.orderStatus ?? '',
                    size: 12,
                    color: model.orderStatus == "inprogress"
                        ? Color(0xffEB7826)
                        : Colors.green,
                  ))
          ],
        ),
        back: true,
        title: "Medication Request Details",
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            Column(
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
                      title: "${model.patientId?.firstNameEn} ${model.patientId?.lastNameEn}",
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
                      title: model.patientId?.mobile ?? "",
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
                      title: model.orderStartDate ?? "Not Available",
                      size: 12,
                      color: MyColors.blackOpacity,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    MyText(
                      title: "Medication: ",
                      size: 12,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    MyText(
                      title: model.notes ?? "Not Available",
                      size: 12,
                      color: MyColors.blackOpacity,
                    ),
                  ],
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
                      title: "${model.medicationsDetails?.length ?? 0}",
                      size: 12,
                      color: MyColors.blackOpacity,
                    ),
                  ],
                ),
                if (model.orderStatus != "completed")
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
                                  bool result = await surMedicationsOrderData.cancelOrder(context, orderId: model.sId.toString(),);
                                  if (result) {
                                    log("index=> ${widget.index}");
                                    surMedicationsOrderData
                                        .medicationsOrdersCubit.state.data
                                        .removeAt(widget.index);
                                    surMedicationsOrderData
                                        .medicationsOrdersCubit
                                        .onUpdateData(surMedicationsOrderData
                                            .medicationsOrdersCubit.state.data);
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
