import 'package:assesment_task/config/routes/routes.dart';
import 'package:assesment_task/core/utils/app_colors_white_theme.dart';
import 'package:assesment_task/core/utils/app_constant.dart';
import 'package:assesment_task/core/utils/extentions.dart';
import 'package:assesment_task/core/utils/styles.dart';
import 'package:assesment_task/core/widgets/button_widget.dart';
import 'package:assesment_task/features/login/logic/login_cubit.dart';
import 'package:assesment_task/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      buildWhen: (previous, current) {
        return current is OnLoginWithEmailAndPasswordLoadingState ||
            current is OnLoginWithEmailAndPasswordSuccessState ||
            current is OnLoginWithEmailAndPasswordErrorState ||
            current is OnLoginWithEmailAndPasswordCatchErrorState;
      },
      listener: (context, state) {
        if (state is OnLoginWithEmailAndPasswordSuccessState) {
          context.pushNamedAndRemoveUntil(
            Routes.homeScreen,
            predicate: (routes) => false,
          );
        } else if (state is OnLoginWithEmailAndPasswordErrorState) {
          AppConstant.toast(state.text.toString(), AppColors.redColor2C);
        } else if (state is OnLoginWithEmailAndPasswordCatchErrorState) {
          AppConstant.toast(state.text.toString(), AppColors.redColor2C);
        }
      },
      builder: (context, state) {
        return state is OnLoginWithEmailAndPasswordLoadingState
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.orangeColor50,
                ),
              )
            : ButtonWidget(
                buttonText: "Login",
                textStyle: TextStyles.font20WhiteColor4EWeigh700,
                backGroundColor: AppColors.orangeColor50,
                onPressed: () {
                  validateThenDoLogin(context);
                });
      },
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().loginWithEmailAdnPassword();
    }
  }
}
