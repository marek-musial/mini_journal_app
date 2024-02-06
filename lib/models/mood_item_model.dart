import 'package:intl/intl.dart';

class MoodItemModel {
  MoodItemModel({
    required this.mood,
    required this.note,
    required this.date,
  });

  final String? mood;
  final String? note;
  final DateTime? date;

  String dateFormatted() {
    return DateFormat.yMMMEd().format(date!);
  }
}
