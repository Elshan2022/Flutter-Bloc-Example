import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/navigation/routes_name.dart';
import 'package:flutter_bloc_example/screens/login_screen/login.dart';
import 'package:flutter_bloc_example/service/firbase_service.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final IFirebaseService _service = FirebaseService();

  _fetchUserInfo() async{
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
