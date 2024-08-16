import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/style/theme/app_constant.dart';
import 'package:career_compass/style/theme/app_them.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class Thema extends AppTheme {
  static const Color primaryColor = Color.fromARGB(255, 249, 169, 32);
  static const Color secondaryColor = Color.fromARGB(255, 249, 209, 36);
  static const Color onPrimaryColor = Color(0xFFFFFFFF);
  static const Color disableColor = Color(0xff8F8F8F);
  static const Color errorColor = Color(0xffc43d4b);
  static const Color onSecondary = Color(0xFF000000);
  static const Color backgroundColor = AppColors.mainColor;
  static LoginTheme loginTheme = LoginTheme(
    primaryColor: backgroundColor,
    pageColorLight: backgroundColor,
    accentColor: Colors.white,
    errorColor: errorColor,
    titleStyle: const TextStyle(
      // color: Colors.greenAccent,
      letterSpacing: 4,
    ),
    bodyStyle: const TextStyle(
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.underline,
    ),
    textFieldStyle: TextStyle(
      fontSize: 16.0,
      color: Colors.black,
    ),
    buttonStyle: const TextStyle(
        fontWeight: FontWeight.w800, color: Colors.white, fontFamily: "Cairo"),
    cardTheme:
        const CardTheme(color: Colors.white, surfaceTintColor: Colors.white),
    switchAuthTextColor: Colors.black,
    inputTheme: InputDecorationTheme(
      filled: false,
      contentPadding: const EdgeInsets.all(20.0),
      errorStyle: const TextStyle(
        color: errorColor,
      ),
      labelStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
        borderRadius: BorderRadius.circular(AppConstant.radius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
        borderRadius: BorderRadius.circular(AppConstant.radius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: errorColor),
        borderRadius: BorderRadius.circular(AppConstant.radius),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade400),
        borderRadius: BorderRadius.circular(AppConstant.radius),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: disableColor),
        borderRadius: BorderRadius.circular(AppConstant.radius),
      ),
    ),
    buttonTheme: LoginButtonTheme(
      splashColor: primaryColor,
      backgroundColor: primaryColor,
      highlightColor: secondaryColor,
      elevation: 9.0,
      highlightElevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstant.radius),
      ),
    ),
  );
}
