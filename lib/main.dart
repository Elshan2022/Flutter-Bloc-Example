import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/navigation/navigator_manager.dart';
import 'package:flutter_bloc_example/navigation/routes_name.dart';
import 'package:flutter_bloc_example/screens/detail_screen/bloc/location_bloc.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/selected_service_bloc.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/services_by_category_bloc.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/user_information_bloc.dart';
import 'package:flutter_bloc_example/screens/login_screen/bloc/sign_in_bloc.dart';
import 'package:flutter_bloc_example/screens/login_screen/bloc/update_password_bloc.dart';
import 'package:flutter_bloc_example/screens/register_screen/bloc/signup_bloc.dart';
import 'package:flutter_bloc_example/screens/search_screen/bloc/search_bloc.dart';
import 'package:flutter_bloc_example/theme/theme.dart';

void main() async {
  _statusBarStyle();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => UpdatePasswordBloc()),
        BlocProvider(create: (context) => UserInformationBloc()),
        BlocProvider(create: (context) => SelectedServiceBloc()),
        BlocProvider(create: (context) => ServicesByCategoryBloc()),
        BlocProvider(create: (context) => SearchBloc()),
        BlocProvider(create: (context) => LocationBloc()),


      ],
      child: MaterialApp(
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.splash,
        routes: NavigatorManager().navigators,
      ),
    );
  }
}

_statusBarStyle() {
  return SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
}
