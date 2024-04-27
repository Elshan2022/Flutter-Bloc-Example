import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';
import 'package:flutter_bloc_example/screens/categoryService/bloc/category_service_bloc.dart';
import 'package:flutter_bloc_example/screens/categoryService/bloc/category_service_state.dart';
import 'package:flutter_bloc_example/screens/detail_screen/detail_screen.dart';
import 'package:flutter_bloc_example/screens/home_screen/widget/user_information_cart.dart';

class CategoryService extends StatelessWidget {
  const CategoryService({super.key, this.category});
  final String? category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: AppColors.white,
          ),
        ),
        title: Text(
          category ?? "Category",
          style: TextStyles.sameBold(
            fontSize: 18,
            color: AppColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<CategoryServiceBloc, CategoryServiceState>(
          builder: (context, state) {
            return Column(
              children: state.categoryServices!.map((service) {
                return EmployerInformationCart(
                  field: service.field ?? "",
                  imagePath: service.image ?? "",
                  name: service.name ?? "",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailScreen(id: service.id);
                        },
                      ),
                    );
                  },
                  raking: service.ratingRank ?? "",
                  salary: service.salary ?? "",
                  surname: service.surname ?? "",
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
