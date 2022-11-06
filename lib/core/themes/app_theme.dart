

import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/app_strings.dart';

ThemeData AppTheme(){
  return ThemeData(
    primaryColor: AppColors.primary,
   scaffoldBackgroundColor: Colors.white,
  //  brightness: Brightness.light,
    fontFamily: AppStrings.fontFamily,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      toolbarTextStyle: TextStyle(
          height: 1.3,
          color: Colors.white,
          fontWeight: FontWeight.bold,fontSize: 22
      ),
      elevation: 0.0,color: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontStyle: FontStyle.italic,
      fontFamily: AppStrings.fontFamily,
        fontSize: 26,

      )
    )
  );
}