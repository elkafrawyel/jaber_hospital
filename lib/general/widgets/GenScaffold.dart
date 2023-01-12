import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utilities/tf_custom_widgets/widgets/MyText.dart';
import 'BuildNotificationIcon.dart';

class GeneralScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool back;
  final bool borderAppbar ;
  final List<Widget>? actions;
  final bool notificationIcon;
  final VoidCallback? onLeadingPressed;
  final Widget? bottomNavigationBar;
  final bool centerTitle;
  final Color? scaffoldBackgroundColor;
  final Color? appBarColor;
  final Color? appBarTitleColor;

  GeneralScaffold({
    required this.back,
    required this.title,
    required this.body,
    this.actions,
    this.onLeadingPressed,
    this.notificationIcon = false,
    this.bottomNavigationBar,
    this.centerTitle = false,
    this.scaffoldBackgroundColor,  this.borderAppbar = false, this.appBarColor, this.appBarTitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor ?? MyColors.white,
      bottomNavigationBar: bottomNavigationBar,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        centerTitle: centerTitle,
        leadingWidth: back == false && centerTitle == false ? 20 : 56,
        backgroundColor:appBarColor?? MyColors.white,
        toolbarHeight: 70,
        titleSpacing: 0,
        elevation: 0,
        title: MyText(
          title: title,
          size: 14,
          color: appBarTitleColor ??MyColors.primary,
          fontWeight: FontWeight.bold,
        ),
        actions: notificationIcon ? [BuildNotificationIcon()] : actions ?? [],
        leading: back
            ? IconButton(
                icon: Icon(Icons.arrow_back_ios,color: MyColors.primary),
                iconSize: 25,
                color: MyColors.white,
                onPressed: onLeadingPressed ?? () => Navigator.pop(context),
              )
            : SizedBox(),
        shape:borderAppbar ? RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(30),
                bottomRight: const Radius.circular(30))) : null,
      ),
      body: body,
    );
  }
}
