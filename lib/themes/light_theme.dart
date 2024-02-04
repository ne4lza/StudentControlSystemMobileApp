import 'package:flutter/material.dart';
import 'package:kolej_client/themes/app_color.dart';

// ignore: non_constant_identifier_names
ThemeData LightTheme = ThemeData(
  brightness: Brightness.light,
  // ignore: deprecated_member_use
  backgroundColor: AppColor.bodyColor,
  scaffoldBackgroundColor: AppColor.bodyColor,
  hintColor: AppColor.textColor,
  primaryColorLight: AppColor.buttonBackgroundColor,
  textTheme: TextTheme(
    // ignore: deprecated_member_use
    headline1: TextStyle(
      color: Colors.black,
      fontSize: 40,
      fontWeight: FontWeight.bold,

    )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(AppColor.buttonBackgroundColor),
      textStyle: MaterialStateProperty.all<TextStyle?>(TextStyle(color: AppColor.textColor)),
    )
  )

);