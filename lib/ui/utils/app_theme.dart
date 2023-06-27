import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Colors.green;
  static const backgroundColor = Color(0xFFF5F5F5);

  static final theme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.black,
      backgroundColor: Colors.transparent,
      elevation: 0,
      
      centerTitle: true
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryColor
      )
    )
  );
}