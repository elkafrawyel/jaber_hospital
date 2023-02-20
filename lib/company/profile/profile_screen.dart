import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../general/blocks/user_cubit/user_cubit.dart';
import '../../general/constants/MyColors.dart';
import '../../general/models/UserModel.dart';
import '../../general/screens/change_password/ChangePasswordImports.dart';
import '../../general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../general/widgets/GenScaffold.dart';
import '../../res/res.dart';
import '../account/account_details/account_details_screen.dart';

class CompProfileScreen extends StatelessWidget {
  const CompProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel model = context.watch<UserCubit>().state.model;
    return GeneralScaffold(
        back: true,
        title: "Account Details",
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
                  title: model.userData?[0].fullNameEn??'',
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
              onTap: () => Nav.navigateTo(AccountDetailsScreen(), navigatorType: NavigatorType.push),
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
                      title: 'Account Details',
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
          ],
        ));
  }
}
