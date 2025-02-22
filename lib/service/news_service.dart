import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/news_model.dart';

class ApiService {
  static const String apiKey = '88e8100029b94f55a98b1240a9cd2f90';
  static const String baseUrl = 'https://newsapi.org/v2/everything';

  Future<List<NewsArticle>> fetchNews(String query) async {
    if (query.isEmpty) {
      query = 'all';
    }
    final url = Uri.parse('$baseUrl?q=$query&apiKey=$apiKey');
    final response = await http.get(url);
    log(response.statusCode.toString());
    log(response.body);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articles = data['articles'];
      return articles.map((json) => NewsArticle.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
