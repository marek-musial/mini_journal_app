import 'package:flutter/material.dart';
import 'package:journal/models/mood_item_model.dart';
import 'package:journal/themes/screen_sizes.dart';

class MoodDisplay extends StatelessWidget {
  const MoodDisplay({
    required this.itemModel,
    super.key,
  });

  final MoodItemModel? itemModel;

  @override
  Widget build(BuildContext context) {
    if (itemModel?.mood == 'Bad') {
      return Text(
        'Bad',
        style: TextStyle(
          fontSize: screenHeight / 44,
        ),
      );
    } else if (itemModel?.mood == 'Neutral') {
      return Text(
        'Neutral',
        style: TextStyle(
          fontSize: screenHeight / 44,
        ),
      );
    } else if (itemModel?.mood == 'Good') {
      return Text(
        'Good',
        style: TextStyle(
          fontSize: screenHeight / 44,
        ),
      );
    } else {
      return SizedBox(
        height: screenHeight / 44,
      );
    }
  }
}
