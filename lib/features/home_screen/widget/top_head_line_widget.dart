import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/stayles/app_text_style.dart';

class TopHeadLineWidget extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String? imageUrl;

  const TopHeadLineWidget({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 206.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              imageUrl:
                  imageUrl ??
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHOSEZniTCyBceC4Uy3Vi9fdusXgYs4f8Cnw&s",
              height: 206.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Gap(16.h),
        Text(
          title,
          style: AppTextStyles.black14semibold.copyWith(
            fontSize: 18.sp,
            color: Colors.black,
          ),
        ),
        Gap(8.h),
        Text(
          "$description .  $date",
          style: AppTextStyles.grey14regular.copyWith(
            fontSize: 18.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
