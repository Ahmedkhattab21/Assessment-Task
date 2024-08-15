import 'package:assesment_task/features/grades/logic/grades_cubit.dart';
import 'package:assesment_task/features/grades/ui/widgets/grade_item.dart';
import 'package:flutter/material.dart';

class SearchedData extends StatelessWidget {
  const SearchedData({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: GradesCubit.get(context)
              .searchedGrades
              .map((item) => GradeItem(type: 1, item: item))
              .toList()),
    );
  }
}
