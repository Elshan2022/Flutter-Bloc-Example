import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';

class HelperFunctions {
  static showCustomSnackBar(
      BuildContext context, String? content, Color backgroundColor,
      [int duration = 3]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: duration),
        backgroundColor: backgroundColor,
        content: Text(
          content ?? "",
          style: TextStyles.sameBold(fontSize: 16, color: AppColors.white),
        ),
      ),
    );
  }
}
