import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/widgets/BuildNotificationIcon.dart';

class BuildComHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    // UserModel user = context.read<UserCubit>().state.model;
    return AppBar(
      backgroundColor: MyColors.white,
      centerTitle: false,
      elevation: 0,
      leadingWidth: 60,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      actions: [
        BuildNotificationIcon() ,
      ],
      title: MyText(
        title: "SUMC",
        size: 12,
        fontWeight: FontWeight.bold,
        color: MyColors.primary,
      ),
      leading: InkWell(
        onTap: () => Scaffold.of(context).openDrawer(),
        child: Icon(
          Icons.menu,
          size: 30,
          color: MyColors.primary,
        ),
      ),
      // actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(55);
}