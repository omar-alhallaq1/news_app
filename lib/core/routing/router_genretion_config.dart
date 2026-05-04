import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/features/home_screen/main_screen_main.dart/home_screen.dart';
import 'package:news_app/features/search_result_screen/search_result_screen.dart';

class RouterGenretionConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.homescreen,
    routes: [
      GoRoute(
        name: AppRoutes.homescreen,
        path: AppRoutes.homescreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        name: AppRoutes.searchScreen,
        path: AppRoutes.searchScreen,
        builder: (context, state) => Container(),
      ),
      GoRoute(
        name: AppRoutes.searchResultscreen,
        path: AppRoutes.searchResultscreen,
        builder: (context, state) {
          final query = state.extra as String;
          return SearchResultScreen(query: query);
        },
      ),
      GoRoute(
        name: AppRoutes.articalDetailscreen,
        path: AppRoutes.articalDetailscreen,
        builder: (context, state) => Container(),
      ),
    ],
  );
}
