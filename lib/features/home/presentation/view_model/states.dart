import 'package:news_app/features/home/data/model/article_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeChangeBottomNavBarState extends HomeStates {}

class HomeGetBusinessDataLoadingState extends HomeStates {}

class HomeGetBusinessDataSuccessState extends HomeStates {
  final List<ArticleModel> articles;
  HomeGetBusinessDataSuccessState(this.articles);
}

class HomeGetBusinessDataErrorState extends HomeStates {
  final String error;
  HomeGetBusinessDataErrorState(this.error);
}

class HomeGetSportsDataLoadingState extends HomeStates {}

class HomeGetSportsDataSuccessState extends HomeStates {
  final List<ArticleModel> articles;
  HomeGetSportsDataSuccessState(this.articles);
}

class HomeGetSportsDataErrorState extends HomeStates {
  final String error;
  HomeGetSportsDataErrorState(this.error);
}

class HomeGetScienceDataLoadingState extends HomeStates {}

class HomeGetScienceDataSuccessState extends HomeStates {
  final List<ArticleModel> articles;
  HomeGetScienceDataSuccessState(this.articles);
}

class HomeGetScienceDataErrorState extends HomeStates {
  final String error;
  HomeGetScienceDataErrorState(this.error);
}

class HomeGetSearchDataLoadingState extends HomeStates {}

class HomeGetSearchDataSuccessState extends HomeStates {
  final List<ArticleModel> articles;
  HomeGetSearchDataSuccessState(this.articles);
}

class HomeGetSearchDataErrorState extends HomeStates {
  final String error;
  HomeGetSearchDataErrorState(this.error);
}
