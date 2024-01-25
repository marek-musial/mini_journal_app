import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mood_page_state.dart';

class MoodPageCubit extends Cubit<MoodPageState> {
  MoodPageCubit() : super(MoodPageState());
}
