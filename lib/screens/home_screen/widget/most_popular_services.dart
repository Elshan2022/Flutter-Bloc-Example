import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';
import 'package:flutter_bloc_example/mock/services_icons_mock.dart';
import 'package:flutter_bloc_example/navigation/routes_name.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/selected_service_bloc.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/selected_service_event.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/selected_service_state.dart';

class MostPopularServices extends StatefulWidget {
  const MostPopularServices({super.key});

  @override
  State<MostPopularServices> createState() => _MostPopularServicesState();
}

class _MostPopularServicesState extends State<MostPopularServices> {
  final ServicesMock _iconMock = ServicesMock();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_title(), _viewAllButton()],
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _iconMock.services.length,
            itemBuilder: (context, index) {
              final title = _iconMock.services.elementAt(index);
              return BlocBuilder<SelectedServiceBloc, SelectedServiceState>(
                builder: (context, state) {
                  final isSelected = state.service == title;
                  return InkWell(
                    onTap: () {
                      context
                          .read<SelectedServiceBloc>()
                          .add(SetSelectedServiceEvent(service: title));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primaryDark
                              : AppColors.grey,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: isSelected
                            ? AppColors.primaryDark
                            : AppColors.white,
                      ),
                      child: Center(
                        child: Text(
                          title,
                          style: TextStyles.medium(
                            fontSize: 14,
                            color: isSelected ? AppColors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  TextButton _viewAllButton() {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed(RoutesName.allServices);
      },
      child: Text(
        "View all",
        style: TextStyles.sameBold(
          fontSize: 14,
          color: AppColors.primaryDark,
        ),
      ),
    );
  }

  Text _title() {
    return Text(
      "Most popular services",
      style: TextStyles.sameBold(
        fontSize: 18,
        color: Colors.black,
      ),
    );
  }
}
