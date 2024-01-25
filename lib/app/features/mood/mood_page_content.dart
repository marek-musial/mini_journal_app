import 'package:flutter/material.dart';
import 'package:journal/app/features/mood/cubit/mood_page_cubit.dart';
import 'package:journal/consts/color_schemes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BlocBuilder<MoodPageCubit, MoodPageState>(
          builder: (context, state) {
            MoodEnum? currentMood = context.read<MoodPageCubit>().state.moodEnum;
            switch (currentMood) {
              case MoodEnum.bad:
                return const Text('bad');
              case MoodEnum.neutral:
                return const Text('neutral');
              case MoodEnum.good:
                return const Text('good');
              case null:
                return const SizedBox(
                  height: 20,
                );
            }
          },
        ),
        BlocBuilder<MoodPageCubit, MoodPageState>(
          builder: (context, state) {
            String? note = context.read<MoodPageCubit>().state.note;
            if (note != null) {
              return Text(note);
            }
            return const SizedBox(
              height: 20,
            );
          },
        ),
      ],
    );
  }
}

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
          spacing: 8,
          overflowSpacing: 4,
          overflowAlignment: OverflowBarAlignment.center,
          children: [
            ChoiceChip(
              label: const Text('Bad'),
              selected: _value == 0,
              onSelected: (selected) {
                setState(() {
                  _value = selected ? 0 : null;
                  currentMood = MoodEnum.bad;
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
                  },
                );
              },
              selectedColor: Colors.green,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                context.read<MoodPageCubit>().setMood(currentMood, currentNote);
                controller.clear();
              },
              icon: const Icon(Icons.add),
            ),
            hintText: 'Short note',
          ),
          onChanged: (String? value) {
            currentNote = value;
          },
        ),
      ],
    );
  }
}
