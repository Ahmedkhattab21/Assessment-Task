import 'package:assesment_task/core/utils/styles.dart';
import 'package:assesment_task/core/widgets/app_text_field.dart';
import 'package:assesment_task/features/grade_details/logic/grade_details_cubit.dart';
import 'package:flutter/material.dart';

class GradeNameArabic extends StatelessWidget {
  String? errorName;
   GradeNameArabic({required this.errorName,super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: "Enter Grade name in Arabic",
      isPhoneNumber: true,
      errorText: errorName,
      hintStyle: TextStyles.font14BlackColor13Weight400,
      keyboardType: TextInputType.emailAddress,
      controller: GradeDetailsCubit.get(context).addArController,
      validator: (String? value) {
        if (value!.isEmpty) {
          return "Enter valid Name";
        }
        return null;
      },
      onchange: (value) {},
    );
  }
}
