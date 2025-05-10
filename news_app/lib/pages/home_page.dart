import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/news_controller.dart';
import '../widgets/news_card.dart';

class HomePage extends StatelessWidget {
  final NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.articles.isEmpty) {
          return const Center(child: Text('No articles available'));
        } else {
          return RefreshIndicator(
            onRefresh: () async => controller.fetchArticles(),
            child: ListView.builder(
              itemCount: controller.articles.length,
              itemBuilder: (context, index) {
                return NewsCard(article: controller.articles[index]);
              },
            ),
          );
        }
      }),
    );
  }
}
