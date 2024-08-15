import 'package:assesment_task/core/utils/app_colors_white_theme.dart';
import 'package:assesment_task/core/utils/spacing.dart';
import 'package:assesment_task/core/utils/styles.dart';
import 'package:assesment_task/features/claces/logic/claces_cubit.dart';
import 'package:assesment_task/features/claces/logic/claces_state.dart';
import 'package:assesment_task/features/claces/ui/widgets/add_class.dart';
import 'package:assesment_task/features/claces/ui/widgets/all_classes.dart';
import 'package:assesment_task/features/claces/ui/widgets/search_class.dart';
import 'package:assesment_task/features/claces/ui/widgets/searched_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClacesScreen extends StatelessWidget {
  final String id;
  final String className;

  const ClacesScreen({required this.id, required this.className, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.orangeColor50,
        title: Text(className, style: TextStyles.font18BlackColorWeight600),
        actions: [
          AddClass(id: id),
          horizontalSpace(20),
        ],
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(15),
              SearchClass(),
              verticalSpace(15),
              Expanded(
                child: BlocBuilder<ClacesCubit, ClacesState>(
                  buildWhen: (previous, current) {
                    return current is OnGetClacesLoadingState ||
                        current is OnGetClacesErrorState ||
                        current is OnGetClacesSuccessState ||
                        current is OnGetClacesCatchErrorState ||
                        current is OnSearchDoneState;
                  },
                  builder: (context, state) {
                    if (ClacesCubit.get(context)
                        .searchController
                        .text
                        .isNotEmpty) {
                      return SearchedClasses(id: id);
                    } else {
                      if (ClacesCubit.get(context).claces.isEmpty &&
                          state is OnGetClacesLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(
                              color: AppColors.orangeColor50),
                        );
                      } else {
                        return AllClasses(id: id);
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
