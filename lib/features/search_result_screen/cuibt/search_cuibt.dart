import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/search_result_screen/cuibt/search_states.dart';
import 'package:news_app/features/search_result_screen/repo/search_repo.dart';

class SearchCuibt extends Cubit<SearchStates> {
  final SearchResultScreenServices searchRepo;

  SearchCuibt({required this.searchRepo}) : super(SearchInitialState());

  void searchArticles(String query) async {
    emit(LoadingSearchstate());

    try {
      final result = await searchRepo.searchitembyname(query);

      if (result != null) {
        emit(SucessSearchstate(result));
      } else {
        emit(ErrorSearchstate("No results found"));
      }
    } catch (e) {
      emit(ErrorSearchstate(e.toString()));
    }
  }
}
