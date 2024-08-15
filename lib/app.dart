import 'package:assesment_task/config/routes/app_routes.dart';
import 'package:assesment_task/config/routes/routes.dart';
import 'package:assesment_task/config/themes/app_white_theme.dart';
import 'package:assesment_task/core/utils/app_colors_white_theme.dart';
import 'package:assesment_task/core/utils/app_constant.dart';
import 'package:assesment_task/features/login/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, snapshot) {
          // language = context.locale.languageCode;
          return Container(
            color: AppColors.whiteColor,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "TaskApp",
              theme: themeData(),
              // home: LoginScreen(),
              initialRoute:
                  isLoggedInUser ? Routes.homeScreen : Routes.loginScreen,
              onGenerateRoute: RouteGenerator.generateRoute,
            ),
          );
        });
  }
}
