import 'package:assesment_task/core/utils/app_colors_white_theme.dart';
import 'package:assesment_task/core/utils/app_constant.dart';
import 'package:assesment_task/core/utils/extentions.dart';
import 'package:assesment_task/core/utils/styles.dart';
import 'package:assesment_task/core/widgets/button_widget.dart';
import 'package:assesment_task/features/grade_details/logic/grade_details_cubit.dart';
import 'package:assesment_task/features/grade_details/logic/grade_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitGrades extends StatelessWidget {
  final String? id;
  final String schoolId;
  final int type;

  const SubmitGrades(
      {required this.id,
      required this.schoolId,
      required this.type,
      super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GradeDetailsCubit, GradeDetailsState>(
      buildWhen: (previous, current) {
        return current is OnAddGradeLoadingState ||
            current is OnAddGradeErrorState ||
            current is OnAddGradeSuccessState ||
            current is OnAddGradeCatchErrorState;
      },
      listener: (context, state) {
        if (state is OnAddGradeSuccessState) {
          context.pop();
        } else if (state is OnAddGradeCatchErrorState) {
          AppConstant.toast("error", AppColors.redColor00);
        }
      },
      builder: (context, state) {
        if (state is OnAddGradeLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.orangeColor50,
            ),
          );
        } else {
          return ButtonWidget(
              buttonText: type == 1 ? "Add Grades" : "Edit Grades",
              buttonHeight: 70,
              backGroundColor: AppColors.orangeColor50,
              borderRadius: 70,
              textStyle: TextStyles.font20WhiteColor4EWeigh700,
              onPressed: () {
                validateThenDoLogin(context, schoolId);
              });
        }
      },
    );
  }

  void validateThenDoLogin(BuildContext context, String schoolId) {
    if (context.read<GradeDetailsCubit>().formKey.currentState!.validate()) {
      if (type == 1) {
        context.read<GradeDetailsCubit>().addGrade(context, schoolId);
      } else {
        context
            .read<GradeDetailsCubit>()
            .editGrade(context, id ?? "", schoolId);
      }
    }
  }
}
