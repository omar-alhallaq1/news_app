import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/stayles/app_text_style.dart';
import 'package:news_app/features/home_screen/modles/top_headlines_modle.dart';
import 'package:news_app/features/home_screen/widget/artical_card_widget.dart';
import 'package:news_app/features/search_result_screen/services/search_result_services.dart';

class SearchResultScreen extends StatelessWidget {
  final String query;
  const SearchResultScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "search_results".tr(),
          style: AppTextStyles.black14semibold,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: SearchResultScreenServices().searchitembyname(query),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (asyncSnapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${asyncSnapshot.error}",
                style: AppTextStyles.black14semibold,
              ),
            );
          } else if (asyncSnapshot.hasData) {
            ArticalModles topHeadLinesModle =
                asyncSnapshot.data as ArticalModles;

            if (topHeadLinesModle.totalResults == 0) {
              return Center(child: Text("noresult".tr()));
            }

            return Column(
              children: [
                Gap(16.h),

                /// Categories

                /// Top Headline
                Gap(24.h),

                /// Articles List
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: ListView.builder(
                      itemCount: topHeadLinesModle.articles!.length,
                      itemBuilder: (context, index) {
                        final article = topHeadLinesModle.articles![index];

                        return ArticalCardWidget(article: article);
                      },
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text(
                "No data available",
                style: AppTextStyles.black14semibold,
              ),
            );
          }
        },
      ),
    );
  }
}
