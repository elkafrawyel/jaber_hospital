import 'package:flutter/material.dart';
import 'package:base_flutter/res.dart';

class HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 50),
      child: Image.asset(Res.logo, fit: BoxFit.scaleDown,scale: 1,),
    );
  }
}
