import 'package:assesment_task/config/routes/routes.dart';
import 'package:assesment_task/core/utils/app_colors_white_theme.dart';
import 'package:assesment_task/core/utils/extentions.dart';
import 'package:assesment_task/core/utils/spacing.dart';
import 'package:assesment_task/core/utils/styles.dart';
import 'package:assesment_task/features/grades/data/models/get_grades_response_model.dart';
import 'package:assesment_task/features/grades/logic/grades_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradeItem extends StatelessWidget {
  final int type;
  final GetGradesResponseModel item;

  const GradeItem({required this.type, required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 8.h),
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
          horizontalSpace(20),
          Expanded(
            flex: 3,
            child: Text(
              item.name,
              maxLines: 1,
              style: TextStyles.font18BlackColorWeight600,
            ),
          ),
          IconButton(
              onPressed: () {
                context.pushNamed(Routes.gradeDetailsScreen, arguments: {
                  "type": 2,
                  "schoolId": item.schoolId,
                  "nameAr": item.nameAr,
                  "nameEn": item.nameEn,
                  "id": item.id,
                }).then((value) {
                  GradesCubit.get(context).getGrades();
                });
              },
              icon: Icon(Icons.edit)),
          horizontalSpace(15),
          IconButton(
              onPressed: () {
                // GradesCubit.get(context).deleteItem(type, item.id);
                GradesCubit.get(context).deleteGrade(item.id);
              },
              icon: Icon(Icons.delete)),
          horizontalSpace(15),
          IconButton(
              onPressed: () {
                context.pushNamed(Routes.clacesScreen, arguments: {
                  "className": item.name,
                  "id": item.id,
                });
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.blackColor,
              )),
          Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
