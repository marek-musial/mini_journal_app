part of 'mood_page_cubit.dart';

@immutable
class MoodPageState {
  final String errorMessage;
  final MoodItemModel? newItemModel;
  final List<MoodItemModel>? itemModels;

  const MoodPageState({
    required this.errorMessage,
    required this.newItemModel,
    required this.itemModels,
  });
}
