import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          _title(),
          const SizedBox(height: 26),
          _subtitle(),
        ],
      ),
    );
  }

  SizedBox _subtitle() {
    return SizedBox(
      height: 60,
      child: Text(
        subtitle,
        textAlign: TextAlign.center,
        style: TextStyles.sameBold(fontSize: 20),
      ),
    );
  }

  SizedBox _title() {
    return SizedBox(
      height: 45,
      child: Text(
        title,
        style: TextStyles.bold(color: AppColors.primaryDark, fontSize: 30),
      ),
    );
  }
}
