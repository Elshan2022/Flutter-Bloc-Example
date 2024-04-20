import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/navigation/routes_name.dart';
import 'package:flutter_bloc_example/screens/login_screen/login.dart';
import 'package:flutter_bloc_example/service/auth_service.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final IFirebaseAuthService _service = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Screen"),
      ),
      body: ElevatedButton(
          onPressed: () async {
            await _service.signOut();
            PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
              context,
              settings: const RouteSettings(name: RoutesName.login),
              screen: const LoginScreen(),
              withNavBar: false,
            );
          },
          child: const Text("Sign Out")),
    );
  }
}
