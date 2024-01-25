import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mood_page_state.dart';

enum MoodEnum { bad, neutral, good }

class MoodPageCubit extends Cubit<MoodPageState> {
  MoodPageCubit()
      : super(
          const MoodPageState(
            moodEnum: null,
            note: null,
          ),
        );

  Future<void> start() async {
    emit(
      const MoodPageState(
        moodEnum: MoodEnum.neutral,
        note: '',
      ),
    );
  }

  Future<void> setMood(MoodEnum? mood, String? note) async {
    emit(
      MoodPageState(
        moodEnum: mood,
        note: note,
      ),
    );
  }
}
