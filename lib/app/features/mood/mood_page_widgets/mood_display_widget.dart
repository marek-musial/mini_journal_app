import 'package:flutter/material.dart';
import 'package:journal/app/features/mood/cubit/mood_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoodDisplay extends StatelessWidget {
  const MoodDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodPageCubit, MoodPageState>(
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
    );
  }
}
