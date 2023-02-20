import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/models/UserModel.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../../general/widgets/GenScaffold.dart';
import '../update_account/update_account_screen.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserData? user = context.read<UserCubit>().state.model.userData?[0];
    log("${user?.role??''}, name=> ${user?.fullNameEn}");
    return GeneralScaffold(
        back: true,
        title: "Account Settings",
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          children: [
            Column(
              children: [
                CachedImage(
                    url:user?.image?? 'https://www.w3schools.com/w3images/avatar6.png',
                    height: 100,
                    width: 100,
                    borderRadius: BorderRadius.circular(100)),
                const SizedBox(height: 10),
                MyText(
                  title: user?.fullNameEn??'',
                  size: 12,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            _buildRowItem(title: "Name", value: user?.compNameEn??"SUMC"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Divider(color: Colors.grey,),
            ),
            _buildRowItem(title: "Email", value: user?.email??"ahmed@gmail.com"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Divider(color: Colors.grey,),
            ),
            _buildRowItem(title: "Contact Person", value: user?.compContactPerson??"Ahmed Muhammed"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Divider(color: Colors.grey,),
            ),
            _buildRowItem(title: "Mobile Number", value: user?.compContactMobile??"0119297397"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Divider(color: Colors.grey,),
            ),
            _buildRowItem(title: "Landline", value: user?.compLandLine??"02-24364547"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Divider(color: Colors.grey,),
            ),
            _buildRowItem(title: "Address", value: user?.compAddress??"5 New Cairo, Cairo, Egypt"),
            const SizedBox(
              height: 28,
            ),
            GestureDetector(
              onTap: () => Nav.navigateTo(UpdateAccountScreen(), navigatorType: NavigatorType.push),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                decoration: BoxDecoration(
                  color: MyColors.primary,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: MyColors.greyWhite),
                ),
                alignment: Alignment.center,
                child:MyText(
                  title: 'Edit Account Details',
                  size: 12,
                  fontWeight: FontWeight.bold,
                  color: MyColors.white
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildRowItem({String? title, String? value}){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: title??"",
          size: 13,
          fontWeight: FontWeight.bold,
          color: MyColors.blackOpacity,
        ),
        SizedBox(height: 6.0,),
        MyText(
          title: value??"",
          size: 11,
          fontWeight: FontWeight.bold,
          color: MyColors.grey,
        )
      ],
    );
  }
}
