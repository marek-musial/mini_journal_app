import 'package:flutter/material.dart';
import 'package:journal/models/mood_item_model.dart';
import 'package:journal/themes/screen_sizes.dart';

class MessageDisplay extends StatelessWidget {
  const MessageDisplay({
    required this.itemModel,
    super.key,
  });

  final MoodItemModel? itemModel;

  @override
  Widget build(BuildContext context) {
    if (itemModel?.note != null) {
      return Text(
        'Because: ${itemModel!.note!}',
        style: TextStyle(
          fontSize: screenHeight / 44,
        ),
      );
    }
    return SizedBox(
      height: screenHeight / 44,
    );
  }
}
