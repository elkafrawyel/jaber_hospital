import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';

class BuildNotificationIcon extends StatelessWidget {
  const BuildNotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        child: Image.asset(Res.noti,scale: 5),
      ),
    );
  }
}
