import 'package:flutter/material.dart';
import 'package:journal/consts/color_schemes.dart';
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
    return Flexible(
      flex: 5,
      child: TableCalendar(
        focusedDay: _focusedDay ?? DateTime.now(),
        firstDay: DateTime.now().subtract(const Duration(days: 365 * 10)),
        lastDay: DateTime.now(),
        daysOfWeekHeight: 16,
        rowHeight: 32,
        startingDayOfWeek: StartingDayOfWeek.monday,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          headerMargin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            color: currentColorScheme.primaryContainer,
          ),
        ),
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
