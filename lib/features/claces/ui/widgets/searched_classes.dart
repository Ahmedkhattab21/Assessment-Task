import 'package:assesment_task/features/claces/logic/claces_cubit.dart';
import 'package:assesment_task/features/claces/ui/widgets/class_item.dart';
import 'package:flutter/material.dart';

class SearchedClasses extends StatelessWidget {
  final String id;

  const SearchedClasses({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: ClacesCubit.get(context)
              .searchedClaces
              .map((item) => ClassItem(id: id, type: 1, item: item))
              .toList()),
    );
  }
}
