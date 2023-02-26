part of 'sur_medication_request_details_imports.dart';

class SurMedicationRequestDetails extends StatefulWidget {
  const SurMedicationRequestDetails({Key? key}) : super(key: key);

  @override
  State<SurMedicationRequestDetails> createState() =>
      _SurMedicationRequestDetailsState();
}

class _SurMedicationRequestDetailsState
    extends State<SurMedicationRequestDetails> {
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
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                    color: Color(0xffB2FFC3),
                    borderRadius: BorderRadius.circular(10)),
                child: MyText(
                  title: "Completed",
                  size: 12,
                  color: Colors.green,
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
                      title: "Loay Hany",
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
                      title: "01234567896",
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
                      title: "19 Oct 2022",
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
                      title: "Liraglutide",
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
                      title: "2",
                      size: 12,
                      color: MyColors.blackOpacity,
                    ),
                  ],
                ),


                DefaultButton(
                  title: "Cancel Order",
                  onTap: () {},
                  borderColor: Colors.red,
                  color: Colors.white,
                  textColor: Colors.red,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                )
              ],
            )
          ],
        ));
  }
}
