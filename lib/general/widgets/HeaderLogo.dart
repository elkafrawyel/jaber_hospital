import 'package:flutter/material.dart';
import 'package:base_flutter/res.dart';

class HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container( height: 120,
      width: 140,
      margin: EdgeInsets.symmetric(vertical: 50),
      child: Image.asset(Res.logo,fit: BoxFit.contain),
    );
  }
}
