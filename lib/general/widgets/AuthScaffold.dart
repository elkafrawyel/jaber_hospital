import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'package:base_flutter/general/widgets/BuildNotificationIcon.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:flutter/material.dart';

class AuthScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final bool back;
  final List<Widget>? actions;
  final bool notificationIcon;
  final VoidCallback? onLeadingPressed;
  final Widget? bottomNavigationBar;

  AuthScaffold({
    this.title,
    required this.back,
    required this.body,
    this.actions,
    this.onLeadingPressed,
    this.notificationIcon = false,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      resizeToAvoidBottomInset: true,
      appBar:title !=null? AppBar(
        centerTitle: false,
        backgroundColor: MyColors.white,
        toolbarHeight: 70,
        elevation: 0,
        title: MyText(
          title: title??'',
          size: 12,
          color: MyColors.primary,
          fontWeight: FontWeight.bold,
        ),
        actions: notificationIcon ? [BuildNotificationIcon()] : actions ?? [],
        leading: back
            ? IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 25,
                color: MyColors.white,
                onPressed: onLeadingPressed ?? () => Navigator.pop(context),
              )
            : SizedBox(),
      ):null,
      body: body,
    );
  }
}
