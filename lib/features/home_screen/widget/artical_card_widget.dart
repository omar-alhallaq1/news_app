import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/stayles/app_text_style.dart';

class ArticalCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String? imageUrl;
  const ArticalCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 238.w,
                  child: Text(
                    title,
                    maxLines: 2, // إضافة حد للأسطر عشان ما يضرب التصميم
                    overflow:
                        TextOverflow.ellipsis, // يضيف نقاط (...) لو النص طويل
                    style: AppTextStyles.black14semibold.copyWith(
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
                Gap(8.h),
                Text(
                  "$description . $date",
                  maxLines: 1, // السطر الصغير يفضل يكون سطر واحد
                  overflow: TextOverflow
                      .ellipsis, // يمنع الـ Overflow اللي ظهر في الصورة
                  style: AppTextStyles.grey14regular.copyWith(
                    fontSize: 18.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Gap(10.w), // إضافة مسافة بسيطة بين النص والصورة
          SizedBox(
            width: 112.w,
            height: 80.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                imageUrl:
                    imageUrl ??
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHOSEZniTCyBceC4Uy3Vi9fdusXgYs4f8Cnw",
                fit: BoxFit.cover,
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error), // حماية لو الصورة مش شغالة
              ),
            ),
          ),
        ],
      ),
    );
  }
}
