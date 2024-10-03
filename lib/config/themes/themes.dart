import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/size_utils.dart';
import '../constants.dart';

ThemeData getAppTheme(BuildContext context) => ThemeData(useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.gray,
          primary: AppColors.primaryColor,
          onPrimary: Colors.white,
          background: AppColors.white),
      cardColor: Colors.transparent,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        // systemOverlayStyle: SystemUiOverlayStyle(
        //     statusBarColor: AppColors.white,
        //     statusBarBrightness: Brightness.light)
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.iconsGray,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedIconTheme: const IconThemeData(
            color: AppColors.white,
          )),
      /**************************** TextFiled form field *************************/
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: getPadding(start: 16, end: 16),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor),
          borderRadius:
              BorderRadius.all(Radius.circular(AppConstants.circleRadius)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(AppConstants.circleRadius)),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(AppConstants.circleRadius)),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(AppConstants.circleRadius)),
          borderSide: BorderSide.none,
        ),
      ),
    );
