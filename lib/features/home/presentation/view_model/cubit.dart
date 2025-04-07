import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/data/model/article_model.dart';
import 'package:news_app/features/home/data/repo/home_repository.dart';
import 'package:news_app/features/home/presentation/view_model/states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit({required this.homeRepository}) : super(HomeInitialState());

  final HomeRepository homeRepository;

  List<ArticleModel> businessArticles = [];
  List<ArticleModel> searchedArticles = [];

  int currentIndex = 0;
  static HomeCubit get(context) => BlocProvider.of(context);
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavBarState());
  }

  Future<void> getBusinessData() async {
    emit(HomeGetBusinessDataLoadingState());
    final response = await homeRepository.getData('business');

    response.fold(
      (failure) => emit(HomeGetBusinessDataErrorState('Server Failure')),
      (articles) => emit(HomeGetBusinessDataSuccessState(articles)),
    );
  }

  Future<void> getSearchData(String searh) async {
    emit(HomeGetSearchDataLoadingState());
    final response = await homeRepository.getSearchData(searh);

    response.fold(
      (failure) => emit(HomeGetSearchDataErrorState('Server Failure')),
      (articles) => emit(HomeGetSearchDataSuccessState(articles)),
    );
  }
}
