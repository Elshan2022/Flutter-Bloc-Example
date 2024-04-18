import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/constants/colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
      elevatedButtonTheme: _elevatedButtonTheme(),
      colorScheme: _colorScheme(),
      appBarTheme: _appBarTheme());

  static ColorScheme _colorScheme() {
    return ColorScheme.fromSeed(
      seedColor: AppColors.primaryDark,
      background: AppColors.white,
    );
  }

  static AppBarTheme _appBarTheme() {
    return const AppBarTheme(
        backgroundColor: AppColors.primaryDark,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ));
  }

  static ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        backgroundColor: AppColors.primaryDark,
      ),
    );
  }
}
