import 'package:flutter/material.dart';
import 'package:momentmaster/core/constants/size_config.dart';

import 'app_colors.dart';

class AppThemes {
  static ThemeData light = ThemeData(
    fontFamily: 'SFUIText',
    scaffoldBackgroundColor: AppColors.whiteColor,
    cardColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
          fontSize: SizeConfig.fontSizeSmall, color: AppColors.blackFontColor),
    ),
    primaryColor: AppColors.primaryColor,
    // selectedRowColor: AppColors.grayBackgroundColor.withOpacity(1),
    // accentColor: AppColors.primaryColor,
    focusColor: AppColors.black,
    splashColor: AppColors.primaryColor.withOpacity(.15),
    highlightColor: Colors.transparent,
    primaryColorLight: AppColors.lightGreyColor,
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: AppColors.primaryColor,
    ),
    colorScheme:
        const ColorScheme.light(primary: AppColors.primaryColor).copyWith(
      primary: Colors.green,
      background: AppColors.whiteColor,
    ),
  );
  static ThemeData dark = ThemeData(
    fontFamily: 'SFUIText',
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      // brightness: Brightness.light,
    ),
    bottomAppBarTheme:
        BottomAppBarTheme(color: const Color(0xFF121212).withOpacity(1)),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Colors.black),
    // buttonColor: AppColors.black,
    textTheme: TextTheme(
        bodyLarge: TextStyle(
            fontSize: SizeConfig.fontSizeSmall, color: AppColors.whiteColor)),
    focusColor: AppColors.whiteColor,
    primaryColor: AppColors.primaryColor,
    // selectedRowColor: Colors.grey[700],
    cardColor: Colors.grey[900],
    // accentColor: AppColors.primaryColor,
    splashColor: AppColors.primaryColor.withOpacity(.15),
    highlightColor: Colors.transparent,
    primaryColorLight: Colors.grey[900],
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: AppColors.primaryColor,
    ),
    colorScheme: const ColorScheme.light(primary: AppColors.primaryColor)
        .copyWith(primary: Colors.green, background: AppColors.whiteColor),
  );
}
