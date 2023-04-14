import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/models/UserModel.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/widgets/BuildNotificationIcon.dart';

class BuildPatientHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    UserModel user = context.read<UserCubit>().state.model;
    return AppBar(
      backgroundColor: MyColors.white,
      centerTitle: false,
      elevation: 0,
      leadingWidth: 60,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      actions: [
        BuildNotificationIcon() ,
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          MyText(
            title: "مساء الخير، ${user.userData?[0].firstNameAr} ${user.userData?[0].lastNameAr}",
            size: 12,
            fontWeight: FontWeight.bold,
            color: MyColors.primary,
          ),
          MyText(
            title: "كيف حالك اليوم؟",
            size: 11,
            fontWeight: FontWeight.bold,
          )
        ],
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