part of 'SurHomeWImports.dart';

class BuildSurHomeDrawer extends StatelessWidget {
  const BuildSurHomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserData? user = context.read<UserCubit>().state.model.userData?[0];
    log("${user?.role ?? ''}");

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
                      onTap: () => Nav.navigateTo(SurAccountSetting(),
                          navigatorType: NavigatorType.push),
                      child: Row(
                        children: [
                          CachedImage(
                            url: user?.image ?? "https://picsum.photos/203",
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                            // borderColor: MyColors.primary,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text()
                                MyText(
                                  title: "${user?.firstNameEn??"Samer Hany"} ${user?.lastNameEn}",
                                  size: 13,
                                  color: MyColors.primary,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                ),
                                MyText(
                                  title: user?.role ?? "Surgeon",
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
                    onTap: () => Nav.navigateTo(SurNotifications(),
                        navigatorType: NavigatorType.push),
                    title: MyText(
                      title: "Notifications",
                      size: 12,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(Res.imagesPatientDrawer, scale: 2.8),
                    onTap: () => Nav.navigateTo(
                        SurPatient(
                          index: 0,
                        ),
                        navigatorType: NavigatorType.push),
                    title: MyText(
                      title: "Patients",
                      size: 12,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ExpansionTile(
                    title: MyText(
                      title: "MDT Discussions",
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
                        title: Text("Discussions"),
                        onTap: () => Nav.navigateTo(SurMdtDiscussions(), navigatorType: NavigatorType.push),
                      ),
                      if (user?.mdtAdmin ?? false)
                        ListTile(
                          title: Text("Admin"),
                          onTap: () => Nav.navigateTo(MdtAdmin(), navigatorType: NavigatorType.push),
                        ),
                      //more child menu
                    ],
                  ),
                  ListTile(
                    leading:
                        Image.asset(Res.imagesOperationsdrawer, scale: 2.8),
                    onTap: () => Nav.navigateTo(SurOperations(),
                        navigatorType: NavigatorType.push),
                    title: MyText(
                      title: "Operations",
                      size: 12,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(Res.imagesAppointmentsdrawer, scale: 2.8),
                    onTap: () => Nav.navigateTo(SurAppointments(), navigatorType: NavigatorType.push),
                    title: MyText(
                      title: "Appointments",
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
                        onTap: () => Nav.navigateTo(SurInstrumentsOrdersScreen(),
                            navigatorType: NavigatorType.push),
                      ),
                      ListTile(
                        title: Text("Medication"),
                        onTap: () => Nav.navigateTo(SurMedicationOrder(),
                            navigatorType: NavigatorType.push),
                      ),
                      //more child menu
                    ],
                  ),

                  // BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                  //   bloc: SurHomeData().orderSelect,
                  //   builder: (context, state) {
                  //     return Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         ListTile(
                  //           leading:
                  //               Image.asset(Res.imagesOrdersDrawer, scale: 2.8),
                  //           onTap: () => SurHomeData()
                  //               .orderSelect
                  //               .onUpdateData(!state.data),
                  //           title: Row(
                  //             children: [
                  //               Expanded(
                  //                 child: MyText(
                  //                   title: "Orders",
                  //                   size: 12,
                  //                   color: MyColors.black,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //               Icon(
                  //                   !state.data
                  //                       ? Icons.keyboard_arrow_down
                  //                       : Icons.keyboard_arrow_up,
                  //                   color: MyColors.black,
                  //                   size: 20)
                  //             ],
                  //           ),
                  //         ),
                  //         Visibility(
                  //           visible: state.data,
                  //           child: Padding(
                  //             padding:
                  //                 const EdgeInsets.symmetric(horizontal: 40),
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 InkWell(
                  //                   onTap: () => Nav.navigateTo(
                  //                       SurMedicationOrder(),
                  //                       navigatorType: NavigatorType.push),
                  //                   child: MyText(
                  //                     title: "Instruments",
                  //                     size: 12,
                  //                     color: MyColors.black,
                  //                   ),
                  //                 ),
                  //                 const SizedBox(height: 10),
                  //                 InkWell(
                  //                   onTap: () => Nav.navigateTo(
                  //                       SurMedicationOrder(),
                  //                       navigatorType: NavigatorType.push),
                  //                   child: MyText(
                  //                     title: "Medication",
                  //                     size: 12,
                  //                     color: MyColors.black,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         )
                  //       ],
                  //     );
                  //   },
                  // ),
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
