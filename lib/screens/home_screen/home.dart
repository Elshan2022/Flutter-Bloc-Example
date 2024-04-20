import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/screens/home_screen/widget/header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 150),
        child: AppBarWidget(),
      ),
    );
  }
}
