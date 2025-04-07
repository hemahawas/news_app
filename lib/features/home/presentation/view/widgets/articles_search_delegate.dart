import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/shared_widgets/custom_icon.dart';
import 'package:news_app/features/home/data/model/article_model.dart';
import 'package:news_app/features/home/presentation/view/widgets/build_content.dart';
import 'package:news_app/features/home/presentation/view_model/cubit.dart';
import 'package:news_app/features/home/presentation/view_model/states.dart';

class ArticlesSearchDelegate extends SearchDelegate {
  List<ArticleModel> searchTerms = [];
  final BuildContext blocContext;
  final Function(String) onPressed;

  ArticlesSearchDelegate({required this.blocContext, required this.onPressed});
  // To clear the query
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      CustomIcon(
        icon: Icons.search,
        onPressed: () {
          onPressed(query);
          showResults(context);
        },
      ),
    ];
  }

  //To leave and close the search bar
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<HomeCubit>(blocContext),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          if (state is HomeGetSearchDataSuccessState) {
            searchTerms = (state).articles;
          }
          if (state is HomeGetSearchDataLoadingState) {
            searchTerms = [];
          }

          if (searchTerms.isNotEmpty) {
            return buildContent(context, searchTerms);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text(
        'Search for articles',
        style: TextStyle(color: Colors.blueGrey, fontSize: 20),
      ),
    );
  }
}
