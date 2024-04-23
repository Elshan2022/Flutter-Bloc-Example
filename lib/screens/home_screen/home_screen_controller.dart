// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/common/helper_functions.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/user_information_bloc.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/user_information_event.dart';
import 'package:flutter_bloc_example/screens/home_screen/home.dart';
import 'package:flutter_bloc_example/service/auth_service.dart';

abstract class HomeScreenController extends State<HomeScreen> {
  final IFirebaseAuthService _service = FirebaseAuthService();
  bool isLoading = false;

  Future<void> fetchUserInformation(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    try {
      final data = await _service.fetchUserInformation();
      if (data != null) {
        context.read<UserInformationBloc>().add(NameEvent(name: data["name"]));
        context
            .read<UserInformationBloc>()
            .add(SurnameEvent(surname: data["surname"]));
        context
            .read<UserInformationBloc>()
            .add(EmailEvent(email: data["email"]));
        context
            .read<UserInformationBloc>()
            .add(PhoneNumberEvent(phoneNumber: data["phoneNumber"]));
      }
    } catch (e) {
      HelperFunctions.showCustomSnackBar(context, e.toString(), Colors.red);
    }
    setState(() {
      isLoading = false;
    });
  }
}
