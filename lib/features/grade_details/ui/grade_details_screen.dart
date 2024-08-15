import 'package:assesment_task/core/utils/app_colors_white_theme.dart';
import 'package:assesment_task/core/utils/spacing.dart';
import 'package:assesment_task/core/utils/styles.dart';
import 'package:assesment_task/features/grade_details/logic/grade_details_cubit.dart';
import 'package:assesment_task/features/grade_details/logic/grade_details_state.dart';
import 'package:assesment_task/features/grade_details/ui/widgets/grade_name_arabic.dart';
import 'package:assesment_task/features/grade_details/ui/widgets/grade_name_english.dart';
import 'package:assesment_task/features/grade_details/ui/widgets/submit_grades.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradeDetailsScreen extends StatelessWidget {
  final int type;
  final String schoolId;
  final String? nameAr;
  final String? nameEn;
  final String? id;

  const GradeDetailsScreen({
    required this.type,
    required this.schoolId,
    required this.nameAr,
    required this.nameEn,
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: context.read<GradeDetailsCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Grade name in Arabic",
                    style: TextStyles.font14GreyColor40Weight700),
                verticalSpace(8),
                BlocBuilder<GradeDetailsCubit, GradeDetailsState>(
                  buildWhen: (previous, current) {
                    return current is OnAddGradeErrorState;
                  },
                  builder: (context, state) {
                    if (state is OnAddGradeErrorState) {
                      return GradeNameArabic(
                          errorName: (state).error.nameAr.isEmpty
                              ? null
                              : (state).error.nameAr[0]);
                    } else {
                      return GradeNameArabic(errorName: null);
                    }
                  },
                ),
                verticalSpace(28),
                Text("Grade name in English",
                    style: TextStyles.font14GreyColor40Weight700),
                verticalSpace(8),
                BlocBuilder<GradeDetailsCubit, GradeDetailsState>(
                  buildWhen: (previous, current) {
                    return current is OnAddGradeErrorState;
                  },
                  builder: (context, state) {
                    if (state is OnAddGradeErrorState) {
                      return GradeNameEnglish(
                          errorName: (state).error.nameEn.isEmpty
                              ? null
                              : (state).error.nameEn[0]);
                    } else {
                      return GradeNameEnglish(errorName: null);
                    }
                  },
                ),
                verticalSpace(18),
                SubmitGrades(id: id, schoolId: schoolId, type: type),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
