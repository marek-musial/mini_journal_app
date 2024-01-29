import 'package:flutter/material.dart';
import 'package:journal/app/features/mood/cubit/mood_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:journal/themes/color_schemes.dart';
import 'package:journal/themes/screen_sizes.dart';

class MoodSelection extends StatefulWidget {
  const MoodSelection({
    super.key,
  });

  @override
  State<MoodSelection> createState() => _MoodSelectionState();
}

class _MoodSelectionState extends State<MoodSelection> {
  int? _value = 1;
  final controller = TextEditingController();
  MoodEnum? currentMood;
  String? currentNote;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OverflowBar(
          spacing: screenWidth / 32,
          overflowSpacing: screenWidth / 64,
          overflowAlignment: OverflowBarAlignment.center,
          children: [
            ChoiceChip(
              label: const Text('Bad'),
              selected: _value == 0,
              onSelected: (selected) {
                setState(() {
                  _value = selected ? 0 : null;
                  currentMood = MoodEnum.bad;
                  context.read<MoodPageCubit>().setMood(currentMood, currentNote);
                });
              },
              selectedColor: Colors.red,
            ),
            ChoiceChip(
              label: const Text('Neutral'),
              selected: _value == 1,
              onSelected: (selected) {
                setState(() {
                  _value = selected ? 1 : null;
                  currentMood = MoodEnum.neutral;
                  context.read<MoodPageCubit>().setMood(currentMood, currentNote);
                });
              },
              selectedColor: Colors.grey.shade700,
            ),
            ChoiceChip(
              label: const Text('Good'),
              selected: _value == 2,
              onSelected: (selected) {
                setState(
                  () {
                    _value = selected ? 2 : null;
                    currentMood = MoodEnum.good;
                    context.read<MoodPageCubit>().setMood(currentMood, currentNote);
                  },
                );
              },
              selectedColor: Colors.green,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight / 64,
            horizontal: screenWidth / 32,
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<MoodPageCubit>().setMood(currentMood, currentNote);
                  controller.clear();
                },
                icon: Icon(
                  Icons.add,
                  color: currentColorScheme.onPrimaryContainer,
                ),
              ),
              hintText: 'Short note',
            ),
            onChanged: (String? value) {
              currentNote = value;
            },
          ),
        ),
      ],
    );
  }
}
