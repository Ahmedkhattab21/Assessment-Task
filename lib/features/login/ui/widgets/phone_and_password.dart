import 'package:assesment_task/core/utils/app_colors_white_theme.dart';
import 'package:assesment_task/core/utils/spacing.dart';
import 'package:assesment_task/core/utils/styles.dart';
import 'package:assesment_task/core/widgets/app_text_field.dart';
import 'package:assesment_task/features/login/logic/login_cubit.dart';
import 'package:assesment_task/features/login/logic/login_state.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneAndPassword extends StatelessWidget {
  const PhoneAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("mobile Number", style: TextStyles.font14GreyColor40Weight700),
          verticalSpace(8),
          AppTextFormField(
            hintText: "Enter Mobile Number ",
            isPhoneNumber: true,
            hintStyle: TextStyles.font14BlackColor13Weight400,
            keyboardType: TextInputType.emailAddress,
            controller: LoginCubit.get(context).phoneController,
            prefixIcon: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    CountryFlag.fromLanguageCode(
                      'ar-SA',
                      width: 50,
                      height: 30,
                      shape: const RoundedRectangle(3),
                    ),
                    horizontalSpace(5),
                    Text("+966",style: TextStyles.font14BlackColorWeight600),
                  ],
                ),
              ),
            ),
            validator: (value) {
              if(value!.isEmpty){
                return "Enter valid Phone";
              }
              return null;
            },
            onchange: (value) {},
          ),
          verticalSpace(25),
          Text("Password", style: TextStyles.font14GreyColor40Weight700),
          verticalSpace(5),
          BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) {
              return current is ChangeSecureTextState;
            },
            builder: (context, state) {
              return AppTextFormField(
                hintText: "Enter The Password ",
                hintStyle: TextStyles.font14BlackColor13Weight400,
                keyboardType: TextInputType.emailAddress,
                isObscureText: LoginCubit.get(context).secureText,
                controller: LoginCubit.get(context).passwordController,
                suffixIcon: IconButton(
                  splashColor: AppColors.whiteColor,
                  onPressed: () {
                    LoginCubit.get(context).changeSecureText();
                  },
                  icon: Icon(
                    LoginCubit.get(context).secureText
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.greyColor99,
                    size: 20.r,
                  ),
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter valid Password";
                  }
                  return null;
                },
                onchange: (value) {},
              );
            },
          ),
        ],
      ),
    );
  }

}
