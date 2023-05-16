import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '';
import '../../../general/MyApp.dart';
import '../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/models/UserModel.dart';
import '../../../general/resources/GeneralRepoImports.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../../general/widgets/GeneralAlertDialog.dart';
import '../../../res/res.dart';
import '../../comp_instruments_orders/instruments_orders.dart';
import '../../comp_medications_orders/medications_orders.dart';
import '../../comp_notifications/CompNotificationsImports.dart';
import '../../instruments/instruments_screen.dart';
import '../../profile/profile_screen.dart';

class BuildCompHomeDrawer extends StatelessWidget {
  const BuildCompHomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserData? user = context.read<UserCubit>().state.model.userData?[0];
    log("${user?.role ?? ''}");
    log("${user?.email ?? ''}");

    return Drawer(
        backgroundColor: MyColors.white,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  DrawerHeader(
                    child: InkWell(
                      onTap: () => Nav.navigateTo(CompProfileScreen(),
                          navigatorType: NavigatorType.push),
                      child: Row(
                        children: [
                          CachedImage(
                            url: user?.image ?? "https://picsum.photos/203",
                            height: 68,
                            width: 68,
                            fit: BoxFit.cover,
                            borderRadius: BorderRadius.circular(80),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  title: user?.compNameEn ?? "SUMC",
                                  size: 13,
                                  color: MyColors.primary,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                ),
                                MyText(
                                  title: user?.role ?? "Company",
                                  size: 12,
                                  color: MyColors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(Res.imagesHomedrawer, scale: 2.8),
                    onTap: () => navigationKey.currentState!.pop(),
                    title: MyText(
                      title: "Home",
                      size: 12,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListTile(
                    leading:
                        Image.asset(Res.imagesNotificationIcon, scale: 2.8),
                    onTap: () => Nav.navigateTo(CompNotifications(),
                        navigatorType: NavigatorType.push),
                    title: MyText(
                      title: "Notifications",
                      size: 12,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(Res.imagesOperationsIcon,
                        scale: 2.8, color: Colors.black),
                    onTap: () => Nav.navigateTo(InstrumentsScreen(),
                        navigatorType: NavigatorType.push),
                    title: MyText(
                      title: "Instruments",
                      size: 12,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ExpansionTile(
                    title: MyText(
                      title: "Orders",
                      size: 12,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    leading: Image.asset(
                      Res.imagesOrder,
                      scale: 2.8,
                      color: Colors.black,
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                    //add icon
                    childrenPadding: EdgeInsets.only(left: 60),
                    //children padding
                    children: [
                      ListTile(
                        title: Text("Instruments"),
                        onTap:() => Nav.navigateTo(CompOrdersScreen(), navigatorType: NavigatorType.push),
                      ),

                      ListTile(
                        title: Text("Medications"),
                        onTap: () => Nav.navigateTo(CompMedicationsOrders(), navigatorType: NavigatorType.push),
                      ),
                      //more child menu
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: MyColors.primary),
            ListTile(
              leading: Image.asset(Res.imagesLogoutDrawer, scale: 2.8),
              onTap: () => showDialog(
                  context: context, builder: (context) => LogoutDialog()),
              title: MyText(
                title: "Logout",
                size: 12,
                color: MyColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralAlertDialog(
      alertButtonType: AlertButtonType.dueButton,
      alertTextType: AlertContentType.noTitle,
      alertImageType: AlertImageType.noImg,
      onTapRightButton: () => GeneralHttpMethods(context).logOut(),
      onTapLeftButton: () => navigationKey.currentState!.pop(),
      rightButtonTitle: "Logout",
      leftButtonTitle: "Cancel",
      customWidget: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: CloseButton(
                color: MyColors.primary,
                onPressed: () => navigationKey.currentState!.pop()),
          ),
          MyText(
            title: "Log Out",
            size: 15,
            color: MyColors.primary,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 10),
          MyText(
            title:
                "Are you sure you that you want to log out from your account?",
            size: 12,
            color: MyColors.black,
          ),
        ],
      ),
    );
  }
}
