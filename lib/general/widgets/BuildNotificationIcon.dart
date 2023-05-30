import 'package:base_flutter/general/utilities/utils_functions/Navigator.dart';
import 'package:flutter/material.dart';

import '../../res/res.dart';
import '../../surgeon/screens/sur_notifications/SurNotificationsImports.dart';

class BuildNotificationIcon extends StatelessWidget {
  const BuildNotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Nav.navigateTo(SurNotifications(), navigatorType: NavigatorType.push),
      child: Container(
        child: Image.asset(Res.imagesNotifications, scale: 2.5),
      ),
    );
  }
}
