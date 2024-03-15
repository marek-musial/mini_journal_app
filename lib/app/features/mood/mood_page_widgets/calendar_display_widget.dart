import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:journal/app/features/mood/cubit/mood_page_cubit.dart';
import 'package:journal/models/mood_item_model.dart';
import 'package:journal/themes/color_schemes.dart';
import 'package:journal/themes/screen_sizes.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDisplay extends StatefulWidget {
  const CalendarDisplay({
    required this.itemModel,
    super.key,
  });

  final MoodItemModel? itemModel;

  @override
  State<CalendarDisplay> createState() => _CalendarDisplayState();
}

class _CalendarDisplayState extends State<CalendarDisplay> {
  DateTime? _selectedDay;
  DateTime? _focusedDay = DateTime.now();
  DateTime? selectedDay;
  String? currentNote;
  String? currentMood;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    context.read<MoodPageCubit>().updateInApp(
          currentMood,
          currentNote,
          _selectedDay,
        );
  }

  @override
  Widget build(BuildContext context) {
    var defaultTextStyle = TextStyle(
      color: currentColorScheme.onSurface,
      fontSize: screenHeight / 44,
    );

    var grayedOutTextStyle = TextStyle(
      color: currentColorScheme.onSurfaceVariant,
      fontSize: screenHeight / 44,
    );

    var calendarStyle = CalendarStyle(
      defaultTextStyle: defaultTextStyle,
      weekendTextStyle: defaultTextStyle,
      outsideTextStyle: grayedOutTextStyle,
      disabledTextStyle: grayedOutTextStyle,
      selectedDecoration: BoxDecoration(
        color: currentColorScheme.primaryContainer,
        shape: BoxShape.circle,
      ),
      selectedTextStyle: TextStyle(
        color: defaultTextStyle.color,
        fontWeight: FontWeight.bold,
      ),
      todayDecoration: BoxDecoration(
        color: currentColorScheme.primaryContainer.withAlpha(120),
        shape: BoxShape.circle,
      ),
      todayTextStyle: TextStyle(
        color: defaultTextStyle.color,
      ),
    );

    var headerStyle = HeaderStyle(
      formatButtonVisible: false,
      titleCentered: true,
      titleTextStyle: defaultTextStyle,
      headerMargin: EdgeInsets.symmetric(
        vertical: screenHeight / 84,
        horizontal: screenWidth / 32,
      ),
      headerPadding: EdgeInsets.symmetric(
        horizontal: screenWidth / 32,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(screenWidth / 24),
        ),
        color: currentColorScheme.primaryContainer,
      ),
    );

    return TableCalendar(
      calendarStyle: calendarStyle,
      focusedDay: _focusedDay ?? DateTime.now(),
      firstDay: DateTime.now().subtract(const Duration(days: 365 * 10)),
      lastDay: DateTime.now(),
      daysOfWeekHeight: screenHeight / 40,
      rowHeight: screenHeight / 22,
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: headerStyle,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: defaultTextStyle,
        weekendStyle: defaultTextStyle,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: currentColorScheme.surfaceVariant.withAlpha(10),
        ),
      ),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: _onDaySelected,
      onPageChanged: _onPageChanged,
      // eventLoader: (day) {
      //   return _getMoodForDay(day);
      // },
    );
  }

  void _onPageChanged(DateTime focusedDay) {
    _focusedDay = focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(
      () {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        currentMood = context.read<MoodPageCubit>().state.newItemModel?.mood;
        // widget.itemModel?.mood;
        currentNote = context.read<MoodPageCubit>().state.newItemModel?.note;
        // widget.itemModel?.note;
        // context.read<MoodPageCubit>().add(
        //       currentMood,
        //       currentNote,
        //       selectedDay,
        //     );
        context.read<MoodPageCubit>().updateInApp(
              currentMood,
              currentNote,
              _selectedDay,
            );
        _getMoodForDay(selectedDay);
      },
    );
  }

  List<MoodItemModel> _getMoodForDay(DateTime day) {
    context.read<MoodPageCubit>().getItemWithDate(day);
    List<MoodItemModel> moods = [];
    moods.add(MoodItemModel(
      id: widget.itemModel?.id,
      mood: widget.itemModel?.mood,
      note: widget.itemModel?.note,
      date: widget.itemModel?.date,
    ));
    return moods;
  }
}
