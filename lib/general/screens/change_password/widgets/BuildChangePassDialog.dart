part of'ChangePassWidgetsImports.dart';


class BuildChangePassDialog extends StatelessWidget {
  const BuildChangePassDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralAlertDialog(
      alertButtonType: AlertButtonType.noButton,
      alertTextType: AlertContentType.noTitle,
      alertImageType: AlertImageType.noImg,
      customWidget: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: CloseButton(
                color: MyColors.primary,
                onPressed: () => navigationKey.currentState!.pop()),
          ),
          Image.asset(Res.imagesPasswardChanged),
          MyText(
            title: "Password Changed",
            size: 16,
            color: MyColors.primary,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 10),
          MyText(
            title:
            "Your password has been changed successfully!",
            size: 12,
            color: MyColors.black,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
