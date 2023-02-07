part of 'SurMdtDiscussionsWImports.dart';

class BuildReasonDialog extends StatelessWidget {
  final String? hint, headerTitle;
  const BuildReasonDialog({Key? key, this.hint, this.headerTitle})
      : super(key: key);

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
                title: headerTitle ?? "Reason",
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
                hint: hint ?? "Reason",
                max: 3,
                controller: SurMdtDiscussionsData().reason,
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
        SurMdtDiscussionsData().decisionTypeCubit.onUpdateData(1);
      },
    );
  }
}
