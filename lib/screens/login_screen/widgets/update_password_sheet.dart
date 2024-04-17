import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/common/custom_button.dart';
import 'package:flutter_bloc_example/common/custom_textField.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';

class UpdatePasswordSheet extends StatelessWidget {
  const UpdatePasswordSheet({super.key});

  final _margin = const EdgeInsets.only(left: 16, right: 16, top: 30);

  @override
  Widget build(BuildContext context) {
    final padding =
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom);
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedPadding(
          duration: const Duration(milliseconds: 300),
          padding: padding,
          child: Container(
            margin: _margin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Change your password",
                  style: TextStyles.bold(
                    fontSize: 20,
                    color: AppColors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                const CustomTextField(hintText: "New password"),
                const SizedBox(height: 26),
                const CustomTextField(hintText: "Confirm password"),
                const SizedBox(height: 26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomButton(
                        buttonName: "Cancel",
                        onPressed: () {
                        Navigator.of(context).pop();
                        },
                        backgroundColor: Colors.red,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      flex: 1,
                      child: CustomButton(
                        buttonName: "Confirm",
                        onPressed: () {
                          debugPrint("Confirm");
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 26),
              ],
            ),
          ),
        );
      },
    );
  }
}
