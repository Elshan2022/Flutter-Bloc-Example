import 'package:flutter_bloc_example/navigation/routes_name.dart';
import 'package:flutter_bloc_example/screens/allServices/all_services.dart';
import 'package:flutter_bloc_example/screens/bottomBar/bottom_bar_screen.dart';
import 'package:flutter_bloc_example/screens/home_screen/home.dart';
import 'package:flutter_bloc_example/screens/login_screen/login.dart';
import 'package:flutter_bloc_example/screens/register_screen/register.dart';
import 'package:flutter_bloc_example/screens/splash/splash.dart';

class NavigatorManager {
  RoutesName routesName = RoutesName();

  final navigators = {
    "/splash": (context) => const SplashScreen(),
    "/login": (context) => const LoginScreen(),
    "/signUp": (context) => const RegisterScreen(),
    "/home": (context) => const HomeScreen(),
    "/bottomBar": (context) => BottomBarScreen(),
    "/allServices": (context) => const AllServices(),
  };
}
