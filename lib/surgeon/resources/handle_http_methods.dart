import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../general/blocks/user_cubit/user_cubit.dart';
import '../../general/models/UserModel.dart';
import '../../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../../general/utilities/http/dio/utils/DioUtils.dart';
import '../../general/utilities/http/dio/utils/GlobalState.dart';
import '../../general/utilities/utils_functions/UtilsImports.dart';


class HandleData {
  HandleData._();

  static final HandleData instance = HandleData._();

  failure(dynamic data, BuildContext context) {
    switch (data["key"]) {
      case 'fail':
        DioUtils.dismissDialog();
        return CustomToast.showSimpleToast(msg: data['msg']);
      case 'exception':
        DioUtils.dismissDialog();
        return CustomToast.showSimpleToast(msg: data['msg']);
      case 'needActive':
        DioUtils.dismissDialog();
        return CustomToast.showSimpleToast(msg: data['msg']);
        case 'notapproved':
        DioUtils.dismissDialog();
        return CustomToast.showSimpleToast(msg: data['msg']);
    }
  }

  /// ********************* post Request ************************
  handlePostData(dynamic data, BuildContext context, {bool fullData = false,bool showMsg = false}) {
    if (data["success"] == true) {
      DioUtils.dismissDialog();
      if(showMsg){
        CustomToast.showSnackBar(context, DioUtils.lang =="en" ? data['message']["message_en"]: data['message']["message_ar"]);
      }
      log("++++++++++++++++++++++++++++++++ received data: ${data.toString()}");
      if (fullData) {
        return data;
      }
      return data["data"];
    }
    return null;
  }

  /// ********************* get Request ************************
  handleGetData(dynamic data, BuildContext context, {bool fullData = false}) {
    if (data["success"] == true) {
      if (fullData) {
        return data;
      }
      return data["data"];
    }
    // return failure(data, context);
  }

  /// ********************* customize Requests ************************

  Future<bool> manipulateUpdateProfileData(
      dynamic data, BuildContext context) async {
    if (data["key"] == "success") {
      DioUtils.dismissDialog();
      CustomToast.showSimpleToast(msg: data['msg']);
      log("++++++++++++++++++++++++++++++++ data ${data.toString()}");
      if (data["data"] != null) {
        log("<>>>>>>>>>>>> data1 ${data.toString()}");
        UserModel user = UserModel.fromJson(data["data"]["user"]);
        user.userData = GlobalState.instance.get("token");
        await Utils.saveUserData(user);
        context.read<UserCubit>().onUpdateUserData(user);
        log("<>>>>>>>>>>>> data2 ${data.toString()}");
      }
      return true;
    } else {
      failure(data, context);
      return false;
    }
  }

}
