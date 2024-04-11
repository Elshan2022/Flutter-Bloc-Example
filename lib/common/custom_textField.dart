import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.isObscure = false,
  });
  final String hintText;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        obscureText: isObscure,
        cursorColor: AppColors.primaryDark,
        style: TextStyles.medium(fontSize: 16, color: AppColors.grey),
        decoration: InputDecoration(
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
      ),
    );
  }
}
