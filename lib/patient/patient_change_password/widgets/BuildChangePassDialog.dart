import 'package:flutter/material.dart';

import '../../../general/MyApp.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/widgets/GeneralAlertDialog.dart';
import '../../../res/res.dart';


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
            title: "تم تغيير كلمة السر",
            size: 16,
            color: MyColors.primary,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 10),
          MyText(
            title:
            "تم تغيير كلمة السر بنجاح!",
            size: 12,
            color: MyColors.black,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
