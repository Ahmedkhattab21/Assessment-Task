import 'package:assesment_task/config/routes/routes.dart';
import 'package:assesment_task/core/services/services_locator.dart';
import 'package:assesment_task/features/claces/logic/claces_cubit.dart';
import 'package:assesment_task/features/claces/ui/claces_screen.dart';
import 'package:assesment_task/features/class_details/logic/class_details_cubit.dart';
import 'package:assesment_task/features/class_details/ui/class_details_screen.dart';
import 'package:assesment_task/features/grade_details/logic/grade_details_cubit.dart';
import 'package:assesment_task/features/grade_details/ui/grade_details_screen.dart';
import 'package:assesment_task/features/grades/logic/grades_cubit.dart';
import 'package:assesment_task/features/grades/ui/grades_screen.dart';
import 'package:assesment_task/features/home/logic/home_cubit.dart';
import 'package:assesment_task/features/home/ui/home_screen.dart';
import 'package:assesment_task/features/login/logic/login_cubit.dart';
import 'package:assesment_task/features/login/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(getIt()),
                  child: const LoginScreen(),
                ));
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => HomeCubit()..getNameFromShared(),
                  child: const HomeScreen(),
                ));
      case Routes.gradesScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => GradesCubit(getIt())..getGrades(),
                  child: const GradesScreen(),
                ));
      case Routes.gradeDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => args['type'] == 1
                      ? (GradeDetailsCubit(getIt()))
                      : (GradeDetailsCubit(getIt())
                        ..getData(args['nameAr'], args['nameEn'])),
                  child: GradeDetailsScreen(
                    type: args['type'],
                    schoolId: args['schoolId'],
                    nameAr: args['nameAr'],
                    nameEn: args['nameEn'],
                    id: args['id'],
                  ),
                ));
      case Routes.clacesScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      ClacesCubit(getIt())..getClaces(args['id']),
                  child: ClacesScreen(
                      className: args['className'], id: args['id']),
                ));
      case Routes.classDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => args['type'] == 1
                  ? (ClassDetailsCubit(getIt()))
                  : (ClassDetailsCubit(getIt())
                ..getData(args['nameAr'], args['nameEn'])),
              child: ClassDetailsScreen(
                type: args['type'],
                gradeId: args['gradeId'],
                schoolId: args['schoolId'],
                nameAr: args['nameAr'],
                nameEn: args['nameEn'],
                id: args['id'],
              ),
            ));
      default:
        return null;
    }
  }
}
