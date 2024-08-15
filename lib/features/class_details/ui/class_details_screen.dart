import 'package:assesment_task/core/utils/app_colors_white_theme.dart';
import 'package:assesment_task/core/utils/spacing.dart';
import 'package:assesment_task/core/utils/styles.dart';
import 'package:assesment_task/features/class_details/logic/class_details_cubit.dart';
import 'package:assesment_task/features/class_details/logic/class_details_state.dart';
import 'package:assesment_task/features/class_details/ui/widgets/class_name_arabic.dart';
import 'package:assesment_task/features/class_details/ui/widgets/class_name_english.dart';
import 'package:assesment_task/features/class_details/ui/widgets/submit_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassDetailsScreen extends StatelessWidget {
  final int type;
  final String gradeId;
  final String schoolId;
  final String? nameAr;
  final String? nameEn;
  final String? id;

  const ClassDetailsScreen({
    required this.type,
    required this.gradeId,
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
            key: context.read<ClassDetailsCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Class name in Arabic",
                    style: TextStyles.font14GreyColor40Weight700),
                verticalSpace(8),
                BlocBuilder<ClassDetailsCubit, ClassDetailsState>(
                  buildWhen: (previous, current) {
                    return current is OnAddClassErrorState;
                  },
                  builder: (context, state) {
                    if (state is OnAddClassErrorState) {
                      return ClassNameArabic(
                          errorName: (state).error.nameAr.isEmpty
                              ? null
                              : (state).error.nameAr[0]);
                    } else {
                      return ClassNameArabic(errorName: null);
                    }
                  },
                ),
                verticalSpace(28),
                Text("Class name in English",
                    style: TextStyles.font14GreyColor40Weight700),
                verticalSpace(8),
                BlocBuilder<ClassDetailsCubit, ClassDetailsState>(
                  buildWhen: (previous, current) {
                    return current is OnAddClassErrorState;
                  },
                  builder: (context, state) {
                    if (state is OnAddClassErrorState) {
                      return ClassNameEnglish(
                          errorName: (state).error.nameEn.isEmpty
                              ? null
                              : (state).error.nameEn[0]);
                    } else {
                      return ClassNameEnglish(errorName: null);
                    }
                  },
                ),
                verticalSpace(18),
                SubmitClass(
                    id: id, schoolId: schoolId, gradeId: gradeId, type: type),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
