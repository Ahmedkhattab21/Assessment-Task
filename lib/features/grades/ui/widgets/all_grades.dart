import 'package:assesment_task/features/grades/logic/grades_cubit.dart';
import 'package:assesment_task/features/grades/ui/widgets/grade_item.dart';
import 'package:flutter/material.dart';

class AllGrades extends StatelessWidget {
  const AllGrades({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: GradesCubit.get(context)
              .grades
              .map((item) => GradeItem(type: 2, item: item))
              .toList()),
    );
  }
}
