import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/screens/home_screen/home_screen_controller.dart';
import 'package:flutter_bloc_example/screens/home_screen/widget/header_widget.dart';

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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 150),
        child: AppBarWidget(),
      ),
    );
  }
}
