import 'package:flutter/material.dart';
import 'package:news_apk/model/news_model.dart';

class NewsCard extends StatelessWidget {
  final NewsArticle article;
  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: ListTile(
        leading: Hero(
          tag: article.title ??
              'no_title_${DateTime.now().millisecondsSinceEpoch}',
          child: article.urlToImage != null
              ? Image.network(article.urlToImage!, width: 80, fit: BoxFit.cover)
              : Container(width: 80, height: 80, color: Colors.grey.shade300),
        ),
        title: Text(
          article.title ?? 'No Title Available',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(article.source?.name ?? 'Unknown Source'),
      ),
    );
  }
}

class NewsCardShimmer extends StatelessWidget {
  const NewsCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: ListTile(
        leading: Container(width: 80, height: 80, color: Colors.grey.shade300),
        title: Container(height: 20, color: Colors.grey.shade300),
        subtitle: Container(height: 15, color: Colors.grey.shade200),
      ),
    );
  }
}
