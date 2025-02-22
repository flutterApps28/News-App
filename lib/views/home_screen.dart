import 'package:flutter/material.dart';
import 'package:news_apk/app_color/app_colors.dart';
import '../controller/news_controller.dart';
import '../custom_widget.dart/news_card.dart';
import 'news_detail_view.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewsController());
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('News App'),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search News',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => controller.searchNews(value),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const NewsCardShimmer();
                  },
                );
              }

              if (controller.newsList.isEmpty) {
                return const Center(child: Text('No news found.'));
              }

              return ListView.builder(
                itemCount: controller.newsList.length,
                itemBuilder: (context, index) {
                  final article = controller.newsList[index];
                  return Dismissible(
                    key: Key(article.title!),
                    onDismissed: (snapshot) => controller.removeArticle(index),
                    background: Container(color: AppColors.accentColor),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => NewsDetailView(article: article));
                      },
                      child: NewsCard(article: article),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
