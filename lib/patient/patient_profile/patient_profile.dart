import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../general/blocks/auth_cubit/auth_cubit.dart';
import '../../general/blocks/lang_cubit/lang_cubit.dart';
import '../../general/blocks/user_cubit/user_cubit.dart';
import '../../general/constants/MyColors.dart';
import '../../general/models/UserModel.dart';
import '../../general/screens/change_password/ChangePasswordImports.dart';
import '../../general/screens/login/LoginImports.dart';
import '../../general/utilities/http/dio/http/GenericHttp.dart';
import '../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../general/utilities/http/dio/utils/GlobalState.dart';
import '../../general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../general/utilities/utils_functions/Navigator.dart';
import '../../general/utilities/utils_functions/UtilsImports.dart';
import '../../general/widgets/GenScaffold.dart';
import '../../res/res.dart';
import '../../surgeon/screens/sur_patient_details/app_dialog.dart';
import '../patient_change_password/ChangePasswordImports.dart';
import 'edit_profile_screen.dart';

class PatientAccountSetting extends StatefulWidget {
  const PatientAccountSetting({Key? key}) : super(key: key);

  @override
  State<PatientAccountSetting> createState() => _SurAccountSettingState();
}

class _SurAccountSettingState extends State<PatientAccountSetting> {
  @override
  Widget build(BuildContext context) {
    UserModel model = context
        .watch<UserCubit>()
        .state
        .model;
    return GeneralScaffold(
      back: true,
      title: "إعدادات الحساب",
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
            onTap: () => Nav.navigateTo(EditPatientProfile(), navigatorType: NavigatorType.push),
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
            onTap: () => Nav.navigateTo(PatientChangePassword(userId: ''), navigatorType: NavigatorType.push),
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
      ),);
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
        dynamic data = await GenericHttp<bool>(context).callApi(
          name: 'patient/' + context
              .read<UserCubit>()
              .state
              .model
              .userData![0].sId!,
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
