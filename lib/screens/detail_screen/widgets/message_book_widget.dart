import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/common/custom_button.dart';
import 'package:flutter_bloc_example/constants/colors.dart';

class MessageBook extends StatelessWidget {
  const MessageBook({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(top: height * 0.86, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: CustomButton(
              buttonName: "Message",
              backgroundColor: AppColors.primaryLight,
              textColor: AppColors.primaryDark,
              height: 40,
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: CustomButton(
              buttonName: "Book now",
              height: 40,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
