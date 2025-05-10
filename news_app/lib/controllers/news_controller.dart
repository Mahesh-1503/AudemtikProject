import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/article_model.dart';

class NewsController extends GetxController {
  var isLoading = true.obs; // This should be defined as an observable RxBool
  var articles =
      <Article>[]
          .obs; // This should be defined as an observable list of articles

  @override
  void onInit() {
    super.onInit();
    fetchArticles();
  }

  // Fetch news articles
  Future<void> fetchArticles() async {
    try {
      isLoading(true); // Start loading
      final response = await http.get(
        Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=07ef64cec4684d13ac9de33d01ebd515',
        ),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<Article> fetchedArticles =
            (data['articles'] as List)
                .map((article) => Article.fromJson(article))
                .toList();
        articles.assignAll(fetchedArticles); // Assign the fetched articles
      } else {
        throw Exception('Failed to load articles');
      }
    } finally {
      isLoading(false); // Stop loading
    }
  }
}
