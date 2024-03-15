import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:journal/models/mood_item_model.dart';
import 'package:journal/repositories/mood_item_repository.dart';
import 'package:meta/meta.dart';

part 'mood_page_state.dart';

class MoodPageCubit extends Cubit<MoodPageState> {
  MoodPageCubit(this._itemRepository)
      : super(
          const MoodPageState(
            errorMessage: '',
            newItemModel: null,
            itemModels: [],
          ),
        );

  final MoodItemRepository _itemRepository;

  StreamSubscription? _streamSubscription;

  FutureOr<void> start() async {
    emit(
      const MoodPageState(
        errorMessage: '',
        newItemModel: null,
        itemModels: [],
      ),
    );

    _streamSubscription = _itemRepository.getItemsStream().listen(
      (items) {
        emit(MoodPageState(
          errorMessage: '',
          newItemModel: null,
          itemModels: items,
        ));
      },
    );
  }

  void updateInApp({
    required String? mood,
    required String? note,
    required DateTime? date,}
  ) {
    emit(
      MoodPageState(
        errorMessage: '',
        newItemModel: MoodItemModel(
          id: state.newItemModel?.id,
          mood: mood ?? state.newItemModel?.mood,
          note: note ?? state.newItemModel?.note,
          date: date ?? state.newItemModel?.date,
        ),
        itemModels: state.itemModels,
      ),
    );
  }

  Future<void> getItemWithID(String id) async {
    final itemModel = await _itemRepository.get(id: id);
    emit(
      MoodPageState(
        errorMessage: '',
        itemModels: state.itemModels,
        newItemModel: itemModel,
      ),
    );
  }

  Future<void> getItemWithDate(DateTime date) async {
    final itemModel = await _itemRepository.getWithDate(date: date);
    if (itemModel.mood == null || itemModel.note == null || itemModel.date == null) {
      updateInApp(
        mood: itemModel.mood,
        note: itemModel.note,
        date: itemModel.date,
      );
    } else {
      emit(
        MoodPageState(
          errorMessage: '',
          newItemModel: itemModel,
          itemModels: state.itemModels,
        ),
      );
    }
  }

  // FutureOr<void> addMood(String? mood, String? note, DateTime? date) async {
  //   emit(
  //     MoodPageState(
  //       newItemModel: MoodItemModel(
  //         mood: mood,
  //         note: note,
  //         date: date,
  //       ),
  //       itemModels: state.itemModels,
  //     ),
  //   );
  // }

  FutureOr<void> add(String? mood, String? note, DateTime? date) async {
    // try {
    await _itemRepository.add(mood, note, date);
    // } catch (error) {
    //   emit(
    //     const MoodPageState(
    //       newItemModel: null,
    //       itemModels: [],
    //       //isLoading: false,
    //       //errormessage: error,
    //     ),
    //   );
    // }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
