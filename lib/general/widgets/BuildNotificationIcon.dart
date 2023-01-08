import 'package:base_flutter/general/MyApp.dart';
import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:base_flutter/surgeon/sur_notifications/SurNotificationsImports.dart';
import 'package:flutter/material.dart';

import '../../res/res.dart';

class BuildNotificationIcon extends StatelessWidget {
  const BuildNotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Nav.navigateTo(SurNotifications(), navigatorType: NavigatorType.push),
      child: Container(
        child: Image.asset(Res.imagesNotifications,scale: 2.5),
      ),
    );
  }
}
