import 'package:flutter/material.dart';
import 'package:journal/themes/color_schemes.dart';
import 'package:journal/themes/screen_sizes.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDisplay extends StatefulWidget {
  const CalendarDisplay({
    super.key,
  });

  @override
  State<CalendarDisplay> createState() => _CalendarDisplayState();
}

class _CalendarDisplayState extends State<CalendarDisplay> {
  DateTime? _selectedDay;
  DateTime? _focusedDay;

  @override
  Widget build(BuildContext context) {
    var defaultTextStyle = TextStyle(
      color: currentColorScheme.onSurface,
    );

    var grayedOutTextStyle = TextStyle(
      color: currentColorScheme.onSurfaceVariant,
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
      headerMargin: EdgeInsets.symmetric(
        vertical: screenHeight / 64,
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
      daysOfWeekHeight: screenHeight / 32,
      rowHeight: screenHeight / 18,
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: headerStyle,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: _onDaySelected,
      onPageChanged: _onPageChanged,
    );
  }

  void _onPageChanged(focusedDay) {
    _focusedDay = focusedDay;
  }

  void _onDaySelected(selectedDay, focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }
}
