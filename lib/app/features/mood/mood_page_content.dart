import 'package:flutter/material.dart';
import 'package:journal/app/features/mood/mood_page_widgets/mood_page_widgets.dart';
import 'package:journal/consts/color_schemes.dart';

class MoodPageContent extends StatelessWidget {
  const MoodPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            color: currentColorScheme.primaryContainer,
          ),
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'My mood today:',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 8,
              ),
              const MoodSelection(),
            ],
          ),
        ),
        const MoodDisplay(),
        const MessageDisplay(),
      ],
    );
  }
}
