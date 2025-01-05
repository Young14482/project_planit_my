import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils.dart';

class CalendarBodyCalendar extends StatelessWidget {
  const CalendarBodyCalendar({
    super.key,
    required this.focusedDay,
    required this.selectedDay,
    required this.getEventsForDay,
    required this.onDaySelected,
    required this.onFormatChanged,
    required this.onPageChanged,
  });

  final DateTime focusedDay;
  final DateTime? selectedDay;
  final List<Event> Function(DateTime p1) getEventsForDay;
  final Function(DateTime p1, DateTime p2) onDaySelected;
  final Function(CalendarFormat p1) onFormatChanged;
  final Function(DateTime p1) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade100, // 달력 뒷배경 색깔
      child: TableCalendar<Event>(
        headerVisible: false,
        firstDay: DateTime(DateTime.now().year - 10, 1, 1), // 최소 날짜
        lastDay: DateTime(DateTime.now().year + 10, 12, 31), // 최대 날짜
        focusedDay: focusedDay,
        selectedDayPredicate: (day) => isSameDay(selectedDay, day),
        eventLoader: getEventsForDay,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        calendarStyle: CalendarStyle(
          selectedDecoration: BoxDecoration(
            color: Colors.blue, // 선택한 날짜 색깔
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: Colors.blue.shade200, // 당일 날짜 색깔
            shape: BoxShape.circle,
          ),
          markerDecoration: BoxDecoration(
            color: Colors.red, // 이벤트 마커 색상
            shape: BoxShape.circle,
          ),
        ),
        onDaySelected: onDaySelected,
        onFormatChanged: onFormatChanged,
        onPageChanged: onPageChanged,
      ),
    );
  }
}