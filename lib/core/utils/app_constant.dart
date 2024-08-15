


import 'package:assesment_task/core/utils/app_colors_white_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:url_launcher/url_launcher.dart';

bool isLoggedInUser = false;
 String language = "";

class AppConstant {

  static toast(String message, Color colors) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: colors,
      textColor: AppColors.whiteColor,
      fontSize: 16.0.sp,
    );
  }

 static String getMonthName(int monthNumber) {
    if (monthNumber < 1 || monthNumber > 12) {
      return 'Invalid month';
    }

    List<String> monthNames = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];

    return monthNames[monthNumber - 1];
  }

  static void openUrl(String webUrl) async {
    final String url = webUrl;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw "Could not launch $url";
    }
  }

}
