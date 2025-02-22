import 'dart:developer';

import 'package:get/get.dart';
import 'package:news_apk/model/news_model.dart';
import '../service/news_service.dart';

class NewsController extends GetxController {
  final ApiService apiService = ApiService();
  var newsList = <NewsArticle>[].obs;
  var isLoading = true.obs;
  var searchQuery = 'all'.obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void fetchNews() async {
    try {
      isLoading(true);
      final data = await apiService.fetchNews(searchQuery.value);
      newsList.value = data;
    } catch (e) {
      log(e.toString());
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }

  void searchNews(String query) {
    searchQuery.value = query;
    fetchNews();
  }

  void removeArticle(int index) {
    newsList.removeAt(index);
  }
}
