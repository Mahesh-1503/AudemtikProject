import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/home_page.dart';
import 'bindings/home_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News Aggregator',
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      home: HomePage(),
    );
  }
}
