import 'package:flutter/material.dart';
import 'package:journal/app/features/mood/mood_page_widgets/mood_page_widgets.dart';
import 'package:journal/themes/color_schemes.dart';
import 'package:journal/themes/screen_sizes.dart';

class MoodPageContent extends StatelessWidget {
  const MoodPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(screenWidth / 24),
              ),
              color: currentColorScheme.primaryContainer),
          margin: EdgeInsets.symmetric(
            vertical: screenHeight / 64,
            horizontal: screenWidth / 32,
          ),
          padding: EdgeInsets.symmetric(
            vertical: screenHeight / 64,
            horizontal: screenWidth / 32,
          ),
          child: Column(
            children: [
              // Text(
              //   'My mood today:',
              //   style: Theme.of(context).textTheme.headlineSmall,
              // ),
              SizedBox(height: screenHeight / 64),
              const MoodSelection(),
            ],
          ),
        ),
        const MoodDisplay(),
        const MessageDisplay(),
        const CalendarDisplay(),
      ],
    );
  }
}
