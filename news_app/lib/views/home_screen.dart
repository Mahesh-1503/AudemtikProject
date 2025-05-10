import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Headlines'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text(
          'News will be shown here...',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
