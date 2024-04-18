import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/screens/chat/chat_screen.dart';
import 'package:flutter_bloc_example/screens/home_screen/home.dart';
import 'package:flutter_bloc_example/screens/profile/profile_screen.dart';
import 'package:flutter_bloc_example/screens/savedEmployers/saved_employer.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomBarMock {
  final List<PersistentBottomNavBarItem> navBarItems = [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: "Home",
      activeColorPrimary: AppColors.primaryDark,
      inactiveColorPrimary: AppColors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.chat),
      title: "Chat",
      activeColorPrimary: AppColors.primaryDark,
      inactiveColorPrimary: AppColors.grey,
    ),
    PersistentBottomNavBarItem(
      activeColorPrimary: AppColors.primaryDark,
      inactiveColorPrimary: AppColors.grey,
      icon: const Icon(Icons.bookmark),
      title: "Saved",
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      title: "Profile",
      activeColorPrimary: AppColors.primaryDark,
      inactiveColorPrimary: AppColors.grey,
    ),
  ];

  List<Widget> buildScreens() {
    return const [
      HomeScreen(),
      ChatScreen(),
      SavedEmployer(),
      ProfileScreen(),
    ];
  }
}
