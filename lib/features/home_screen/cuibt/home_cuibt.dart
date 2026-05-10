import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home_screen/cuibt/home_states.dart';
import 'package:news_app/features/home_screen/repo/home_repo.dart';

class HomeCuibt extends Cubit<HomeStates> {
  HomeCuibt() : super(HomeInitialState());
  final HomeRepo homeRepo = HomeRepo();
  Future<void> getTopHeadlines() async {
    emit(LoadingTopHeadlinesstate());
    try {
      final topHeadLinesModle = await homeRepo.gettopheadlinesArticles();
      if (topHeadLinesModle != null) {
        emit(SucessTopHeadlinesstate(topHeadLinesModle));
      } else {
        emit(ErrorTopHeadlinesstate("Failed to fetch top headlines"));
      }
    } catch (e) {
      emit(ErrorTopHeadlinesstate(e.toString()));
    }
  }
}
