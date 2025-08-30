import 'package:flutter/material.dart';
import 'package:ps_digital_task/config/routes/app_routes_name.dart';
import 'package:ps_digital_task/core/utils/app_strings.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
      // return MaterialPageRoute(
      //   builder: (context) {
      //     return const SplashScreen();
      //   },
      // );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) =>
          const Scaffold(body: Center(child: Text(AppStrings.noRouteFound)))),
    );
  }
}
