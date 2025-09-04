import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ps_digital_task/config/routes/app_routes_name.dart';
import 'package:ps_digital_task/core/utils/app_strings.dart';
import 'package:ps_digital_task/features/main_screen/cubit/bottom_nav_cubit.dart';
import 'package:ps_digital_task/features/main_screen/screens/main_screen.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => BottomNavCubit(),
              child: MainScreen(),
            );
          },
        );

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
