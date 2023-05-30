part of 'SurMdtDiscussionsWImports.dart';

class BuildReasonDialog extends StatefulWidget {
  final String? hint, headerTitle;
  final String? patientId;
  final int? index;
  const BuildReasonDialog({Key? key, this.hint, this.headerTitle, required this.patientId, required this.index})
      : super(key: key);

  @override
  State<BuildReasonDialog> createState() => _BuildReasonDialogState();
}

class _BuildReasonDialogState extends State<BuildReasonDialog> {
  SurMdtDiscussionsData surMdtDiscussionsData =SurMdtDiscussionsData();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    surMdtDiscussionsData.reason.clear();
    log("Reason==> ${widget.headerTitle}");
  }

  @override
  Widget build(BuildContext context) {
    return GeneralAlertDialog(
      alertButtonType: AlertButtonType.dueButton,
      alertTextType: AlertContentType.noTitle,
      alertImageType: AlertImageType.noImg,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      customWidget: Container(
          color: Colors.white,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            shrinkWrap: true,
            children: [
              MyText(
                alien: TextAlign.center,
                title: widget.headerTitle ?? "Reason",
                size: 14,
                fontWeight: FontWeight.bold,
              ),
              GenericTextField(
                hintColor: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.color
                    ?.withOpacity(.8),
                fieldTypes: FieldTypes.rich,
                fillColor: MyColors.textFields,
                hint: widget.hint ?? "Reason",
                max: 3,
                controller: surMdtDiscussionsData.reason,
                margin: const EdgeInsets.symmetric(vertical: 10),
                action: TextInputAction.next,
                type: TextInputType.text,
                validate: (value) => value!.validateEmpty(context),
              ),
              // DefaultButton(
              //   title: "Confirm Booking",
              //   onTap: () {
              //     navigationKey.currentState?.pop();
              //     SurMdtDiscussionsData().tabController.animateTo(1);
              //   },
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              // )
            ],
          )),
      rightButtonTitle: "Confirm",
      leftButtonTitle: "Cancel",
      onTapLeftButton: () {
        navigationKey.currentState?.pop();
      },
      onTapRightButton: () {
        navigationKey.currentState?.pop();
        surMdtDiscussionsData.decisionTypeCubit.onUpdateData(1);
        log("");
        Map<String, dynamic> body = {
          "mdt_results": widget.headerTitle!.contains("Refusal")?"refuse":"re-discussion",
          "mdt_comment": surMdtDiscussionsData.reason.text.trim(),
          "operation_type": '',
          "patient_id": widget.patientId,
        };
        log("reasonBody=> $body");
        MdtTodaysPatientsData().sentMdtPatientRes(context, body, widget.index??0);
      },
    );
  }
}
