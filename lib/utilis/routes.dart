import 'package:flutter/material.dart';
import 'package:mvvm/utilis/routes_name.dart';
import 'package:mvvm/view/homeview.dart';
import 'package:mvvm/view/loginview.dart';
import 'package:mvvm/view/signupview.dart';
import 'package:mvvm/view/splashview.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashView(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );
      case RoutesName.signup:
        return MaterialPageRoute(
          builder: (BuildContext context) => const Signupview(),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(body: Center(child: Text('No Routes defined')));
          },
        );
    }
  }
}
