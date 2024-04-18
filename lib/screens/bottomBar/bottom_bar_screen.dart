import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/mock/bottom_bar_mock.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomBarScreen extends StatelessWidget {
  BottomBarScreen({super.key});

  final BottomBarMock _bottomBarMock = BottomBarMock();
  final _navDecoration = NavBarDecoration(
    border: Border(
      top: BorderSide(
        color: AppColors.grey.withOpacity(0.3),
      ),
    ),
  );

  final _padding = const NavBarPadding.only(left: 0, right: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        screens: _bottomBarMock.buildScreens(),
        items: _bottomBarMock.navBarItems,
        padding: _padding,
        decoration: _navDecoration,
      ),
    );
  }
}
