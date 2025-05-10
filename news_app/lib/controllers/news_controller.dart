import 'package:get/get.dart';
import '../models/article_model.dart';
import '../services/news_service.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var articles = <Article>[].obs;

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  void fetchArticles() async {
    try {
      isLoading(true);
      var fetchedArticles = await NewsService.fetchNews();
      articles.assignAll(fetchedArticles);
    } catch (e) {
      print('Error fetching articles: $e');
    } finally {
      isLoading(false);
    }
  }
}
