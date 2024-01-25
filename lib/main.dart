import 'package:flutter/material.dart';
import 'package:journal/app/features/home/home_page.dart';
import 'package:journal/consts/color_schemes.dart';

void main() {
  runApp(const JournalApp());
}

class JournalApp extends StatelessWidget {
  const JournalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: currentColorScheme,
      ),
      home: const HomePage(),
    );
  }
}
