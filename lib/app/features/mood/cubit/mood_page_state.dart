part of 'mood_page_cubit.dart';

@immutable
class MoodPageState {
  final MoodEnum? moodEnum;
  final String? note;

  const MoodPageState({
    required this.moodEnum,
    required this.note,
  });
}
