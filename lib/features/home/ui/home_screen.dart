import 'package:assesment_task/core/utils/app_colors_white_theme.dart';
import 'package:assesment_task/core/utils/spacing.dart';
import 'package:assesment_task/core/utils/styles.dart';
import 'package:assesment_task/features/home/logic/home_cubit.dart';
import 'package:assesment_task/features/home/logic/home_state.dart';
import 'package:assesment_task/features/home/ui/widgets/grade_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: AppColors.orangeColor50,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Home Page", style: TextStyles.font18BlackColorWeight600),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Text(HomeCubit.get(context).name,
                      style: TextStyles.font14BlackColorWeight400);
                },
              ),
            ],
          ),
          centerTitle: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20),
                GradeItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
