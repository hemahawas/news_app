import 'package:flutter/material.dart';
import 'package:news_app/features/home/data/model/article_model.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.model});
  final ArticleModel model;
  @override
  Widget build(context) {
    return InkWell(
      onTap: () {
        // Web
      },
      child: Row(
        children: [
          Container(
            height: 120.0,
            width: 120.0,
            decoration:
                model.urlToImage != ''
                    ? BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: NetworkImage(model.urlToImage),
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
                  model.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 5.0),
                Text(model.publishedAt, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
