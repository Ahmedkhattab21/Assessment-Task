import 'package:assesment_task/app.dart';
import 'package:assesment_task/core/services/cache_helper.dart';
import 'package:assesment_task/core/services/services_locator.dart';
import 'package:assesment_task/core/utils/app_constant.dart';
import 'package:assesment_task/core/utils/constant_keys.dart';
import 'package:assesment_task/core/utils/extentions.dart';
import 'package:assesment_task/features/grades/logic/grades_observer.dart';
import 'package:assesment_task/features/login/logic/login_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 //DONE


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await ServicesLocator.init();
  await CacheHelper.init();


  await checkIfLoggedInUser();
  Bloc.observer = LoginObserver();
  Bloc.observer = GradesObserver();

  runApp(TaskApp());
}

checkIfLoggedInUser() async {
  String? userToken =
  await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
