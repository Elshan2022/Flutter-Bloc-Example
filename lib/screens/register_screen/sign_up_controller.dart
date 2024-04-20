// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/common/helper_functions.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/navigation/routes_name.dart';
import 'package:flutter_bloc_example/screens/register_screen/model/signUp_model.dart';
import 'package:flutter_bloc_example/screens/register_screen/register.dart';
import 'package:flutter_bloc_example/service/auth_service.dart';

abstract class SignUpController extends State<RegisterScreen> {
  final IFirebaseAuthService _service = FirebaseAuthService();
  bool isLoading = false;
  Future<void> signUp(SignUpModel model, BuildContext context) async {
    if (model.name == null) {
      HelperFunctions.showCustomSnackBar(
        context,
        "Please check your name field",
        Colors.red,
      );
      return;
    }
    if (model.surname == null) {
      HelperFunctions.showCustomSnackBar(
        context,
        "Please check your surname field",
        Colors.red,
      );
      return;
    }
    if (model.phoneNumber == null) {
      HelperFunctions.showCustomSnackBar(
        context,
        "Please check your phone number field",
        Colors.red,
      );
      return;
    }

    if (model.email == null) {
      HelperFunctions.showCustomSnackBar(
        context,
        "Please check your email!",
        Colors.red,
      );

      return;
    }

    if (model.password == null) {
      HelperFunctions.showCustomSnackBar(
        context,
        "Password must be at least one uppercase and number",
        Colors.red,
      );

      return;
    }

    if (model.confirmPassword == null) {
      HelperFunctions.showCustomSnackBar(
        context,
        "Password must be at least one uppercase and number",
        Colors.red,
      );

      return;
    }

    if (model.password != model.confirmPassword) {
      HelperFunctions.showCustomSnackBar(
        context,
        "Your passwords don't match",
        Colors.red,
      );

      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await _service.signUp(model);
      HelperFunctions.showCustomSnackBar(
        context,
        "You sign up successfully",
        AppColors.primaryDark,
      );
      Navigator.of(context).pushNamed(RoutesName.login);
    } catch (e) {
      HelperFunctions.showCustomSnackBar(context, e.toString(), Colors.red);
      Navigator.of(context).pop();
    }

    setState(() {
      isLoading = false;
    });
  }
}
