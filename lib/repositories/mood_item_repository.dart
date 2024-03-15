import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:journal/models/mood_item_model.dart';

final _moodsRef = FirebaseFirestore.instance.collection('moods');

class MoodItemRepository {
  Stream<List<MoodItemModel>> getItemsStream() {
    return _moodsRef.snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (item) {
            return MoodItemModel(
              id: item.id,
              mood: item['mood_type'],
              note: item['note'],
              date: (item['date'] as Timestamp).toDate(),
            );
          },
        ).toList();
      },
    );
  }

  Future<void> add(
    String? mood,
    String? note,
    DateTime? date,
  ) async {
    await _moodsRef.add({
      'mood_type': mood,
      'note': note,
      'date': date,
    });
  }

  Future<MoodItemModel> get({required String id}) async {
    // final userId = FirebaseAuth.instance.currentUser?.uid;
    // if (userId == null) {
    //   throw Exception('User is not logged in');
    // }
    final doc = await _moodsRef.doc(id).get();
    return MoodItemModel(
      id: doc.id,
      mood: doc['mood_type'],
      note: doc['note'],
      date: (doc['date'] as Timestamp).toDate(),
    );
  }

  ///currently returns only one of saved elements for the chosen date (TEMP SOLUTION)
  Future<MoodItemModel> getWithDate({required DateTime date}) async {
    // final userId = FirebaseAuth.instance.currentUser?.uid;
    // if (userId == null) {
    //   throw Exception('User is not logged in');
    // }

    var model = MoodItemModel(
      id: null,
      mood: null,
      note: null,
      date: null,
    );

    final query = await _moodsRef
    .where('date', isGreaterThanOrEqualTo: date)
    .where('date', isLessThan: date.add(const Duration(days: 1)))
    .get();
    if (query.docs.isEmpty) {
      return MoodItemModel(
        id: null,
        mood: '',
        note: '',
        date: date,
      );
    } else {
    if (query.docs == []) {
      print('query.docs is empty');
    }
    print(query.docs);
      for (var doc in query.docs) {
        model = MoodItemModel(
          id: doc.id,
          mood: doc['mood_type'],
          note: doc['note'],
          date: (doc['date'] as Timestamp).toDate(),
        );
      }
    }
    return model;
  }
}
