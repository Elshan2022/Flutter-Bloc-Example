import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';
import 'package:flutter_bloc_example/mock/services_icons_mock.dart';
import 'package:flutter_bloc_example/screens/categoryService/bloc/category_service_bloc.dart';
import 'package:flutter_bloc_example/screens/categoryService/bloc/category_service_event.dart';
import 'package:flutter_bloc_example/screens/categoryService/category_service.dart';

class MostUsedServices extends StatelessWidget {
  MostUsedServices({super.key});
  final ServicesMock _iconMock = ServicesMock();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(),
        const SizedBox(height: 20),
        Wrap(
          spacing: 29,
          runSpacing: 20,
          children: _iconMock.icons.map((e) {
            return InkWell(
              onTap: () {
                context.read<CategoryServiceBloc>().add(
                      GetCategoryServiceEvent(
                        category: e["name"],
                      ),
                    );
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return CategoryService(category: e['name']);
                    },
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _icon(e),
                  _subtitle(e),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Text _title() {
    return Text(
      "Most used services",
      style: TextStyles.sameBold(fontSize: 20, color: Colors.black),
    );
  }

  Text _subtitle(Map<String, String> e) {
    return Text(
      e["name"].toString(),
      style: TextStyles.medium(
        fontSize: 14,
        color: Colors.black,
      ),
    );
  }

  Container _icon(Map<String, String> e) {
    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.grey),
      ),
      child: Center(
        child: Image.asset(e["path"]!, height: 30, width: 30),
      ),
    );
  }
}
