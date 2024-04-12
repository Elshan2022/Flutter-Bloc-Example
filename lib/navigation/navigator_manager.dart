import 'package:flutter_bloc_example/navigation/routes_name.dart';
import 'package:flutter_bloc_example/screens/home_screen/home.dart';
import 'package:flutter_bloc_example/screens/login_screen/login.dart';
import 'package:flutter_bloc_example/screens/register_screen/register.dart';

class NavigatorManager {
  RoutesName routesName = RoutesName();

  final navigators = {
    "/login": (context) => const LoginScreen(),
    "/signUp": (context) => const RegisterScreen(),
    "/home": (context) => const HomeScreen(),
  };
}
