import 'package:flutter/material.dart';
import 'package:kolej_client/themes/app_color.dart';

// ignore: non_constant_identifier_names
ThemeData DarkTheme = ThemeData(
  brightness: Brightness.dark,
  // ignore: deprecated_member_use
  backgroundColor: AppColor.bodyColorDark,
  scaffoldBackgroundColor: AppColor.bodyColorDark,
  hintColor: AppColor.textColorDark,
  primaryColorLight: AppColor.buttonBackgroundColorDark,
  textTheme: TextTheme(
    // ignore: deprecated_member_use
    headline1: TextStyle(
      color: Colors.white,
      fontSize: 40,
      fontWeight: FontWeight.bold,

    )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(AppColor.buttonBackgroundColorDark),
      textStyle: MaterialStateProperty.all<TextStyle?>(TextStyle(color: AppColor.textColorDark)),
    )
  )

);