import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/presentation/view/widgets/business_screen.dart';
import 'package:news_app/features/home/presentation/view/widgets/science_screen.dart';
import 'package:news_app/features/home/presentation/view/widgets/sports_screen.dart';
import 'package:news_app/features/home/presentation/view_model/states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  List<Widget> homecontents = [
    // Add your screens here
    SportsScreen(),
    ScienceScreen(),
    BusinessScreen(),
  ];

  int currentIndex = 0;
  static HomeCubit get(context) => BlocProvider.of(context);
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavBarState());
  }
}
