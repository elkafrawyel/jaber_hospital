import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../general/MyApp.dart';
import '../../../general/blocks/user_cubit/user_cubit.dart';
import '../../../general/models/UserModel.dart';
import '../../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../../general/utilities/tf_custom_widgets/utils/CustomButtonAnimation.dart';
import '../../../general/utilities/tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../general/utilities/utils_functions/UtilsImports.dart';
import '../../../surgeon/resources/SurgeonRepoImports.dart';
import '../../resources/CompanyRepository.dart';


class UpdateAccountData{
  static final UpdateAccountData _instance = UpdateAccountData._internal();

  factory UpdateAccountData() => _instance;

  UpdateAccountData._internal();

  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController age;
  late TextEditingController contactPerson;
  late TextEditingController mobileNumber;
  late TextEditingController landline;
  late TextEditingController location;
  late GlobalKey<FormState> formKey;
  late GlobalKey<CustomButtonState> btnKey;
  late GenericBloc<File?> profileImageCubit;

  void initScreen(BuildContext context) {
    formKey = GlobalKey<FormState>();
    this.name = TextEditingController();
    this.email = TextEditingController();
    this.age = TextEditingController();
    this.contactPerson = TextEditingController();
    this.mobileNumber = TextEditingController();
    this.landline = TextEditingController();
    this.location = TextEditingController();
    this.btnKey = GlobalKey<CustomButtonState>();
    this.profileImageCubit = GenericBloc(null);

    this.initProfile(context);
  }

  void initProfile(BuildContext context) {
    UserModel user = context.read<UserCubit>().state.model;
    name.text = user.userData?[0].compNameEn ?? '';
    email.text =user.userData?[0].email ?? '';
    // age.text = user.userData?[0].age ?? '';
    contactPerson.text = user.userData?[0].compContactPerson ?? '';
    mobileNumber.text = user.userData?[0].compContactMobile ?? '';
    landline.text = user.userData?[0].compLandLine ?? '';
    location.text = user.userData?[0].compAddress ?? '';
  }

  setImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      log("pickedFile=> $image");
      profileImageCubit.onUpdateData(image);
    }
    profileImageCubit.onUpdateData(image);
  }

  saveCompProfile(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      btnKey.currentState?.animateForward();
      Map<String, dynamic> body = {
        "email": email.text.trim(),
        "company_name_ar": name.text.trim(),
        "company_name_en": name.text.trim(),
        "company_address": location.text.trim(),
        "company_contact_person": contactPerson.text.trim(),
        "company_contact_mobile": mobileNumber.text.trim(),
        "land_line": landline.text.trim(),
        "file": profileImageCubit.state.data,
      };
      var result = await CompanyRepository(context).updateCompProfile(body);
      if (result) {
        CustomToast.showSnackBar(context,'Edited Successfully');
        navigationKey.currentState!.pop();
        navigationKey.currentState!.pop();
      }
      EasyLoading.dismiss();
    }
  }

  dispose() {
    email.dispose();
    name.dispose();
    age.dispose();
    contactPerson.dispose();
    mobileNumber.dispose();
    landline.dispose();
    location.dispose();
  }
}