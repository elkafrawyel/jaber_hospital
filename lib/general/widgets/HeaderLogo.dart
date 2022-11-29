import 'package:flutter/material.dart';
import '../../res/res.dart';
import '../utilities/utils_functions/UtilsImports.dart';

class HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Utils.changeAppTheme(context);
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 50),
        child: Image.asset(Res.imagesLogo, fit: BoxFit.scaleDown,scale: 1,),
      ),
    );
  }
}
