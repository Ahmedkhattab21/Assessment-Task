import 'package:assesment_task/config/routes/routes.dart';
import 'package:assesment_task/core/utils/app_colors_white_theme.dart';
import 'package:assesment_task/core/utils/assets_manager.dart';
import 'package:assesment_task/core/utils/extentions.dart';
import 'package:assesment_task/core/utils/spacing.dart';
import 'package:assesment_task/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradeItem extends StatelessWidget {
  const GradeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: () {
        context.pushNamed(Routes.gradesScreen);
      },
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.whiteColorFE.withOpacity(.9),
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: Offset(1, 2),
                  color: AppColors.blackColor.withOpacity(.2)),
            ]),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            horizontalSpace(10),
            CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.whiteColor.withOpacity(.9),
              child: Image.asset(
                ImageAsset.score,
                height: 20,
                width: 20,
              ),
            ),
            horizontalSpace(10),
            Text(
              "Grades",
              style: TextStyles.font18BlackColorWeight600,
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.blackColor,
            ),
            horizontalSpace(10),
          ],
        ),
      ),
    );
  }
}
