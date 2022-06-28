import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum NavigatorType { animation, push, pushAndPopUntil }
enum AnimationType { fade, scale }

class Nav {
  // GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  // late AnimationController controller;

  static  navigateTo<T>(
    BuildContext context,
    dynamic navigateTo, {
    required NavigatorType navigatorType,
    AnimationType animationType = AnimationType.fade,
  }) {
    switch (navigatorType) {
      case NavigatorType.push:
        if (Platform.isIOS) {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => navigateTo));
        } else {
          Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    animation = CurvedAnimation(
                        parent: animation, curve: Curves.fastOutSlowIn, reverseCurve: Curves.easeInOutBack);
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  pageBuilder: (BuildContext context, Animation<double> animation,
                      Animation<double> secondaryAnimation) =>
                  navigateTo));
        }
        break;
      case NavigatorType.pushAndPopUntil:
        if (Platform.isIOS) {
        Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context)=>navigateTo), (route) => false);
        }else{
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>navigateTo), (route) => false);
        }
        break;
      case NavigatorType.animation:
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  if (animationType == AnimationType.fade) {
                    animation = CurvedAnimation(
                        parent: animation, curve: Curves.fastOutSlowIn, reverseCurve: Curves.easeInOutBack);
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  } else {
                    animation = CurvedAnimation(
                        parent: animation, curve: Curves.elasticInOut,reverseCurve: Curves.elasticIn);
                    return ScaleTransition(
                      alignment: Alignment.center,
                      scale: animation,
                      child: child,
                    );
                  }
                },
                pageBuilder: (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) =>
                    navigateTo));
    }

    // default:
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => navigateTo));
  }
}

// static navigateToButtonSheet(BuildContext context,
//     TickerProviderStateMixin tickerProviderStateMixin, Widget widget, {double? sheetHeight}) {
//   showModalBottomSheet(
//       backgroundColor: Colors.transparent,
//       transitionAnimationController: AnimationController(
//           vsync: tickerProviderStateMixin,
//           duration: Duration(milliseconds: 800)),
//       context: context,
//       builder: (context) =>
//           GeneralButtonSheet(
//               height: sheetHeight ?? MediaQuery.of(context).size.height / 1.5,
//               body: widget));
// }
//
//
// static navigateToDialog(BuildContext context, TickerProviderStateMixin tickerProviderStateMixin, Widget widget,{bool? barrierDismissible}) {
//   showModal(
//     configuration:  FadeScaleTransitionConfiguration(
//       transitionDuration: Duration(milliseconds: 700,),
//       barrierDismissible: barrierDismissible??true
//     ),
//       context: context,
//       builder: (context) =>widget);
// }
