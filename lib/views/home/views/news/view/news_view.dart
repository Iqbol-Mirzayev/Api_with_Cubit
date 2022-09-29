import 'package:flutter/material.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News Api",
          style: TextStyle(fontSize: 30, color: Colors.green),
        ),
      ),
    );
  }
}
