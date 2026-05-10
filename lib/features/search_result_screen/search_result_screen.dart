import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/stayles/app_text_style.dart';
import 'package:news_app/features/search_result_screen/cuibt/search_cuibt.dart';
import 'package:news_app/features/search_result_screen/cuibt/search_states.dart';
import 'package:news_app/features/home_screen/widget/artical_card_widget.dart';
import 'package:news_app/features/search_result_screen/repo/search_repo.dart';

class SearchResultScreen extends StatelessWidget {
  final String query;

  const SearchResultScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchCuibt(searchRepo: SearchResultScreenServices())
            ..searchArticles(query), // تم استدعاء البحث مباشرة

      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,

          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),

          title: Text(
            "search_results".tr(),
            style: AppTextStyles.black14semibold,
          ),

          centerTitle: true,
        ),

        body: BlocBuilder<SearchCuibt, SearchStates>(
          builder: (context, state) {
            /// Loading
            if (state is LoadingSearchstate) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.black),
              );
            }
            /// Success
            else if (state is SucessSearchstate) {
              final searchResults = state.searchModel;

              if (searchResults.articles == null ||
                  searchResults.articles!.isEmpty) {
                return const Center(child: Text("No results found."));
              }

              return Column(
                children: [
                  Gap(16.h),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: ListView.builder(
                        itemCount: searchResults.articles!.length,

                        itemBuilder: (context, index) {
                          final article = searchResults.articles![index];

                          return ArticalCardWidget(article: article);
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
            /// Error
            else if (state is ErrorSearchstate) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Error: ${state.error}",
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }

            return const Center(child: Text("Waiting for results..."));
          },
        ),
      ),
    );
  }
}
