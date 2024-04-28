// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/common/custom_button.dart';
import 'package:flutter_bloc_example/common/custom_header.dart';
import 'package:flutter_bloc_example/common/custom_textField.dart';
import 'package:flutter_bloc_example/common/helper_functions.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';
import 'package:flutter_bloc_example/navigation/routes_name.dart';
import 'package:flutter_bloc_example/screens/login_screen/bloc/sign_in_bloc.dart';
import 'package:flutter_bloc_example/screens/login_screen/bloc/sign_in_event.dart';
import 'package:flutter_bloc_example/screens/login_screen/bloc/sign_in_state.dart';
import 'package:flutter_bloc_example/screens/login_screen/widgets/update_password_sheet.dart';
import 'package:flutter_bloc_example/service/firbase_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final IFirebaseService _service = FirebaseService();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 40, left: 16, right: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: bottomPadding),
              child: BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CustomHeader(
                        subtitle: "Welcome back you’ve\n been missed!",
                        title: "Login here",
                      ),
                      const SizedBox(height: 74),
                      CustomTextField(
                        hintText: "Email",
                        onChanged: (email) {
                          context
                              .read<SignInBloc>()
                              .add(EmailEvent(email: email));
                        },
                      ),
                      const SizedBox(height: 29),
                      CustomTextField(
                        hintText: "Password",
                        isObscure: true,
                        onChanged: (password) {
                          context
                              .read<SignInBloc>()
                              .add(PasswordEvent(password: password));
                        },
                      ),
                      const SizedBox(height: 29),
                      _forgotPasswordField(),
                      const SizedBox(height: 30),
                      CustomButton(
                        buttonName: _isLoading ? "Loading..." : "Sign in",
                        onPressed: () async {
                          if (state.email != null && state.password != null) {
                            setState(() {
                              _isLoading = true;
                            });
                            try {
                              await _service.signIn(
                                state.email,
                                state.password,
                              );
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                RoutesName.bottomBar,
                                (route) => false,
                              );
                            } catch (e) {
                              HelperFunctions.showCustomSnackBar(
                                context,
                                e.toString(),
                                Colors.red,
                              );
                            }
                            setState(() {
                              _isLoading = false;
                            });
                          } else {
                            HelperFunctions.showCustomSnackBar(
                              context,
                              "Please enter email and password correctly",
                              Colors.red,
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 40),
                      _createNewAccount(context),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _createNewAccount(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RoutesName.signUp);
        },
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
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            isDismissible: false,
            backgroundColor: AppColors.primaryLight,
            shape: _bottomSheetStyle(),
            builder: (context) {
              return UpdatePasswordSheet();
            },
          );
        },
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

  RoundedRectangleBorder _bottomSheetStyle() {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    );
  }
}
