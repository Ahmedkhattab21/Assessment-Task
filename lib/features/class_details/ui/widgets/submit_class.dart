import 'package:assesment_task/core/utils/app_colors_white_theme.dart';
import 'package:assesment_task/core/utils/app_constant.dart';
import 'package:assesment_task/core/utils/extentions.dart';
import 'package:assesment_task/core/utils/styles.dart';
import 'package:assesment_task/core/widgets/button_widget.dart';
import 'package:assesment_task/features/class_details/logic/class_details_cubit.dart';
import 'package:assesment_task/features/class_details/logic/class_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitClass extends StatelessWidget {
  final String? id;
  final String gradeId;
  final String schoolId;
  final int type;

  const SubmitClass(
      {required this.id,
      required this.schoolId,
      required this.gradeId,
      required this.type,
      super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ClassDetailsCubit, ClassDetailsState>(
      buildWhen: (previous, current) {
        return current is OnAddClassLoadingState ||
            current is OnAddClassErrorState ||
            current is OnAddClassSuccessState ||
            current is OnAddClassCatchErrorState;
      },
      listener: (context, state) {
        if (state is OnAddClassSuccessState) {
          context.pop();
        } else if (state is OnAddClassCatchErrorState) {
          AppConstant.toast("error", AppColors.redColor00);
        }
      },
      builder: (context, state) {
        if (state is OnAddClassLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.orangeColor50,
            ),
          );
        } else {
          return ButtonWidget(
              buttonText: type == 1 ? "Add Class" : "Edit Class",
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
    if (context.read<ClassDetailsCubit>().formKey.currentState!.validate()) {
      if (type == 1) {
        context.read<ClassDetailsCubit>().addGrade(context, gradeId, schoolId);
      } else {
        context
            .read<ClassDetailsCubit>()
            .editClass(context, id ?? "", gradeId, schoolId);
      }
    }
  }

}
