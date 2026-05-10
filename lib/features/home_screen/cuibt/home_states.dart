import 'package:news_app/features/home_screen/modles/top_headlines_modle.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class LoadingTopHeadlinesstate extends HomeStates {}

class SucessTopHeadlinesstate extends HomeStates {
  final ArticalModles topHeadLinesModle;
  SucessTopHeadlinesstate(this.topHeadLinesModle);
}

class ErrorTopHeadlinesstate extends HomeStates {
  final String error;
  ErrorTopHeadlinesstate(this.error);
}
