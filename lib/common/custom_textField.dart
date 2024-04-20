// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.isObscure = false,
    this.onChanged,
    this.padding = 20,
    this.keyboardType = TextInputType.name,
  });
  final String hintText;
  final bool isObscure;
  final Function(String)? onChanged;
  final double padding;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        obscureText: isObscure,
        keyboardType: keyboardType,
        cursorColor: AppColors.primaryDark,
        style: TextStyles.medium(fontSize: 16, color: AppColors.grey),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(padding),
          filled: true,
          fillColor: AppColors.primaryLight,
          hintStyle: TextStyles.medium(fontSize: 16, color: AppColors.grey),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.primaryDark, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
