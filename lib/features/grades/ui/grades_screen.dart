import 'package:assesment_task/core/utils/app_colors_white_theme.dart';
import 'package:assesment_task/core/utils/spacing.dart';
import 'package:assesment_task/core/utils/styles.dart';
import 'package:assesment_task/features/grades/logic/grades_cubit.dart';
import 'package:assesment_task/features/grades/logic/grades_state.dart';
import 'package:assesment_task/features/grades/ui/widgets/add_grade.dart';
import 'package:assesment_task/features/grades/ui/widgets/all_grades.dart';
import 'package:assesment_task/features/grades/ui/widgets/search_grade.dart';
import 'package:assesment_task/features/grades/ui/widgets/searched_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.orangeColor50,
        title: Text("Grades", style: TextStyles.font18BlackColorWeight600),
        actions: [
          AddGrade(),
          horizontalSpace(20),
        ],
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(15),
              SearchGrade(),
              verticalSpace(15),
              Expanded(
                child: BlocBuilder<GradesCubit, GradesState>(
                  buildWhen: (previous, current) {
                    return current is OnGetGradesLoadingState ||
                        current is OnGetGradesErrorState ||
                        current is OnGetGradesSuccessState ||
                        current is OnGetGradesCatchErrorState ||
                        current is OnSearchDoneState;
                  },
                  builder: (context, state) {
                    if (GradesCubit.get(context)
                        .searchController
                        .text
                        .isNotEmpty) {
                      return SearchedData();
                    } else {
                      if (GradesCubit.get(context).grades.isEmpty &&
                          state is OnGetGradesLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(
                              color: AppColors.orangeColor50),
                        );
                      } else {
                        return AllGrades();
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
