import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps_digital_task/config/routes/app_routes.dart';
import 'package:ps_digital_task/config/theme/app_theme.dart';
import 'package:ps_digital_task/core/utils/app_strings.dart';

class PSDigitalTaskApp extends StatelessWidget {
  const PSDigitalTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        ScreenUtil.configure(data: MediaQuery.of(context));
        return MaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );
  }
}
