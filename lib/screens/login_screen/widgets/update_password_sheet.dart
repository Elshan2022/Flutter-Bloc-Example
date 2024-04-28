// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/common/custom_button.dart';
import 'package:flutter_bloc_example/common/custom_textField.dart';
import 'package:flutter_bloc_example/common/helper_functions.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';
import 'package:flutter_bloc_example/screens/login_screen/bloc/update_password_bloc.dart';
import 'package:flutter_bloc_example/screens/login_screen/bloc/update_password_event.dart';
import 'package:flutter_bloc_example/screens/login_screen/bloc/update_password_state.dart';
import 'package:flutter_bloc_example/service/firbase_service.dart';

class UpdatePasswordSheet extends StatefulWidget {
  const UpdatePasswordSheet({super.key});

  @override
  State<UpdatePasswordSheet> createState() => _UpdatePasswordSheetState();
}

class _UpdatePasswordSheetState extends State<UpdatePasswordSheet> {
  final _margin = const EdgeInsets.only(left: 16, right: 16, top: 30);
  final IFirebaseService _service = FirebaseService();

  bool _isLoading = false;

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
            child: BlocBuilder<UpdatePasswordBloc, UpdatePasswordState>(
              builder: (context, state) {
                return Column(
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
                    CustomTextField(
                      hintText: "Your email",
                      onChanged: (email) {
                        context
                            .read<UpdatePasswordBloc>()
                            .add(EmailEvent(email: email));
                      },
                    ),
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
                            buttonName: _isLoading ? "Waiting..." : "Confirm",
                            onPressed: () async {
                              final isValid = state.email != null;
                              if (isValid) {
                                setState(() {
                                  _isLoading = true;
                                });
                                try {
                                  await _service.updatePassword(state.email!);
                                  Navigator.pop(context);
                                  HelperFunctions.showCustomSnackBar(
                                    context,
                                    "Email have been sent your email address",
                                    AppColors.primaryDark,
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
                                  "Enter valid email",
                                  Colors.red,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 26),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
