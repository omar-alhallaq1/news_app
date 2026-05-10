import 'package:news_app/features/home_screen/modles/top_headlines_modle.dart';

abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class LoadingSearchstate extends SearchStates {}

class SucessSearchstate extends SearchStates {
  final ArticalModles searchModel;

  SucessSearchstate(this.searchModel);
}

class ErrorSearchstate extends SearchStates {
  final String error;

  ErrorSearchstate(this.error);
}
