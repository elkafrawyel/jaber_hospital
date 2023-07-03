part of 'sur_medication_request_details_imports.dart';

class SurMedicationRequestDetails extends StatefulWidget {
  final int index;

  const SurMedicationRequestDetails({Key? key, required this.index}) : super(key: key);

  @override
  State<SurMedicationRequestDetails> createState() => _SurMedicationRequestDetailsState();
}

class _SurMedicationRequestDetailsState extends State<SurMedicationRequestDetails> {
  SurMedicationsOrderData surMedicationsOrderData = SurMedicationsOrderData();
  late MedicationsOrdersModel model;

  @override
  void initState() {
    model = surMedicationsOrderData.medicationsOrdersCubit.state.data[widget.index];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                      color: model.orderStatus == "inprogress" ? Color(0xffFFF2D9) : Color(0xffB2FFC3),
                      borderRadius: BorderRadius.circular(10)),
                  child: MyText(
                    title: model.orderStatus ?? '',
                    size: 12,
                    color: model.orderStatus == "inprogress" ? Color(0xffEB7826) : Colors.green,
                  ))
          ],
        ),
        back: true,
        title: "Medication Request Details",
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyText(
                  title: "Patient Mobile Number: ",
                  size: 12,
                  color: MyColors.black,
                  fontWeight: FontWeight.bold,
                ),
                MyText(
                  title: model.mobileNumber ?? "",
                  size: 12,
                  color: MyColors.blackOpacity,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyText(
                  title: "Date: ",
                  size: 12,
                  color: MyColors.black,
                  fontWeight: FontWeight.bold,
                ),
                MyText(
                  title: Utils.getDate(model.orderStartDate ?? ""),
                  size: 12,
                  color: MyColors.blackOpacity,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyText(
                  title: "Company: ",
                  size: 12,
                  color: MyColors.black,
                  fontWeight: FontWeight.bold,
                ),
                MyText(
                  title: model.companyId?.companyNameEn ?? "",
                  size: 12,
                  color: MyColors.blackOpacity,
                ),
              ],
            ),
            const SizedBox(height: 10),
            MyText(
              title: "Medications:",
              size: 12,
              color: MyColors.black,
              fontWeight: FontWeight.bold,
              alien: TextAlign.start,
            ),
            const SizedBox(height: 4),
            ...model.medications!
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 7,
                            height: 7,
                            decoration: BoxDecoration(
                              color: MyColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Expanded(
                          child: MyText(
                            title: e.medicationName ?? '',
                            size: 11,
                            color: MyColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        MyText(
                          title: e.quantity?.toString() ?? '',
                          size: 12,
                          fontWeight: FontWeight.bold,
                          color: MyColors.primary,
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
            const SizedBox(height: 10),
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
                              bool result = await surMedicationsOrderData.cancelOrder(
                                context,
                                orderId: model.sId.toString(),
                              );
                              if (result) {
                                log("index=> ${widget.index}");
                                surMedicationsOrderData.medicationsOrdersCubit.state.data.removeAt(widget.index);
                                surMedicationsOrderData.medicationsOrdersCubit
                                    .onUpdateData(surMedicationsOrderData.medicationsOrdersCubit.state.data);
                              }
                            },
                          ));
                },
                borderColor: Colors.red,
                color: Colors.white,
                textColor: Colors.red,
                margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              )
          ],
        ));
  }
}
