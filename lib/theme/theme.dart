import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/constants/colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        backgroundColor: AppColors.primaryDark,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryDark,
      background: AppColors.white,
    ),
  );
}
