import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import 'app_fonts.dart';
import 'font_sizes.dart';

class AppStyles {
  AppStyles._();

  static final boldHeadline1 =
      AppFonts.inter.bold().withSize(FontSizes.headline1);
  static final boldHeadline3 =
      AppFonts.inter.bold().withSize(FontSizes.headline3);
  static final regularTitle = AppFonts.inter
      .regular()
      .withSize(FontSizes.title)
      .withColor(AppColors.greyBackground);
  static final regularSubTitle = AppFonts.inter
      .regular()
      .withSize(FontSizes.subtitle)
      .withColor(AppColors.greyRegular);
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
