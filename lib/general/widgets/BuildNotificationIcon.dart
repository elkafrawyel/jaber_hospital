import 'package:base_flutter/general/MyApp.dart';
import 'package:flutter/material.dart';

import '../../res/res.dart';

class BuildNotificationIcon extends StatelessWidget {
  const BuildNotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      },
      child: Container(
        child: Image.asset(Res.imagesNoti,scale: 5),
      ),
    );
  }
}
