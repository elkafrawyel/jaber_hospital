import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'package:base_flutter/general/widgets/BuildNotificationIcon.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:flutter/material.dart';

class AuthScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool back;
  final List<Widget>? actions;
  final bool notificationIcon;
  final VoidCallback? onLeadingPressed;

  AuthScaffold({
    required this.title,
    required this.body,
    required this.back,
    this.actions,
    this.onLeadingPressed,
    this.notificationIcon =false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primary,
        toolbarHeight: 70,
        title: MyText(
          title: title,
          size: 12,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        actions:notificationIcon?[BuildNotificationIcon()] :actions ?? [],
        leading: back
            ? IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 25,
                color: MyColors.white,
                onPressed: onLeadingPressed ?? () => Navigator.pop(context),
              )
            : SizedBox(),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        )),
      ),
      body: body,
    );
  }
}
