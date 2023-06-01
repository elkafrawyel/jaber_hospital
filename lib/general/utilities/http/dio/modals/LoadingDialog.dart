import 'package:base_flutter/general/utilities/http/dio/utils/DioUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../constants/MyColors.dart';
import '../../../tf_custom_widgets/widgets/MyText.dart';

class CustomToast{

  static showConfirmDialog(
      {required BuildContext context,
      required String title,
      required Function() confirm}) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return _alertDialog(title, confirm, context, "تأكيد");
      },
    );
  }

  static showAuthDialog({required BuildContext context}) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return _alertDialog(
            DioUtils.authSentence??"قم بتسجيل الدخول للمتابعة",
            DioUtils.onAuthClick,
            context,
            DioUtils.authConfirm??"دخول");
      },
    );
  }

  static Widget _alertDialog(
      String title, Function()? confirm, BuildContext context, String okText) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: DioUtils.textStyle.copyWith(
          color: Colors.black,
        ),
      ),
      // content: MyText(title: title,size: 12,color: MyColors.blackOpacity,),
      actions: [
        CupertinoDialogAction(
          child: Text(
            DioUtils.authBack??"رجوع",
            style: DioUtils.textStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        CupertinoDialogAction(
          child: Text(
            okText,
            style: DioUtils.textStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          onPressed: confirm,
        ),
      ],
    );
  }

  static showToastNotification(msg,
      {Color? color, Color? textColor, ToastGravity? toastGravity}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: toastGravity ?? ToastGravity.BOTTOM,
        backgroundColor: color ?? DioUtils.primaryColor,
        textColor: textColor ?? Colors.white,
        fontSize: 16.0);
  }

  static showSimpleToast(
      {required String msg, Color? color, Color? textColor}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: color ?? DioUtils.primaryColor,
        textColor: textColor ?? Colors.white,
        fontSize: 16.0);
  }

  static showSnackBar(BuildContext context, String message, {Color backgroundColor = Colors.black54}) {
    final snackBar = SnackBar(
      backgroundColor:backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      duration: Duration(seconds: 1),
      content: MyText(
        title: message,
        color: Colors.white,
        size: 12,
        fontWeight: FontWeight.bold,
      ),
      action: SnackBarAction(
        textColor: MyColors.white,
        label: "Hide",
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
