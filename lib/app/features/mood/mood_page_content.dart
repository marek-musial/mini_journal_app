import 'package:flutter/material.dart';
import 'package:journal/consts/color_schemes.dart';

class MoodPageContent extends StatelessWidget {
  MoodPageContent({super.key});

  final bool selected = true;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.clear();
                    },
                    icon: const Icon(Icons.add),
                  ),
                  hintText: 'Short note',
                ),
                onChanged: (String value) {},
              ),
            ],
          ),
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

  @override
  Widget build(BuildContext context) {
    return OverflowBar(
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
            });
          },
          selectedColor: Colors.grey.shade700,
        ),
        ChoiceChip(
          label: const Text('Good'),
          selected: _value == 2,
          onSelected: (selected) {
            setState(() {
              _value = selected ? 2 : null;
            });
          },
          selectedColor: Colors.green,
        ),
      ],
    );
  }
}
