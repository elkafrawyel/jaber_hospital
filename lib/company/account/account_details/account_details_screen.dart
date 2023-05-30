import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../general/blocks/auth_cubit/auth_cubit.dart';
import '../../../general/blocks/lang_cubit/lang_cubit.dart';
import '../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../general/constants/MyColors.dart';
import '../../../general/models/UserModel.dart';
import '../../../general/screens/login/LoginImports.dart';
import '../../../general/utilities/http/dio/http/GenericHttp.dart';
import '../../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../../general/utilities/http/dio/utils/GlobalState.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/CachedImage.dart';
import '../../../general/utilities/tf_custom_widgets/widgets/MyText.dart';
import '../../../general/utilities/utils_functions/Navigator.dart';
import '../../../general/utilities/utils_functions/UtilsImports.dart';
import '../../../general/widgets/GenScaffold.dart';
import '../../../surgeon/screens/sur_patient_details/app_dialog.dart';
import '../update_account/update_account_screen.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserData? user = context.read<UserCubit>().state.model.userData?[0];
    log("${user?.role ?? ''}, name=> ${user?.fullNameEn}");
    return GeneralScaffold(
      back: true,
      title: "Account Settings",
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        children: [
          Column(
            children: [
              CachedImage(
                  url: user?.image ?? 'https://www.w3schools.com/w3images/avatar6.png',
                  height: 100,
                  width: 100,
                  borderRadius: BorderRadius.circular(100)),
              const SizedBox(height: 10),
              MyText(
                title: user?.fullNameEn ?? '',
                size: 12,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          const SizedBox(
            height: 28,
          ),
          _buildRowItem(title: "Name", value: user?.compNameEn ?? "SUMC"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          _buildRowItem(title: "Email", value: user?.email ?? "ahmed@gmail.com"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          _buildRowItem(title: "Contact Person", value: user?.compContactPerson ?? "Ahmed Muhammed"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          _buildRowItem(title: "Mobile Number", value: user?.compContactMobile ?? "0119297397"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          _buildRowItem(title: "Landline", value: user?.compLandLine ?? "02-24364547"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          _buildRowItem(title: "Address", value: user?.compAddress ?? "5 New Cairo, Cairo, Egypt"),
          if (Platform.isIOS)
            InkWell(
              onTap: () {
                deleteAccount(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Delete Account',
                  style: TextStyle(fontSize: 16, color: Colors.red, decoration: TextDecoration.underline),
                ),
              ),
            ),
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
              child:
                  MyText(title: 'Edit Account Details', size: 12, fontWeight: FontWeight.bold, color: MyColors.white),
            ),
          ),
        ],
      ),
    );
  }

  void deleteAccount(BuildContext context) async {
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
          name: 'company/' + context.read<UserCubit>().state.model.userData![0].sId!,
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

  Widget _buildRowItem({String? title, String? value}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: title ?? "",
          size: 13,
          fontWeight: FontWeight.bold,
          color: MyColors.blackOpacity,
        ),
        SizedBox(
          height: 6.0,
        ),
        MyText(
          title: value ?? "",
          size: 11,
          fontWeight: FontWeight.bold,
          color: MyColors.grey,
        )
      ],
    );
  }
}
