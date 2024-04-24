import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/screens/home_screen/home_screen_controller.dart';
import 'package:flutter_bloc_example/screens/home_screen/widget/all_empoyers_widget.dart';
import 'package:flutter_bloc_example/screens/home_screen/widget/header_widget.dart';
import 'package:flutter_bloc_example/screens/home_screen/widget/most_popular_services.dart';
import 'package:flutter_bloc_example/screens/home_screen/widget/most_used_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends HomeScreenController {
  @override
  void initState() {
    fetchUserInformation(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? _buildProgress() : _buildBody();
  }

  Scaffold _buildBody() {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.maxFinite, 150),
        child: AppBarWidget(),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MostUsedServices(),
              const SizedBox(height: 20),
              const MostPopularServices(),
              const SizedBox(height: 20),
              const AllEmployersListView(),
            ],
          ),
        ),
      ),
    );
  }

  Center _buildProgress() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryDark,
      ),
    );
  }
}
