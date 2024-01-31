import 'package:flutter/material.dart';
import 'package:journal/models/mood_item_model.dart';
import 'package:journal/themes/screen_sizes.dart';

class MoodDisplay extends StatelessWidget {
  const MoodDisplay({
    required this.itemModel,
    Key? key,
  }) : super(key: key);

  final MoodItemModel? itemModel;

  @override
  Widget build(BuildContext context) {
    switch (itemModel?.mood) {
      case MoodEnum.bad:
        return Text('bad',
            style: TextStyle(
              fontSize: screenHeight / 44,
            ));
      case MoodEnum.neutral:
        return Text('neutral',
            style: TextStyle(
              fontSize: screenHeight / 44,
            ));
      case MoodEnum.good:
        return Text(
          'good',
          style: TextStyle(
            fontSize: screenHeight / 44,
          ),
        );
      case null:
        return SizedBox(
          height: screenHeight / 44,
        );
    }
  }
}
