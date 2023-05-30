import 'package:base_flutter/general/utilities/tf_custom_widgets/tf_custom_widgets.dart';
import 'package:flutter/material.dart';

import '../../res/res.dart';
import '../MyApp.dart';
import '../constants/MyColors.dart';

class HeaderLogo extends StatelessWidget {
  final bool back;
  final String? title;
  const HeaderLogo({super.key, this.back = true, this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: back
              ? Row(
                  children: [
                    InkWell(
                        onTap: () => navigationKey.currentState?.pop(),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: MyColors.primary,
                        )),
                  ],
                )
              : const SizedBox(),
        ),
        Container(
            margin: const EdgeInsets.only(bottom: 10, top: 10),
            height: 150,
            width: 150,
            child: Image.asset(
              Res.imagesLogoTeal,
              fit: BoxFit.fill,
            )),
        MyText(
          title: 'Jaber Bariapp',
          size: 13,
          fontWeight: FontWeight.bold,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 30),
          child: MyText(
              title: title ?? 'Sign In',
              size: 15,
              fontWeight: FontWeight.bold,
              color: MyColors.primary),
        ),
      ],
    );
  }
}
