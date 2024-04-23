// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/screens/allServices/all_services.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/screens/chat/chat_screen.dart';
import 'package:flutter_bloc_example/screens/home_screen/home.dart';
import 'package:flutter_bloc_example/screens/login_screen/login.dart';
import 'package:flutter_bloc_example/screens/profile/profile_screen.dart';
import 'package:flutter_bloc_example/screens/savedEmployers/saved_employer.dart';

class BottomBarMock {
  final List<PersistentBottomNavBarItem> navBarItems = [
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: AppColors.primaryDark,
        inactiveColorPrimary: AppColors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          routes: {
            "/allServices": (context) => const AllServices(),
          },
        )),
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
      routeAndNavigatorSettings: RouteAndNavigatorSettings(
        routes: {
          "/login": (context) => const LoginScreen(),
        },
      ),
    ),
  ];

  List<Widget> buildScreens() {
    return [
      const HomeScreen(),
      const ChatScreen(),
      const SavedEmployer(),
      ProfileScreen(),
    ];
  }
}
