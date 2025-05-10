import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';

class NewsService {
  static const String _apiKey = '07ef64cec4684d13ac9de33d01ebd515';
  static const String _baseUrl =
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=$_apiKey';

  static Future<List<Article>> fetchNews() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List articles = data['articles'];
      return articles.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
