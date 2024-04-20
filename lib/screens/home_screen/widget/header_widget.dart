import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/common/custom_textField.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';
import 'package:flutter_bloc_example/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: _userImage(),
              title: _userName(),
              subtitle: _location(),
              trailing: _notification(),
            ),
            const SizedBox(height: 15),
            const CustomTextField(hintText: "Search", padding: 10),
          ],
        ),
      ),
    );
  }

  IconButton _notification() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.notifications_on_sharp,
        color: AppColors.white,
        size: 20,
      ),
    );
  }

  Row _location() {
    return Row(
      children: [
        const Icon(
          Icons.location_on,
          color: AppColors.white,
          size: 14,
        ),
        const SizedBox(width: 5),
        Text(
          "Porto, Portugal",
          style: TextStyles.medium(
            color: AppColors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Text _userName() {
    return Text(
      "Cristiano Ronaldo",
      style: TextStyles.sameBold(
        color: AppColors.white,
        fontSize: 14,
      ),
    );
  }

  InkWell _userImage() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        width: 50,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
        child: Center(
          child: SvgPicture.asset(Assets.vectors.user, width: 30, height: 30),
        ),
      ),
    );
  }
}
