import 'package:assesment_task/core/widgets/search_widget.dart';
import 'package:assesment_task/features/grades/logic/grades_cubit.dart';
import 'package:flutter/material.dart';

class SearchGrade extends StatelessWidget {
  const SearchGrade({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchWidget(
        hintText: "Search Grades",
        prefixIcon: Icon(Icons.search),
        controller: GradesCubit.get(context).searchController,
        validator: (String? value) {},
        onchange: (String? value) {
          GradesCubit.get(context).searchNames(value!);
        },
        keyboardType: TextInputType.text);
  }
}
