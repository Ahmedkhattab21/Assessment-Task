import 'package:assesment_task/core/utils/app_colors_white_theme.dart';
import 'package:assesment_task/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final String? errorText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final bool isPhoneNumber;
  final bool? isRegister;
  final bool? isLogin;
  final bool? autofocus;

  final TextEditingController? controller;
  final Function(String?) validator;
  final Function(String) onchange;
  final TextInputType keyboardType;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
     this.errorText,
    this.isObscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    required this.onchange,
    required this.keyboardType,
    this.isPhoneNumber = false,
    this.isRegister = false,
    this.isLogin = false,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus!,
      controller: controller,
      cursorColor: AppColors.blackColor,
      enableSuggestions: true,
      autocorrect: true,
      autofillHints: const [AutofillHints.email],
      keyboardType: keyboardType,
      onChanged: (String value) {
        onchange(value);
      },

      decoration: InputDecoration(
        isDense: true,
        errorText: errorText,

        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.blackColor.withOpacity(.4),
                width: 1.3,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomLeft:  Radius.circular(10.r),
                topRight:  Radius.circular(10.r),
                bottomRight:  Radius.circular(10.r),
              ),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.blackColor.withOpacity(.4),
                width: 1.3,
              ),
              borderRadius: BorderRadius.only(
                topLeft:  Radius.circular(8.r),
                bottomLeft:  Radius.circular(8.r),
                topRight:  Radius.circular(8.r),
                bottomRight: Radius.circular(8.r),
              ),
              // borderRadius: BorderRadius.circular(28.0),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.redColor00,
            width: 1.3,
          ),
          borderRadius: BorderRadius.only(
            topLeft:  Radius.circular(8.r),
            bottomLeft:  Radius.circular(8.r),
            topRight:  Radius.circular(8.r),
            bottomRight:  Radius.circular(8.r),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.redColor00,
            width: 1.3,
          ),
          borderRadius: BorderRadius.only(
            topLeft:  Radius.circular(10.r),
            bottomLeft:  Radius.circular(10.r),
            topRight: Radius.circular(10.r),
            bottomRight:  Radius.circular(10.r),
          ),
        ),
        hintStyle: hintStyle ?? TextStyles.font14GreyColor40Weight400,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: backgroundColor ?? AppColors.whiteColor,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: TextStyles.font14BlackColor13Weight400,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
