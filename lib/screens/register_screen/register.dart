// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/common/custom_button.dart';
import 'package:flutter_bloc_example/common/custom_header.dart';
import 'package:flutter_bloc_example/common/custom_textField.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';
import 'package:flutter_bloc_example/navigation/routes_name.dart';
import 'package:flutter_bloc_example/screens/register_screen/bloc/signUp_event.dart';
import 'package:flutter_bloc_example/screens/register_screen/bloc/signup_bloc.dart';
import 'package:flutter_bloc_example/screens/register_screen/model/signUp_model.dart';
import 'package:flutter_bloc_example/screens/register_screen/sign_up_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends SignUpController {
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
                      hintText: "Name",
                      onChanged: (name) {
                        context.read<SignUpBloc>().add(NameEvent(name: name));
                      },
                    ),
                    const SizedBox(height: 26),
                    CustomTextField(
                      hintText: "Surname",
                      onChanged: (surname) {
                        context
                            .read<SignUpBloc>()
                            .add(SurnameEvent(surname: surname));
                      },
                    ),
                    const SizedBox(height: 26),
                    CustomTextField(
                      hintText: "Phone",
                      keyboardType: TextInputType.number,
                      onChanged: (phone) {
                        context
                            .read<SignUpBloc>()
                            .add(PhoneNumberEvent(phoneNumber: phone));
                      },
                    ),
                    const SizedBox(height: 26),
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
                                confirmPassword: confirmPassword,
                              ),
                            );
                      },
                    ),
                    const SizedBox(height: 53),
                    CustomButton(
                      buttonName: isLoading ? "Loading..." : "Sign up",
                      onPressed: () async {
                        await signUp(
                          SignUpModel(
                            name: state.name,
                            surname: state.surname,
                            phoneNumber: state.phoneNumber,
                            email: state.email,
                            password: state.password,
                            confirmPassword: state.confirmPassword,
                          ),
                          context,
                        );
                      },
                    ),
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
