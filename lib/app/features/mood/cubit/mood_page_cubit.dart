import 'package:bloc/bloc.dart';
import 'package:journal/models/mood_item_model.dart';
import 'package:meta/meta.dart';

part 'mood_page_state.dart';

class MoodPageCubit extends Cubit<MoodPageState> {
  MoodPageCubit()
      : super(
          const MoodPageState(
            itemModel: null,
          ),
        );

  Future<void> start(DateTime day) async {
    emit(
      MoodPageState(
        itemModel: MoodItemModel(
          mood: 'Neutral',
          note: '',
          date: day,
        ),
      ),
    );
  }

  Future<void> setMood(String? mood, String? note, DateTime? day) async {
    emit(
      MoodPageState(
        itemModel: MoodItemModel(
          mood: mood,
          note: note,
          date: day,
        ),
      ),
    );
  }
}
