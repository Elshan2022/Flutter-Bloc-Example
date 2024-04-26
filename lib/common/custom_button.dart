import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonName,
    this.height = 60,
    this.width = double.maxFinite,
    this.backgroundColor = AppColors.primaryDark,
    this.fontSize = 20,
    this.textColor = AppColors.white,
    required this.onPressed,
  });
  final String buttonName;
  final double height;
  final double width;
  final Function()? onPressed;
  final Color backgroundColor;
  final double fontSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        child: _child(),
      ),
    );
  }

  Text _child() {
    return Text(
      buttonName,
      style: TextStyles.sameBold(
        fontSize: fontSize,
        color: textColor,
      ),
    );
  }
}
