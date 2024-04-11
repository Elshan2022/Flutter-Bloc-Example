import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_example/common/custom_button.dart';
import 'package:flutter_bloc_example/common/custom_textField.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 40, left: 16, right: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: _bottomPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _title(),
                  const SizedBox(height: 26),
                  _subtitle(),
                  const SizedBox(height: 74),
                  const CustomTextField(hintText: "Email"),
                  const SizedBox(height: 29),
                  const CustomTextField(hintText: "Password", isObscure: true),
                  const SizedBox(height: 29),
                  _forgotPasswordField(),
                  const SizedBox(height: 30),
                  CustomButton(
                    buttonName: "Sign in",
                    onPressed: () {},
                  ),
                  const SizedBox(height: 40),
                  _createNewAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _createNewAccount() {
    return SizedBox(
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Create new account",
          style: TextStyles.sameBold(
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Align _forgotPasswordField() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Forgot your password?",
          style: TextStyles.sameBold(
            color: AppColors.primaryDark,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  SizedBox _subtitle() {
    return SizedBox(
      height: 60,
      child: Text(
        "Welcome back you’ve\n been missed!",
        textAlign: TextAlign.center,
        style: TextStyles.sameBold(fontSize: 20),
      ),
    );
  }

  SizedBox _title() {
    return SizedBox(
      height: 45,
      child: Text(
        "Login here",
        style: TextStyles.bold(color: AppColors.primaryDark, fontSize: 30),
      ),
    );
  }
}
