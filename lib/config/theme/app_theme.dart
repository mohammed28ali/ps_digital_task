import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps_digital_task/core/utils/app_constants.dart';

import 'package:ps_digital_task/core/utils/app_sizes.dart';

import '../../core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    hintColor: AppColors.hintColor,
    brightness: Brightness.light,
    splashColor: Colors.transparent,
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primaryColor,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
    ),
    unselectedWidgetColor: AppColors.primaryColor,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    fontFamily: AppConstants.gothicCnd,
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.primaryColor,
        height: 1.3.h,
        fontSize: AppSizes.s22.sp,
        fontFamily: AppConstants.gothicCnd,
        fontWeight: FontWeight.bold,
      ),
    ),
    tabBarTheme: TabBarThemeData(indicatorColor: AppColors.primaryColor),
  );
}
