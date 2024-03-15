import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:journal/app/features/mood/cubit/mood_page_cubit.dart';
import 'package:journal/repositories/mood_item_repository.dart';

class FAB extends StatelessWidget {
  const FAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoodPageCubit(MoodItemRepository()),
      child: FloatingActionButton(
        shape: const CircleBorder(side: BorderSide.none),
        child: const Icon(Icons.edit_calendar),
        onPressed: () {
          String? currentMood = context.read<MoodPageCubit>().state.newItemModel?.mood;
          String? currentNote = context.read<MoodPageCubit>().state.newItemModel?.note;
          DateTime? currentDate = context.read<MoodPageCubit>().state.newItemModel?.date;

          if (currentMood != null && currentNote != null && currentDate != null) {
            context.read<MoodPageCubit>().add(
                  currentMood,
                  currentNote,
                  currentDate,
                );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Fill all requred data'),
              ),
            );
          }
        },
      ),
    );
  }
}
