import 'dart:developer';

import 'package:base_flutter/general/utilities/tf_custom_widgets/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? size;
  final double? letterSpace;
  final double? wordSpace;
  final String? fontFamily;
  final TextAlign? alien;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  MyText(
      {required this.title,
        this.color,
      required this.size,
      this.alien,
      this.fontFamily,
      this.decoration,
      this.letterSpace,
      this.wordSpace,
      this.overflow,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    // log("font==> ${fontFamily??WidgetUtils.fontFamily?? (WidgetUtils.lang=="ar"? GoogleFonts.cairo().fontFamily : GoogleFonts.nunito().fontFamily)}");
    // log("lang==> ${WidgetUtils.lang}");
    return Text(
      "$title",
      textAlign: alien ?? TextAlign.start,
      textScaleFactor: 1.2,
      maxLines: 5,
      style: TextStyle(
          color:color?? Theme.of(context).textTheme.subtitle1?.color,
          fontSize: size??16,
          letterSpacing: letterSpace,
          wordSpacing: wordSpace,
          decoration: decoration??TextDecoration.none,
          fontWeight: fontWeight??(WidgetUtils.lang=="ar"?FontWeight.w500:FontWeight.w200),
        fontFamily: fontFamily??WidgetUtils.fontFamily?? (WidgetUtils.lang=="ar"? GoogleFonts.cairo().fontFamily : GoogleFonts.nunito().fontFamily),
      overflow: overflow,
    ));
  }
}
