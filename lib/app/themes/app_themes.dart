import 'package:flutter/material.dart';

import '../index.dart';

class AppThemes {
  AppThemes._();

  //? DARK THEME
  static ThemeData darkTheme = ThemeData(
    applyElevationOverlayColor: true,
    useMaterial3: true,

    colorScheme: const ColorScheme.light(
      background: AppColors.scaffold,
      primary: AppColors.primary,
      secondary: AppColors.secondary,

      //shadow: AppColors.shadow,
    ),
    scaffoldBackgroundColor: AppColors.scaffold,

    //! Primary Icon
    //primaryIconTheme: const IconThemeData(color: AppColors.error),
    //iconTheme: const IconThemeData(color: AppColors.primary),

    //! App Bar
    // appBarTheme: AppBarTheme(
    //   color: AppColors.greyBackground,
    //   elevation: AppConstants.topBar.elevation,
    //   toolbarHeight: AppConstants.appBarHeight,
    //   shadowColor: AppColors.shadow,
    //   centerTitle: true,
    //   iconTheme: const IconThemeData(color: AppColors.primary),
    //   titleTextStyle: AppFonts.helvetica.semiBold().withSize(FontSizes.headline2),
    // ),

    //$ Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: AppConstants.buttons.elevated.elevation,
        shadowColor: AppColors.greyLight,
        minimumSize: Size.fromHeight(AppConstants.buttons.elevated.height),
        backgroundColor: AppColors.secondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppConstants.buttons.radius))),
        // textStyle: AppFonts.helvetica.bold().withSize(FontSizes.headline3),
        foregroundColor: AppColors.scaffold,
      ),
    ),

    //@ Text Button
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        elevation: AppConstants.buttons.elevated.elevation,
        shadowColor: AppColors.greyLight,
        minimumSize: Size.fromHeight(AppConstants.buttons.text.height),
        backgroundColor: AppColors.secondary,
        textStyle: AppFonts.inter.semiBold().withSize(FontSizes.headline3),
        foregroundColor: AppColors.primary,
      ),
    ),

    //! Tab bar
    tabBarTheme: const TabBarTheme(dividerHeight: 0),

    //! Floating Action Button
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      //elevation: AppConstants.buttons.floating.elevation,
      backgroundColor: AppColors.secondary,
      foregroundColor: AppColors.scaffold,
      iconSize: AppConstants.buttons.floating.iconSize,
    ),

    //! Divider
    dividerTheme: const DividerThemeData(
      //  color: AppColors.divider,
      thickness: AppConstants.dividerThickness,
      space: 1,
    ),

    //? Inputs
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppConstants.inputs.horizontalContentPadding,
        vertical: AppConstants.inputs.verticalContentPadding,
      ),
      errorMaxLines: 3,
      suffixIconColor: AppColors.grey,
      alignLabelWithHint: true,
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.remove,
          width: AppConstants.inputs.borderWidth,
        ),
        borderRadius: BorderRadius.circular(AppConstants.inputs.radius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
          width: AppConstants.inputs.borderWidth,
        ),
        borderRadius: BorderRadius.circular(AppConstants.inputs.radius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.secondary,
          width: AppConstants.inputs.borderWidth,
        ),
        borderRadius: BorderRadius.circular(AppConstants.inputs.radius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.remove,
          width: AppConstants.inputs.borderWidth,
        ),
        borderRadius: BorderRadius.circular(AppConstants.inputs.radius),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.remove,
          width: AppConstants.inputs.borderWidth,
        ),
        borderRadius: BorderRadius.circular(AppConstants.inputs.radius),
      ),
    ),

    dialogTheme: DialogTheme(
      backgroundColor: Colors.white,
      contentTextStyle: AppFonts.inter.withSize(FontSizes.subtitle),
    ),

    //! Card
    cardTheme: const CardTheme(
      color: AppColors.greyBackground,
      surfaceTintColor: Colors.transparent,
      // shadowColor: AppColors.shadow,
      //elevation: AppConstants.cardElevation,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppConstants.cardRadius)),
      ),
    ),

    // //! List Tile
    // listTileTheme: ListTileThemeData(
    //   iconColor: AppColors.primary,
    //   textColor: Colors.black,
    //   titleAlignment: ListTileTitleAlignment.top,
    //   //titleTextStyle: AppFonts.helvetica.bold().withSize(FontSizes.headline3),
    //   // subtitleTextStyle: AppFonts.helvetica.regular().withSize(FontSizes.subtitle).withHeight(1.3),
    //   contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    //   horizontalTitleGap: 12,
    //   minVerticalPadding: 20,
    //   style: ListTileStyle.list,
    //   enableFeedback: true,
    //   tileColor: Colors.transparent,
    //   shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(AppConstants.cardRadius)),
    // ),

    // //! Checkbox
    // checkboxTheme: CheckboxThemeData(
    //   checkColor: MaterialStateProperty.all(AppColors.primary),
    //   fillColor: MaterialStateProperty.all(AppColors.accent),
    //   side: const BorderSide(color: AppColors.primary),
    //   shape: const RoundedRectangleBorder(
    //       borderRadius:
    //           BorderRadius.all(Radius.circular(AppConstants.checkboxRadius))),
    // ),

    //! Progress Indicator
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      linearMinHeight: AppConstants.linearProgressIndicatorMinHeight,
      color: AppColors.primary,
      linearTrackColor: AppColors.secondary,
      refreshBackgroundColor: AppColors.secondary,
      circularTrackColor: AppColors.secondary,
    ),

    // //! Tooltip
    // tooltipTheme: TooltipThemeData(
    //   decoration: BoxDecoration(
    //     // color: AppColors.tertiaryShape,
    //     borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
    //   ),
    //   enableFeedback: true,
    //   //textStyle: AppFonts.helvetica.withSize(FontSizes.subtitle).semiBold().withColor(Colors.white),
    // ),

    // //! SnackBar
    // snackBarTheme: SnackBarThemeData(
    //   behavior: SnackBarBehavior.floating,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
    //   ),
    //   elevation: AppConstants.defaultElevation,
    // ),

    //! Chip
    chipTheme: ChipThemeData(
      padding: EdgeInsets.zero,
      elevation: AppConstants.defaultElevation,
      labelPadding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.buttons.oval.radius),
      ),
      // shadowColor: AppColors.shadow,
      backgroundColor: AppColors.inputColor,
      disabledColor: Colors.white,

      //labelStyle: AppFonts.helvetica.withSize(FontSizes.subtitle).semiBold(),
    ),
  );

  //& DARK THEME
  // static ThemeData darkTheme = lightTheme.copyWith(
  //   colorScheme: const ColorScheme.dark(
  //     background: Colors.black54,
  //     primary: Colors.pink,
  //     secondary: AppColors.secondary,
  //     //shadow: AppColors.shadow,
  //   ),
  //   scaffoldBackgroundColor: Colors.black45,
  //   textTheme: GoogleFonts.interTextTheme(),
  //   appBarTheme: lightTheme.appBarTheme.copyWith(
  //     color: AppColors.primary,
  //     titleTextStyle: lightTheme.appBarTheme.titleTextStyle
  //         ?.copyWith(color: AppColors.scaffold),
  //     iconTheme:
  //         lightTheme.appBarTheme.iconTheme?.copyWith(color: AppColors.scaffold),
  //   ),
  // );
}
