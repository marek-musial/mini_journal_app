import 'package:flutter/material.dart';
import 'package:journal/app/features/mood/cubit/mood_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageDisplay extends StatelessWidget {
  const MessageDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodPageCubit, MoodPageState>(
      builder: (context, state) {
        String? note = context.read<MoodPageCubit>().state.note;
        if (note != null) {
          return Text(note);
        }
        return const SizedBox(
          height: 20,
        );
      },
    );
  }
}
