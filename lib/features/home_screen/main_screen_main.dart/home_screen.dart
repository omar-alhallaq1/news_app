import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/stayles/app_text_style.dart';
import 'package:news_app/features/home_screen/modles/top_headlines_modle.dart';
import 'package:news_app/features/home_screen/services/home_screen_services.dart';
import 'package:news_app/features/home_screen/widget/artical_card_widget.dart';
import 'package:news_app/features/home_screen/widget/custom_categroy_item_widget.dart';
import 'package:news_app/features/home_screen/widget/search_text_field_widjet.dart';
import 'package:news_app/features/home_screen/widget/top_head_line_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<ArticalModles?> topHeadlinesFuture;

  @override
  void initState() {
    super.initState();
    topHeadlinesFuture = HomeScreenServices().gettopheadlinesArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xffE9EEFA),
        toolbarHeight: 120,
        title: Text(
          "explore".tr(),
          style: AppTextStyles.titleTextstyle.copyWith(color: Colors.black),
        ),
        actions: [SearchTextFieldWidjet()],
      ),
      body: FutureBuilder(
        future: topHeadlinesFuture,
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
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 16.w),
                  child: SizedBox(
                    height: 50.h,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        CustomCategroyItemWidget(
                          title: "travel".tr(),
                          ontap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultscreen,
                              extra: "travel".tr(),
                            );
                          },
                        ),
                        CustomCategroyItemWidget(
                          title: "technology".tr(),
                          ontap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultscreen,
                              extra: "technology".tr(),
                            );
                          },
                        ),
                        CustomCategroyItemWidget(
                          title: "business".tr(),
                          ontap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultscreen,
                              extra: "business".tr(),
                            );
                          },
                        ),
                        CustomCategroyItemWidget(
                          title: "entertainment".tr(),
                          ontap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultscreen,
                              extra: "entertainment".tr(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                Gap(24.h),

                /// Top Headline
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: TopHeadLineWidget(
                    imageUrl: topHeadLinesModle.articles?[0].urlToImage ?? "",
                    title: topHeadLinesModle.articles?[0].title ?? "No Title",
                    description:
                        topHeadLinesModle.articles?[0].description ??
                        "No Description",
                    date: DateFormat('yyyy-MM-dd – kk:mm').format(
                      topHeadLinesModle.articles?[0].publishedAt ??
                          DateTime.now(),
                    ),
                  ),
                ),

                Gap(24.h),

                /// Articles List
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: ListView.builder(
                      itemCount: topHeadLinesModle.articles!.length,
                      itemBuilder: (context, index) {
                        final article = topHeadLinesModle.articles![index];

                        return ArticalCardWidget(
                          title: article.title ?? "No Title",
                          description: article.description ?? "No Description",
                          date: DateFormat(
                            'yyyy-MM-dd – kk:mm',
                          ).format(article.publishedAt ?? DateTime.now()),
                          imageUrl: article.urlToImage ?? "",
                        );
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
