import 'package:assesment_task/features/claces/logic/claces_cubit.dart';
import 'package:assesment_task/features/claces/ui/widgets/class_item.dart';
import 'package:flutter/material.dart';

class AllClasses extends StatelessWidget {
  final String id;

  const AllClasses({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: ClacesCubit.get(context)
              .claces
              .map((item) => ClassItem(id: id, type: 2, item: item))
              .toList()),
    );
  }
}
