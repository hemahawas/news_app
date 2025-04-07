import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/data/model/article_model.dart';
import 'package:news_app/features/home/presentation/view/widgets/build_content.dart';
import 'package:news_app/features/home/presentation/view_model/cubit.dart';
import 'package:news_app/features/home/presentation/view_model/states.dart';

class BusinessContent extends StatefulWidget {
  const BusinessContent({super.key});

  @override
  State<BusinessContent> createState() => _BusinessContentState();
}

class _BusinessContentState extends State<BusinessContent> {
  List<ArticleModel> articles = [];

  @override
  void initState() {
    super.initState();
    HomeCubit.get(context).getBusinessData();
  }

  Widget buildBlocWidget() => BlocBuilder<HomeCubit, HomeStates>(
    builder: (context, state) {
      if (state is HomeGetBusinessDataSuccessState) {
        articles = (state).articles;
      }

      if (articles.isNotEmpty) {
        return buildContent(context, articles);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
  );
  @override
  Widget build(BuildContext context) {
    log(articles.length.toString());
    return buildBlocWidget();
  }
}
