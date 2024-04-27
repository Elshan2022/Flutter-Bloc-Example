import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';

class SavedEmployer extends StatelessWidget {
  const SavedEmployer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: const SingleChildScrollView(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        "Saved employers",
        style: TextStyles.sameBold(
          color: AppColors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
