
import 'package:assesment_task/core/utils/app_colors_white_theme.dart';
import 'package:assesment_task/core/utils/spacing.dart';
import 'package:assesment_task/core/utils/styles.dart';
import 'package:assesment_task/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:assesment_task/features/login/ui/widgets/phone_and_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(100),
                Text(
                  "Login",
                  style: TextStyles.font24BlackColorWeight700,
                ),
                verticalSpace(40),
                PhoneAndPassword(),
                verticalSpace(40),
                LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
