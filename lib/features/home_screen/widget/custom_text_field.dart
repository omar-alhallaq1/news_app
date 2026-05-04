import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/stayles/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final double? width;
  final bool? isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  const CustomTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.width,
    this.isPassword,
    this.controller,
    this.validator,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 331.w,
      child: TextFormField(
        controller: controller,
        validator: validator,
        autofocus: false,
        obscureText: isPassword ?? false,
        cursorColor: AppColors.blackcolor,
        onFieldSubmitted: (value) {
          if (onFieldSubmitted != null) {
            onFieldSubmitted!(value);
          } else {
            // لا يوجد دالة محددة للتنفيذ عند الإرسال، يمكنك إضافة سلوك افتراضي هنا إذا أردت
          }
        },
        decoration: InputDecoration(
          hintText: hintText ?? "Type here",
          hintStyle: TextStyle(
            fontSize: 16.sp,
            color: const Color(0xff8391A1),
            fontWeight: FontWeight.w500,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.w,
            vertical: 18.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: const Color(0xffE8ECF4), width: 1.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.blackcolor, width: 1.w),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.red, width: 1.w),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.red, width: 1.w),
          ),
          filled: true,
          fillColor: const Color(0xffF7F8F9),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
