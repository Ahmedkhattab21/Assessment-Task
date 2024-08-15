import 'package:assesment_task/core/widgets/search_widget.dart';
import 'package:assesment_task/features/claces/logic/claces_cubit.dart';
import 'package:flutter/material.dart';

class SearchClass extends StatelessWidget {
  const SearchClass({super.key});

  @override
  Widget build(BuildContext context) {
    return    SearchWidget(
        hintText: "Search Classes",
        prefixIcon: Icon(Icons.search),
        controller: ClacesCubit.get(context).searchController,
        validator: (String? value) {},
        onchange: (String? value) {
          ClacesCubit.get(context).searchNames(value!);
        },
        keyboardType: TextInputType.text);
  }
}
