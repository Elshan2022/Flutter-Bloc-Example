import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';
import 'package:flutter_bloc_example/navigation/routes_name.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/user_information_bloc.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/user_information_state.dart';
import 'package:flutter_bloc_example/screens/home_screen/widget/user_image.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<UserInformationBloc, UserInformationState>(
          builder: (context, state) {
            return Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: UserImage(),
                  title: _userName(state),
                  subtitle: _location(state),
                  trailing: _notification(),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(RoutesName.search);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Search",
                          style: TextStyles.medium(
                            fontSize: 16,
                            color: AppColors.grey,
                          ),
                        ),
                        const Icon(Icons.search, color: AppColors.grey),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
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

  Text _location(UserInformationState state) {
    return Text(
      "${state.phoneNumber}",
      style: TextStyles.medium(
        color: AppColors.white,
        fontSize: 12,
      ),
    );
  }

  Text _userName(UserInformationState state) {
    return Text(
      "${state.name} ${state.surname}",
      style: TextStyles.sameBold(
        color: AppColors.white,
        fontSize: 14,
      ),
    );
  }
}
