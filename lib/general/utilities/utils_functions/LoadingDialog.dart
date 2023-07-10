import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog {
  static showLoadingView({Color? color}) {
    return Center(
      child: SpinKitSpinningLines(
        color: color?? MyColors.primary,
        size: 40.0,
      ),
    );
  }
}