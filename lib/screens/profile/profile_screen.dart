import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/user_information_bloc.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/user_information_state.dart';
import 'package:flutter_bloc_example/service/firbase_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final IFirebaseService _service = FirebaseService();

  _fetchUserInfo() async {
    await _service.fetchUserInformation();
  }

  @override
  void initState() {
    _fetchUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _signOut(),
        ],
        title: _title(),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 40),
        child: BlocBuilder<UserInformationBloc, UserInformationState>(
          builder: (context, state) {
            return Column(
              children: [
                _informationContainer(title: "Name", value: "${state.name}"),
                const SizedBox(height: 15),
                _informationContainer(title: "Surname", value: "${state.surname}"),
                const SizedBox(height: 15),
                _informationContainer(title: "Email", value: state.email),
                const SizedBox(height: 15),
                _informationContainer(title: "Phone", value: state.phoneNumber),
              ],
            );
          },
        ),
      ),
    );
  }

  Column _informationContainer({String? title, String? value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title:",
          style: TextStyles.sameBold(
            color: AppColors.primaryDark,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primaryLight,
            border: Border.all(
              color: AppColors.primaryDark,
              width: 2,
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              value ?? "",
              style: TextStyles.medium(
                fontSize: 16,
                color: AppColors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Text _title() {
    return Text(
      "Profile",
      style: TextStyles.sameBold(
        fontSize: 20,
        color: AppColors.white,
      ),
    );
  }

  Container _signOut() {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: () async => await _service.signOut(),
        child: const Icon(
          Icons.login_outlined,
          color: AppColors.white,
          size: 25,
        ),
      ),
    );
  }
}
