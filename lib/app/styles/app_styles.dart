import 'package:flutter/material.dart';

import 'app_fonts.dart';
import 'font_sizes.dart';

class AppStyles {
  AppStyles._();

  static final interboldHeadline1 = AppFonts.inter.bold().withSize(FontSizes.headline1);
  static final interboldHeadline3 = AppFonts.inter.bold().withSize(FontSizes.headline3);
  static final interregularTitle = AppFonts.inter.regular().withSize(FontSizes.title).withColor(Colors.white);
  static final interregularSubTitle = AppFonts.inter.regular().withSize(FontSizes.subtitle).withColor(Colors.white);
  static final interSemiBoldTextButton = AppFonts.inter.semiBold().withSize(FontSizes.title);

  static final rubikboldHeadline1 = AppFonts.rubik.bold().withSize(FontSizes.headline1);
  static final rubikboldHeadline3 = AppFonts.rubik.bold().withSize(FontSizes.headline3);
  static final rubikregularTitle = AppFonts.rubik.regular().withSize(FontSizes.title).withColor(Colors.white);
  static final rubikregularSubTitle = AppFonts.rubik.regular().withSize(FontSizes.subtitle).withColor(Colors.white);

  static final poppinsboldHeadline1 = AppFonts.poppins.bold().withSize(FontSizes.headline1);
  static final poppinsboldHeadline3 = AppFonts.poppins.bold().withSize(FontSizes.headline3);
  static final poppinsregularTitle = AppFonts.poppins.regular().withSize(FontSizes.title).withColor(Colors.white);
  static final poppinsregularSubTitle = AppFonts.poppins.regular().withSize(FontSizes.subtitle).withColor(Colors.white);

  static final urbanistboldHeadline1 = AppFonts.urbanist.bold().withSize(FontSizes.headline1);
  static final urbanistboldHeadline3 = AppFonts.urbanist.bold().withSize(FontSizes.headline3);
  static final urbanistregularTitle = AppFonts.urbanist.regular().withSize(FontSizes.title).withColor(Colors.white);
  static final urbanistregularSubTitle = AppFonts.urbanist.regular().withSize(FontSizes.subtitle).withColor(Colors.white);
}

extension TextStyleExt on TextStyle {
  TextStyle thin() => copyWith(fontWeight: FontWeight.w100);
  TextStyle extraLight() => copyWith(fontWeight: FontWeight.w200);
  TextStyle light() => copyWith(fontWeight: FontWeight.w300);
  TextStyle regular() => copyWith(fontWeight: FontWeight.w400);
  TextStyle medium() => copyWith(fontWeight: FontWeight.w500);
  TextStyle semiBold() => copyWith(fontWeight: FontWeight.w600);
  TextStyle bold() => copyWith(fontWeight: FontWeight.w700);
  TextStyle extraBold() => copyWith(fontWeight: FontWeight.w800);
  TextStyle black() => copyWith(fontWeight: FontWeight.w900);

  TextStyle withSize(double fontSize) => copyWith(fontSize: fontSize);
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle withHeight(double height) => copyWith(height: height);
  TextStyle italic() => copyWith(fontStyle: FontStyle.italic);
}
