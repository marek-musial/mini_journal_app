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
  int? _chipSelected = 1;
  final controller = TextEditingController();
  String? currentMood;
  String? currentNote;
  DateTime? selectedDay;

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
              selected: _chipSelected == 0,
              onSelected: (selected) {
                setState(() {
                  selectedDay = context.read<MoodPageCubit>().state.itemModel?.date;
                  _chipSelected = selected ? 0 : null;
                  currentMood = 'Bad';
                  addMood();
                });
              },
              selectedColor: Colors.red,
            ),
            ChoiceChip(
              label: const Text('Neutral'),
              selected: _chipSelected == 1 || _chipSelected == null,
              onSelected: (selected) {
                setState(() {
                  selectedDay = context.read<MoodPageCubit>().state.itemModel?.date;
                  _chipSelected = selected ? 1 : null;
                  currentMood = 'Neutral';
                  addMood();
                });
              },
              selectedColor: Colors.grey.shade700,
            ),
            ChoiceChip(
              label: const Text('Good'),
              selected: _chipSelected == 2,
              onSelected: (selected) {
                setState(
                  () {
                    selectedDay = context.read<MoodPageCubit>().state.itemModel?.date;
                    _chipSelected = selected ? 2 : null;
                    currentMood = 'Good';
                    addMood();
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
                  selectedDay = context.read<MoodPageCubit>().state.itemModel?.date;
                  addMood();
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

  void addMood() {
    context.read<MoodPageCubit>().setMood(
          currentMood,
          currentNote,
          selectedDay,
        );
  }
}
