import 'package:flutter/material.dart';
import 'package:journal/consts/color_schemes.dart';
import 'package:journal/mood_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: currentColorScheme,
      ),
      home: MoodPage(),
    );
  }
}
