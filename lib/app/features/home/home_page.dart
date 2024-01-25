import 'package:flutter/material.dart';
import 'package:journal/app/features/mood/mood_page_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal home page'),
      ),
      body: MoodPageContent(),
    );
  }
}
