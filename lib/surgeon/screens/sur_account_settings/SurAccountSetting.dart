part of 'SurAccountSettingWImports.dart';

class SurAccountSetting extends StatefulWidget {
  const SurAccountSetting({Key? key}) : super(key: key);

  @override
  State<SurAccountSetting> createState() => _SurAccountSettingState();
}

class _SurAccountSettingState extends State<SurAccountSetting> {
  @override
  Widget build(BuildContext context) {
    UserModel model = context.watch<UserCubit>().state.model;
    return GeneralScaffold(
      back: true,
      title: "Account Settings",
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        children: [
          Column(
            children: [
              CachedImage(
                  url: model.userData?[0].image ?? 'https://www.w3schools.com/w3images/avatar6.png',
                  height: 100,
                  width: 100,
                  borderRadius: BorderRadius.circular(100)),
              const SizedBox(height: 10),
              MyText(
                title: '${model.userData?[0].firstNameEn} ${model.userData?[0].lastNameEn}',
                size: 12,
                fontWeight: FontWeight.bold,
              ),
              MyText(
                title: model.userData?[0].role ?? '',
                size: 11,
                color: MyColors.grey,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => Nav.navigateTo(SurProfile(), navigatorType: NavigatorType.push),
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
          // if(Platform.isIOS)
          InkWell(
            onTap: () {
              deleteAccount();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Delete Account',
                style: TextStyle(fontSize: 16, color: Colors.red, decoration: TextDecoration.underline),
              ),
            ),
          )
        ],
      ),
    );
  }

  void deleteAccount() async {
    scaleAlertDialog(
      context: context,
      title: 'Delete Account',
      body: 'Are you sure you want to delete your account?',
      cancelText: 'Cancel',
      confirmText: 'Submit',
      barrierDismissible: true,
      onCancelClick: () {
        Navigator.pop(context);
      },
      onConfirmClick: () async {
        Navigator.pop(context);
        // http://localhost:5000/api/company/123
        dynamic data = await GenericHttp<bool>(context).callApi(
          // name: 'company/6474d52631cd2da98ca57ee2',
          // name: 'doctor/6473be04344dbb226a5a2434',
          // name: 'patient/644952febc59cd34c82a0495',// done
          name: 'doctor/' + context.read<UserCubit>().state.model.userData![0].sId!,
          returnType: ReturnType.Type,
          methodType: MethodType.Delete,
          returnDataFun: (data) => data,
          showLoader: true,
        );
        if (data != null) {
          Utils.clearSavedData();
          GlobalState.instance.set("token", "");
          Nav.navigateTo(Login(), navigatorType: NavigatorType.pushAndPopUntil);
          context.read<AuthCubit>().onUpdateAuth(false);
          context.read<LangCubit>().onUpdateLanguage("en");

          CustomToast.showSnackBar(context, data["message"]["message_en"]);
        }
      },
    );
  }
}
