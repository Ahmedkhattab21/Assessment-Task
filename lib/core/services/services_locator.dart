import 'package:assesment_task/core/api/api_consumer.dart';
import 'package:assesment_task/core/api/app_interceptor.dart';
import 'package:assesment_task/core/api/http_consumer.dart';
import 'package:assesment_task/features/claces/data/repos/claces_repo.dart';
import 'package:assesment_task/features/claces/data/services%20/claces_service.dart';
import 'package:assesment_task/features/class_details/data/repos/class_details_repo.dart';
import 'package:assesment_task/features/class_details/data/services%20/class_details_service.dart';
import 'package:assesment_task/features/class_details/logic/class_details_state.dart';
import 'package:assesment_task/features/grade_details/data/repos/grade_details_repo.dart';
import 'package:assesment_task/features/grade_details/data/services%20/grade_details_service.dart';
import 'package:assesment_task/features/grades/data/repos/grades_repo.dart';
import 'package:assesment_task/features/grades/data/services%20/grades_service.dart';
import 'package:assesment_task/features/login/data/repos/login_repo.dart';
import 'package:assesment_task/features/login/data/services%20/login_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  static Future<void> init() async {
    ///login
    getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
    getIt.registerFactory<LoginService>(
        () => LoginService(apiConsumer: getIt()));
  ///grades
    getIt.registerLazySingleton<GradesRepo>(() => GradesRepo(getIt()));
    getIt.registerFactory<GradesService>(
        () => GradesService(apiConsumer: getIt()));
    ///grade Details
    getIt.registerLazySingleton<GradeDetailsRepo>(() => GradeDetailsRepo(getIt()));
    getIt.registerFactory<GradeDetailsService>(
        () => GradeDetailsService(apiConsumer: getIt()));
  ///claces
    getIt.registerLazySingleton<ClacesRepo>(() => ClacesRepo(getIt()));
    getIt.registerFactory<ClacesService>(
        () => ClacesService(apiConsumer: getIt()));
    ///class Details
    getIt.registerLazySingleton<ClassDetailsRepo>(() => ClassDetailsRepo(getIt()));
    getIt.registerFactory<ClassDetailsService>(
        () => ClassDetailsService(apiConsumer: getIt()));

    ///core
    getIt.registerLazySingleton<AppInterceptor>(() => AppInterceptor());


    getIt.registerLazySingleton<ApiConsumer>(() => HttpConsumer(getIt()));
    getIt.registerLazySingleton(() => http.Client());

    ///shared secure
    FlutterSecureStorage secureStorage = FlutterSecureStorage();
    getIt.registerLazySingleton(() => secureStorage);
  }
}
