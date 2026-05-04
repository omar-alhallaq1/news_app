import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/stayles/app_text_style.dart';

class CustomCategroyItemWidget extends StatelessWidget {
  final Function() ontap;
  final String title;
  const CustomCategroyItemWidget({
    super.key,
    required this.title,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 12.w),
      child: OutlinedButton(
        onPressed: ontap,
        style:
            OutlinedButton.styleFrom(
              // لون الحدود الثابت
              side: const BorderSide(color: Color(0xffE9EEFA), width: 1),
              // شكل الزر
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(56.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),

              // --- هذا هو السر لتغيير اللون عند النقر فقط ---
              // نستخدم resolveWith عشان نحدد اللون في حالة الضغط (pressed)
              foregroundColor: const Color(0xff231F20), // لون النص
            ).copyWith(
              overlayColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.pressed)) {
                  return const Color(
                    0xffE9EEFA,
                  ); // اللون اللي في الأب بار يظهر هنا عند الضغط
                }
                return null; // في الحالات العادية لا يوجد لون غطاء
              }),
            ),
        child: Text(title, style: AppTextStyles.black14semibold),
      ),
    );
  }
}
