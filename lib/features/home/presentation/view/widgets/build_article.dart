import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget buildArticleScreen(list) => ConditionalBuilder(
  condition: list.isNotEmpty,
  builder:
      (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.orangeAccent,
              ),
            ),
        itemCount: list.length,
      ),
  fallback: (context) => const Center(child: CircularProgressIndicator()),
);

Widget buildArticleItem(article, context) {
  return InkWell(
    onTap: () {
      //navigateTo(context, WebViewScreen(article['url']));
    },
    child: Row(
      children: [
        Container(
          height: 120.0,
          width: 120.0,
          decoration:
              article['urlToImage'] != null
                  ? BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: NetworkImage(article['urlToImage']),
                    ),
                  )
                  : BoxDecoration(),
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article['title'],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 5.0),
              Text(
                article['publishedAt'],
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
