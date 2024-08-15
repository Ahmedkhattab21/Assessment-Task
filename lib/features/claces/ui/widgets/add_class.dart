import 'package:assesment_task/config/routes/routes.dart';
import 'package:assesment_task/core/services/cache_helper.dart';
import 'package:assesment_task/core/utils/app_colors_white_theme.dart';
import 'package:assesment_task/core/utils/constant_keys.dart';
import 'package:assesment_task/core/utils/extentions.dart';
import 'package:assesment_task/core/utils/spacing.dart';
import 'package:assesment_task/core/utils/styles.dart';
import 'package:assesment_task/features/claces/logic/claces_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddClass extends StatelessWidget {
  final String id;
  const AddClass({required this.id,super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () async {
        String schoolId =
            CacheHelper.getString(ConstantKeys.saveSchoolIdToShared) ??
                "";
        context.pushNamed(Routes.classDetailsScreen, arguments: {
          "type": 1,
          "gradeId": id,
          "schoolId": schoolId,
        }).then((value) {
          ClacesCubit.get(context).getClaces(id);
        });
      },
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
            color: AppColors.whiteColorFo,
            borderRadius: BorderRadius.circular(30.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: Colors.indigoAccent,
            ),
            horizontalSpace(4),
            Text("Add Classes",
                style: TextStyles.font14BlueColor9BWeight400)
          ],
        ),
      ),
    );
  }
}
