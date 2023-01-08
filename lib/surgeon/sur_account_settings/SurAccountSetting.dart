part of 'SurAccountSettingWImports.dart';

class SurAccountSetting extends StatefulWidget {
  const SurAccountSetting({Key? key}) : super(key: key);

  @override
  State<SurAccountSetting> createState() => _SurAccountSettingState();
}

class _SurAccountSettingState extends State<SurAccountSetting> {
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
        back: true,
        title: "Account Settings",
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          children: [
            Column(
              children: [
                CachedImage(
                  //doctor image
                    url: 'https://www.w3schools.com/w3images/avatar6.png',
                    height: 100,
                    width: 100,
                    borderRadius: BorderRadius.circular(100)),
                const SizedBox(height: 10),
                MyText(
                  title: "Samer Hany",
                  size: 12,
                  fontWeight: FontWeight.bold,
                ),
                MyText(
                  title: "Surgeon",
                  size: 11,
                  color: MyColors.grey,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: MyColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: MyColors.greyWhite),
              ),
              child: Row(
                children: [
                  Image.asset(
                    Res.imagesUserIcon,
                    scale: 2.8,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  MyText(
                    title: 'Edit Profile',
                    size: 12,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Nav.navigateTo(ChangePassword(userId: ''), navigatorType: NavigatorType.push),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: MyColors.greyWhite),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      Res.imagesLockIcon,
                      scale: 2.8,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    MyText(
                      title: 'Change Password',
                      size: 12,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
