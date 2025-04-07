import 'package:flutter/material.dart';
import 'package:news_app/features/home/presentation/view/widgets/article_item.dart';

Widget buildContent(context, articles) {
  return SingleChildScrollView(
    physics: NeverScrollableScrollPhysics(),
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => ArticleItem(model: articles[index]),

        itemCount: articles.length,
      ),
    ),
  );
}
