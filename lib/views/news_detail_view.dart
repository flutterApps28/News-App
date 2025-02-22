import 'package:flutter/material.dart';
import 'package:news_apk/app_color/app_colors.dart';
import 'package:news_apk/model/news_model.dart';

class NewsDetailView extends StatelessWidget {
  final NewsArticle article;
  const NewsDetailView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('News Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Hero(
              tag: article.title!,
              child: Image.network(article.urlToImage!,
                  height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            Text(article.title!,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(article.description!, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
