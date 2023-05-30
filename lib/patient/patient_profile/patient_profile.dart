import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../general/blocks/user_cubit/user_cubit.dart';
import '../../general/constants/MyColors.dart';
import '../../general/models/UserModel.dart';
import '../../general/screens/change_password/ChangePasswordImports.dart';
import '../../general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../general/utilities/utils_functions/Navigator.dart';
import '../../general/widgets/GenScaffold.dart';
import '../../res/res.dart';
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
    UserModel model = context.watch<UserCubit>().state.model;
    return GeneralScaffold(
        back: true,
        title: "إعدادات الحساب",
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          children: [
            Column(
              children: [
                CachedImage(
                    url:model.userData?[0].image?? 'https://www.w3schools.com/w3images/avatar6.png',
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
                  title: model.userData?[0].role??'',
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
          ],
        ));
  }
}
