import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';

class EmployerInformationCart extends StatelessWidget {
  const EmployerInformationCart({
    super.key,
    required this.imagePath,
    required this.name,
    required this.surname,
    required this.field,
    required this.salary,
    required this.raking,
  });
  final String imagePath;
  final String name;
  final String surname;
  final String field;
  final String salary;
  final String raking;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: _decorationCart(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 110,
            decoration: _decorationRow(),
          ),
          Container(
            width: 225,
            height: 120,
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _nameSurnameAndBookMark(),
                _field(),
                _salary(),
                _raking(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _decorationCart() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppColors.grey.withOpacity(0.12)),
    );
  }

  BoxDecoration _decorationRow() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(imagePath),
      ),
    );
  }

  Row _nameSurnameAndBookMark() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$name $surname",
          style: TextStyles.sameBold(fontSize: 14, color: AppColors.grey),
        ),
        InkWell(
          onTap: () {},
          child: const Icon(Icons.bookmark, color: AppColors.primaryDark),
        )
      ],
    );
  }

  Text _field() {
    return Text(
      field,
      style: TextStyles.sameBold(fontSize: 16, color: Colors.black),
    );
  }

  RichText _salary() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "\$$salary",
            style: TextStyles.sameBold(
              color: AppColors.primaryDark,
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: "/Day",
            style: TextStyles.medium(
              fontSize: 14,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Row _raking() {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.red,
        ),
        const SizedBox(width: 10),
        Text(
          raking,
          style: TextStyles.medium(
            color: AppColors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
