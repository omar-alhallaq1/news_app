import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/constans/constans.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/stayles/app_text_style.dart';
import 'package:news_app/features/home_screen/cuibt/home_cuibt.dart';
import 'package:news_app/features/home_screen/cuibt/home_states.dart';
import 'package:news_app/features/home_screen/modles/top_headlines_modle.dart';
import 'package:news_app/features/home_screen/repo/home_repo.dart';
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
    // جلب البيانات من الـ Service
    topHeadlinesFuture = HomeRepo().gettopheadlinesArticles();
    context.read<HomeCuibt>().getTopHeadlines(); // جلب البيانات من الـ Cuibt
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // حل مشكلة الـ 140 بكسل التي ظهرت عند فتح الكيبورد
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xffE9EEFA),
        toolbarHeight: 80.h,
        title: Text(
          "explore".tr(),
          style: AppTextStyles.titleTextstyle.copyWith(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (context.locale.languageCode == 'en') {
                context.setLocale(const Locale('ar'));
              } else {
                context.setLocale(const Locale('en'));
              }
              AppConstants.lang = context.locale.languageCode;
            },
            icon: const Icon(Icons.language, color: Colors.black),
          ),
          const SearchTextFieldWidjet(),
        ],
      ),
      body: BlocBuilder<HomeCuibt, HomeStates>(
        builder: (context, state) {
          if (state is LoadingTopHeadlinesstate) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (state is ErrorTopHeadlinesstate) {
            return Center(
              child: Text(
                "Error: ${state.error}",
                style: AppTextStyles.black14semibold,
              ),
            );
          } else if (state is SucessTopHeadlinesstate) {
            ArticalModles topHeadLinesModle = state.topHeadLinesModle;

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
            ); // حالة افتراضية في حال لم يكن هناك حالة معروفة
          }
        },
      ),
    );
  }
}
