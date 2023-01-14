part of 'SurHomeWImports.dart';

class BuildSurHomeDrawer extends StatelessWidget {
  const BuildSurHomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserData? user = context.read<UserCubit>().state.model.userData?[0];
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
                      onTap: ()=>Nav.navigateTo(SurAccountSetting(), navigatorType: NavigatorType.push),
                      child: Row(
                        children: [
                          CachedImage(
                            url: user?.email ?? "https://picsum.photos/203",
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                            // borderColor: MyColors.primary,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                title: user?.gender ?? "Samer Hany",
                                size: 14,
                                color: MyColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                              MyText(
                                title: user?.role ?? "Surgeon",
                                size: 12,
                                color: MyColors.black,
                              ),
                            ],
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
                    onTap: () =>Nav.navigateTo(SurNotifications(), navigatorType: NavigatorType.push),
                    title: MyText(
                      title: "Notifications",
                      size: 12,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(Res.imagesPatientDrawer, scale: 2.8),
                    onTap: () => Nav.navigateTo(SurPatient(index: 0,), navigatorType: NavigatorType.push),
                    title: MyText(
                      title: "Patients",
                      size: 12,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(Res.imagesMdtopdrawer, scale: 2.5),
                    onTap: () => Nav.navigateTo(SurMdtDiscussions(), navigatorType: NavigatorType.push),
                    title: MyText(
                      title: "MDT Discussions",
                      size: 12,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListTile(
                    leading:
                        Image.asset(Res.imagesOperationsdrawer, scale: 2.8),
                    onTap: () => Nav.navigateTo(SurOperations(), navigatorType: NavigatorType.push),
                    title: MyText(
                      title: "Operations",
                      size: 12,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListTile(
                    leading:
                        Image.asset(Res.imagesAppointmentsdrawer, scale: 2.8),
                    onTap: () => Nav.navigateTo(SurFollowUps(), navigatorType: NavigatorType.push),
                    title: MyText(
                      title: "Follow-ups",
                      size: 12,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
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
