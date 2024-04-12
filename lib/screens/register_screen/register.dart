// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/common/custom_button.dart';
import 'package:flutter_bloc_example/common/custom_header.dart';
import 'package:flutter_bloc_example/common/custom_textField.dart';
import 'package:flutter_bloc_example/common/helper_functions.dart';
import 'package:flutter_bloc_example/constants/app_regX.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';
import 'package:flutter_bloc_example/navigation/routes_name.dart';
import 'package:flutter_bloc_example/screens/register_screen/bloc/signUp_event.dart';
import 'package:flutter_bloc_example/screens/register_screen/bloc/signup_bloc.dart';
import 'package:flutter_bloc_example/screens/register_screen/model/signUp_model.dart';
import 'package:flutter_bloc_example/service/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final IFirebaseAuthService _service = FirebaseAuthService();
  final AppRegX _appRegX = AppRegX();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 40, left: 16, right: 16),
          child: SingleChildScrollView(
            child: BlocBuilder<SignUpBloc, SignUpModel>(
              builder: (context, state) {
                return Column(
                  children: [
                    const CustomHeader(
                      title: "Create Account",
                      subtitle:
                          "Create an account so you can explore all the existing jobs",
                    ),
                    const SizedBox(height: 48),
                    CustomTextField(
                      hintText: "Email",
                      onChanged: (email) {
                        context
                            .read<SignUpBloc>()
                            .add(EmailEvent(email: email));
                      },
                    ),
                    const SizedBox(height: 26),
                    CustomTextField(
                      hintText: "Password",
                      isObscure: true,
                      onChanged: (password) {
                        context
                            .read<SignUpBloc>()
                            .add(PasswordEvent(password: password));
                      },
                    ),
                    const SizedBox(height: 26),
                    CustomTextField(
                      hintText: "Confirm password",
                      isObscure: true,
                      onChanged: (confirmPassword) {
                        context.read<SignUpBloc>().add(
                              ConfirmPasswordEvent(
                                  confirmPassword: confirmPassword),
                            );
                      },
                    ),
                    const SizedBox(height: 53),
                    CustomButton(
                        buttonName: isLoading ? "Loading..." : "sign up",
                        onPressed: () async {
                          final isValidEmail =
                              _appRegX.emailRegX.hasMatch(state.email!);
                          final isValidPassword =
                              _appRegX.passwordRegX.hasMatch(state.password!);
                          final isEqual =
                              state.password == state.confirmPassword;

                          if (isValidEmail && isValidPassword && isEqual) {
                            try {
                              setState(() {
                                isLoading = true;
                              });
                              await _service.signUp(
                                SignUpModel(
                                  email: state.email,
                                  password: state.password,
                                  confirmPassword: state.confirmPassword,
                                ),
                              );
                              setState(() {
                                isLoading = false;
                              });
                              HelperFunctions.showCustomSnackBar(
                                context,
                                "You logged successfully",
                                Colors.green,
                                2,
                              );
                              Navigator.of(context).pushNamed(RoutesName.login);
                            } catch (e) {
                              HelperFunctions.showCustomSnackBar(
                                context,
                                e.toString(),
                                Colors.red,
                              );
                            }
                          } else {
                            HelperFunctions.showCustomSnackBar(
                              context,
                              "Please check your email and password",
                              Colors.red,
                            );
                          }
                        }),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(RoutesName.login);
                      },
                      child: Text(
                        "Already have an account",
                        style: TextStyles.sameBold(fontSize: 14),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
